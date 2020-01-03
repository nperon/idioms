<?php
    class Pages extends Controller {
        public function __construct() {
        }

        public function index() {
            $data = [
                'title' => 'This is Traversy MVC framework.',
            ];

            $this->view('pages/index', $data);
        }

        public function about() {
            $data = [
                'title' => 'About Us'
            ];
            $this->view('pages/about', $data);
        }
    }
?>