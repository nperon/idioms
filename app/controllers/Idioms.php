<?php
    class Idioms extends Controller {
        public function __construct() {
            if (!isLoggedIn()) {
                redirect('users/login');
            }
            $this->idiomModel = $this->model('Idiom');
            $this->userModel = $this->model('User');
            $this->letterModel = $this->model('Letter');
            $this->meaningModel = $this->model('Meaning');
        }

        public function index() {
            // Get idioms
            $idioms = $this->idiomModel->getIdioms(); 
            $letters = $this->letterModel->getLetters();
            $usedLetters = $this->idiomModel->getUsedLetters();
            $meanings = $this->meaningModel->getMeanings();
            $data = [
                'idioms' => $idioms,
                'letters' => $letters,
                'usedLetters' => $usedLetters,
                'meanings' => $meanings
            ];
            $this->view('idioms/index', $data);
        }

        public function add() {
            $letters = $this->letterModel->getLetters();
            if ($_SERVER['REQUEST_METHOD'] == 'POST') {
                // Sanitize POST array
                $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);
                $data = [
                    'letters' => $letters,
                    'content' => trim($_POST['content']),
                    'letter_code' => trim($_POST['letter_code']),
                    'user_id' => $_SESSION['user_id'],
                    'content_err' => '',
                    'letter_err' => ''
                ];

                // Validate data
                if (empty($data['content'])) {
                    $data['content_err'] = 'Please enter idiom';
                }
                if ($data['letter_code'] == 'NULL') {
                    $data['letter_err'] = 'Please select sorting letter';
                }

                // Make sure no errors
                if (empty($data['content_err']) && empty($data['letter_err'])) {
                    // Validated
                    forEach($letters as $letter) { 
                        if ( $letter->code == $data['letter_code'] ) {
                            $data['letter_id'] = $letter->id;
                        }
                    }

                    if ($this->idiomModel->addIdiom($data)) {
                        flash('idiom_message', 'Idiom Added');
                        redirect('idioms');
                    } else {
                        die('Something went wrong');
                    }
                } else {
                    // Load view with errors
                    $this->view('idioms/add', $data);
                }

            } else {
                $data = [
                    'letters' => $letters,
                    'content' => '',
                    'letter_code' => '',
                    'letter_err' => ''
                ];
                $this->view('idioms/add', $data);
            }
        }

        public function show($id) {
            $post = $this->postModel->getPostById($id);
            $user = $this->userModel->getUserById($post->user_id);

            $data = [
                'post' => $post,
                'user' => $user
            ];
            $this->view('posts/show', $data);
        }
    }
?>