<?php
    class Meaning {
        private $db;

        public function __construct() {
            $this->db = Database::getDBHInstance();
        }

        public function getMeanings() {
            Database::query('SELECT *,
                                meaning.id as meaningId,
                                meaning.content as meaningContent,
                                ref_language_register.code as languageRegisterCode,
                                ref_language_register.name as languageRegisterName,
                                user.id as userId,
                                user.name as userName,
                                idiom.id as idiomId,
                                meaning.created_at as meaningCreated
                                FROM meaning
                                INNER JOIN user ON meaning.user_id = user.id
                                INNER JOIN ref_language_register ON meaning.language_register_id = ref_language_register.id
                                INNER JOIN idiom ON meaning.idiom_id = idiom.id
                                ORDER BY meaningContent ASC
                            ');
            $results = Database::resultSet();
            return $results;
        }
    }
?>