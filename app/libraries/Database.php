<?php
    /**
     * PDO i.e. PHP Data Object class
     * Connect to database
     * Create prepared statements
     * Bind values
     * Return rows and results
     */
    class Database {
        private static $host = DB_HOST;
        private static $user = DB_USER;
        private static $pass = DB_PASS;
        private static $dbname = DB_NAME;

        /**
         * db handler, statement and error
         */
        private static $dbh = null;
        private static $stmt = null;
        private static $error;

        private function __construct() {
            // Set DSN
            $dsn = 'mysql:host=' . self::$host . ';dbname=' . self::$dbname;
            $options = array(
                PDO::ATTR_PERSISTENT => true,
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            );
            // Create PDO instance
            try {
                self::$dbh = new PDO($dsn, self::$user, self::$pass, $options);
            } catch(PDOException $e) {
                self::$error = $e->getMessage();
                echo self::$error;
            }
        }

        // Class Database instanciates a $dbh singleton
        public static function getDBHInstance() {
            if (self::$dbh == null) {
                new Database();
            }
            return self::$dbh;
        }

        // Prepare statement with query
        public static function query($sql) {
            self::$stmt = self::$dbh->prepare($sql);
        }

        // Bind values
        public static function bind($param, $value, $type = null) {
            if (is_null($type)) {
                switch(true) {
                    case is_int($value):
                        $type = PDO::PARAM_INT;
                        break; 
                    case is_bool($value):
                        $type = PDO::PARAM_BOOL;
                        break; 
                    case is_null($value):
                        $type = PDO::PARAM_NULL;
                        break; 
                    default:
                        $type = PDO::PARAM_STR;
                }
            }
            self::$stmt->bindValue($param, $value, $type);
        }

        // Execute the prepared statement
        public static function execute() {
            return self::$stmt->execute();
        }

        // get result set as array of objects
        public static function resultSet() {
            self::$stmt->execute();
            return self::$stmt->fetchAll(PDO::FETCH_OBJ);
        }

        // Get single record as object
        public static function single() {
            self::$stmt->execute();
            return self::$stmt->fetch(PDO::FETCH_OBJ);
        }

        // Get row count
        public static function rowCount() {
            return self::$stmt->rowCount();
        }
 
    }
?>