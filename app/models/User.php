<?php
    class User {
        private $db;

        public function __construct() {
            $this->db = Database::getDBHInstance();
        }

        // Register User
        public function register($data) {
            Database::query('INSERT INTO user(name, email, password) VALUES(:name, :email, :password)');
            // Bind values
            Database::bind(':name', $data['name']);
            Database::bind(':email', $data['email']);
            Database::bind(':password', $data['password']);
            // Execute
            if (Database::execute()) {
                return true;
            } else {
                return false;
            }
        }

        // Login user
        public function login($email, $password) {
            Database::query('SELECT * FROM user WHERE email = :email');
            Database::bind(':email', $email);
            $row = Database::single();
            $hashed_password = $row->password;
            if (password_verify($password, $hashed_password)) {
                return $row;
            } else {
                return false;
            }
        }

        // Find user by email
        public function findUserByEmail($email) {
            Database::query("SELECT * FROM user WHERE email = :email");
            // Bind value
            Database::bind(':email', $email);
            $row = Database::single();

            // Check row
            if (Database::rowCount() > 0) {
                return true;
            } else { 
                return false; 
            }
        }

        // Find user by email
        public function getUserById($id) {
            Database::query("SELECT * FROM user WHERE id = :id");
            // Bind value
            Database::bind(':id', $id);
            $row = Database::single();
            return $row;
        }
    }
?>