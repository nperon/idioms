<?php
    class Letter {
        private $db;

        public function __construct() {
            $this->db = Database::getDBHInstance();
        }

        public function getLetters() {
            Database::query('SELECT *,
                                id,
                                code,
                                name,
                                description
                                FROM ref_letter
                                ORDER BY name ASC
                            ');
            $results = Database::resultSet();
            return $results;
        }
    }
?>