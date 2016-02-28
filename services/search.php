<?php

require_once("Rest.inc.php");

class search extends REST {

	private $dbh = NULL;

	public function __construct(){
			parent::__construct();			
			$this->dbConnect();			
	}
	
	function dbconnect() {
		$server="localhost";$user="root";$pass="";
		$this->dbh = new PDO("mysql:host=$server;dbname=db_columbia_compcenter", $user, $pass);
	}

	public function processApi(){
			$func = strtolower(trim(str_replace("/","",$_REQUEST['x'])));
			if((int)method_exists($this,$func) > 0)
				$this->$func();
			else
				$this->response('',404); // If the method not exist with in this class "Page not found".
		}

	private function searchJO(){
		$data = file_get_contents("php://input");
		$objData = json_decode($data);

		$query = 'SELECT * FROM tbl_joborder WHERE jo_no="'. $objData->data .'" AND jo_lname="'. $objData->lname .'"';
		$stmt = $this->dbh->prepare( $query );
		$stmt->execute();
		$result = $stmt->fetch( PDO::FETCH_ASSOC );
		//$result = json_encode( $result1 );
		$response = array();

		if ($result != NULL) {
			$response['jo_no'] = $result['jo_no'];
			$response['jo_fullname'] = $result['jo_fname'] . " " . $result['jo_lname'];
			$response['jo_date'] = $result['jo_date'];
			if ($result['jo_status'] == 1 ) {
				$response['status'] = "Finished since " . $result['jo_finishedDate'];
			}
			else if ($result['jo_status'] == 2 ) {
				$response['status'] = "Pending";
			}
			else if ($result['jo_status'] == 3 ) {
				$response['status'] = "Picked-up on " . $result['jo_picked-upDate'];
			}
			//$response['status'] = $result['jo_no'];
			//$response['jo_no'] = $result['jo_no'];
		} else {
			$response['jo_no'] = "No record found.";
			$response['jo_fullname'] = "";
			$response['jo_date'] = "";
			$response['status'] = "";
		}

		$json = json_encode( $response );
		echo '[' . $json . ']';
	}
	
	private function joDetails(){
		$data = file_get_contents("php://input");
		$objData = json_decode($data);
		
		$query = 'SELECT * FROM tbl_jobdetails WHERE jo_no="'. $objData->data .'" AND jod_removed=0';
		$stmt = $this->dbh->prepare( $query );
		$stmt->execute();
		$result = $stmt->fetchAll( PDO::FETCH_ASSOC );
		$response = array();
		
		$json = json_encode( $result );
		echo $json;

	}
	
	private function joServiceReport(){
		$data = file_get_contents("php://input");
		$objData = json_decode($data);
		
		$query = 'SELECT * FROM tbl_servicereport WHERE jo_no="'. $objData->data .'" AND sr_removed=0';
		$stmt = $this->dbh->prepare( $query );
		$stmt->execute();
		$result = $stmt->fetchAll( PDO::FETCH_ASSOC );
		$response = array();

		$json = json_encode( $result );
		echo $json;
	}
	
	private function srTotals(){
		$data = file_get_contents("php://input");
		$objData = json_decode($data);
		$total = 0;
		$query = 'SELECT * FROM tbl_servicereport WHERE jo_no="'. $objData->data .'" AND sr_removed=0';
		$stmt = $this->dbh->prepare( $query );
		$stmt->execute();
		$result = array();
		$x=0;
		while($row = $stmt->fetch( PDO::FETCH_ASSOC )){
			$total += $row['sr_amount'];
			
			$x+=1;
		}
		$result['totals'] = "Php " . number_format($total, 2, ".", ",");
		$json = json_encode( $result );
		echo '[' . $json . ']';
	}
	
	
}


$api = new search;
$api->processApi();


?>