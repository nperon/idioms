<?php
    class Idiom {
        private $db;

        public function __construct() {
            $this->db = Database::getDBHInstance();
        }

        public function getIdioms() {
            Database::query('SELECT *,
                                idiom.id as idiomId,
                                idiom.content as idiomContent,
                                ref_letter.code as idiomLetterCode,
                                ref_letter.name as idiomLetterName,
                                user.id as userId,
                                user.name as userName,
                                idiom.created_at as idiomCreated
                                FROM idiom
                                INNER JOIN user ON idiom.user_id = user.id
                                INNER JOIN ref_letter ON idiom.letter_id = ref_letter.id
                                ORDER BY idiomContent ASC
                            ');
            $results = Database::resultSet();
            return $results;
        }

        public function getUsedLetters() {
            Database::query('SELECT *,
                                ref_letter.id as letterId,
                                ref_letter.code as letterCode,
                                ref_letter.name as letterName,
                                ref_letter.description as letterDescription
                                FROM ref_letter
                                JOIN idiom ON idiom.letter_id = ref_letter.id
                                GROUP BY letterCode
                                ORDER BY letterCode ASC
                            ');
            $results = Database::resultSet();
            return $results;
        }

        public function addIdiom($data) {
            Database::query('INSERT INTO idiom(content, user_id, letter_id) VALUES(:content, :user_id, :letter_id)');
            // Bind values
            Database::bind(':content', $data['content']);
            Database::bind(':user_id', $data['user_id']);
            Database::bind(':letter_id', $data['letter_id']);
            // Execute
            if (Database::execute()) {
                return true;
            } else {
                return false;
            }
        }

        public function updateIdiom($data) {
            Database::query('UPDATE idiom SET content = :content, letter_id = :letter_id WHERE id = :id');
            // Bind values
            Database::bind(':id', $data['id']);
            Database::bind(':content', $data['content']);
            Database::bind(':letter_id', $data['letter_id']);
            // Execute
            if (Database::execute()) {
                return true;
            } else {
                return false;
            }
        }

        public function getIdiomById($id) {
            Database::query('SELECT * FROM idiom WHERE id = :id');
            Database::bind(':id', $id);
            $row = Database::single();
            return $row;
        }

        public function deleteIdom($id) {
            Database::query('DELETE FROM idiom WHERE id = :id');
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