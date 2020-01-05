<?php
    class Post {
        private $db;

        public function __construct() {
            $this->db = new Database;
        }

        public function getPosts() {
            $this->db->query('SELECT *,
                                post.id as postId,
                                user.id as userId,
                                post.created_at as postCreated,
                                user.created_at as userCreated
                                FROM post
                                INNER JOIN user
                                ON post.user_id = user.id
                                ORDER BY post.created_at DESC
                            ');
            $results = $this->db->resultSet();
            return $results;
        }

        public function addPost($data) {
            $this->db->query('INSERT INTO post(title, user_id, body) VALUES(:title, :user_id, :body)');
            // Bind values
            $this->db->bind(':title', $data['title']);
            $this->db->bind(':user_id', $data['user_id']);
            $this->db->bind(':body', $data['body']);
            // Execute
            if ($this->db->execute()) {
                return true;
            } else {
                return false;
            }
        }

        public function updatePost($data) {
            $this->db->query('UPDATE post SET title = :title, body = :body WHERE id = :id');
            // Bind values
            $this->db->bind(':id', $data['id']);
            $this->db->bind(':title', $data['title']);
            $this->db->bind(':body', $data['body']);
            // Execute
            if ($this->db->execute()) {
                return true;
            } else {
                return false;
            }
        }

        public function getPostById($id) {
            $this->db->query('SELECT * FROM post WHERE id = :id');
            $this->db->bind(':id', $id);
            $row = $this->db->single();
            return $row;
        }

        public function deletePost($id) {
            $this->db->query('DELETE FROM post WHERE id = :id');
            $this->db->bind(':id', $id);
            // Execute
            if ($this->db->execute()) {
                return true;
            } else {
                return false;
            }
        }

    }
?>