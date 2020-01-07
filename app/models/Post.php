<?php
    class Post {
        private $db;

        public function __construct() {
            $this->db = Database::getDBHInstance();
        }

        public function getPosts() {
            Database::query('SELECT *,
                                post.id as postId,
                                user.id as userId,
                                post.created_at as postCreated,
                                user.created_at as userCreated
                                FROM post
                                INNER JOIN user
                                ON post.user_id = user.id
                                ORDER BY post.created_at DESC
                            ');
            $results = Database::resultSet();
            return $results;
        }

        public function addPost($data) {
            Database::query('INSERT INTO post(title, user_id, body) VALUES(:title, :user_id, :body)');
            // Bind values
            Database::bind(':title', $data['title']);
            Database::bind(':user_id', $data['user_id']);
            Database::bind(':body', $data['body']);
            // Execute
            if (Database::execute()) {
                return true;
            } else {
                return false;
            }
        }

        public function updatePost($data) {
            Database::query('UPDATE post SET title = :title, body = :body WHERE id = :id');
            // Bind values
            Database::bind(':id', $data['id']);
            Database::bind(':title', $data['title']);
            Database::bind(':body', $data['body']);
            // Execute
            if (Database::execute()) {
                return true;
            } else {
                return false;
            }
        }

        public function getPostById($id) {
            Database::query('SELECT * FROM post WHERE id = :id');
            Database::bind(':id', $id);
            $row = Database::single();
            return $row;
        }

        public function deletePost($id) {
            Database::query('DELETE FROM post WHERE id = :id');
            Database::bind(':id', $id);
            // Execute
            if (Database::execute()) {
                return true;
            } else {
                return false;
            }
        }

    }
?>