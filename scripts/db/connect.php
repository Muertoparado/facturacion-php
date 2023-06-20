<?php 
   /* // namespace App;
    class connect extends credentials{
        private $conn;
        private $settings;
        public function __construct($settings) {
            $this->settings = $settings;
        }
        
        public function getConnection($dbKey) {
            $dbConfig = $this->settings[$dbKey];
            $this->conn = null;
           // $dsn = "{$dbConfig['driver']}:host={$dbConfig['host']};dbname={$dbConfig['database']};charset={$dbConfig['charset']}";
            $dsn = "{$dbConfig['driver']}:host={$dbConfig['host']};dbname={$dbConfig['database']}";
            try{
                $this->conn = new \PDO($dsn, $dbConfig['username'], $dbConfig['password'], $dbConfig['flags']);
                echo 'ok';
            }catch(\PDOException $exception){
                $error=[[
                    'error' => $exception->getMessage(),
                    'message' => 'Error al momento de establecer conexion'
                ]];
                return $error;
            }
            return $this->conn;
        }

    } */

    interface environments{
        public function __get($name);
    }
    class connect extends credentials implements environments{
        protected $conx;
        function __construct(private $driver = "mysql",  private $port = 3306){
            try {
                $this->conx = new PDO($this->driver.":host=".$this->__get('host').";
                port=".$this->port.";
                dbname=".$this->__get('dbname').";
                user=".$this->user.";
                password=".$this->password);
                $this->conx->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
                echo "ok";
            } catch (\PDOException $e) {
                print_r($e->getMessage());
                $this->conx = $e->getMessage();
            }
        }
    }
?>