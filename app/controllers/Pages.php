<?php
    class Pages extends Controller {
        public function __construct() {
        }

        public function index() {
            if (isLoggedIn()) {
                redirect('posts');
            }
            $data = [
                'title' => 'Idioms',
                'description' => 'Social network to exchange on idiomatic expressions.'
            ];

            $this->view('pages/index', $data);
        }

        public function about() {
            $data = [
                'title' => 'About Us',
                'description' => 'App to share idiomatic expressions and their meanings with other users.'
            ];
            $this->view('pages/about', $data);
        }
    }
?>