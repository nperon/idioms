<?php
    class LanguageRegister {
        private $db;

        public function __construct() {
            $this->db = Database::getDBHInstance();
        }

        public function getLanguageRegisters() {
            Database::query('SELECT *,
                                id,
                                code,
                                name,
                                description
                                FROM ref_language_register
                                ORDER BY name ASC
                            ');
            $results = Database::resultSet();
            return $results;
        }
    }
?>