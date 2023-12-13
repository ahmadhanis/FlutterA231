<?php
//error_reporting(0);
include_once("dbconnect.php");
$title = $_GET['title'];

if ($title == "All"){
    $sqlloadbooks = "SELECT * FROM `tbl_books`";
}else{
    $sqlloadbooks = "SELECT * FROM `tbl_books` WHERE `book_title` LIKE '%$title%'";
}

$result = $conn->query($sqlloadbooks);
if ($result->num_rows > 0) {
    $booklist["books"] = array();
    while ($row = $result->fetch_assoc()) {
        $book = array();
        $book['book_id'] = $row['book_id'];
        $book['user_id'] = $row['user_id'];
        $book['book_isbn'] = $row['book_isbn'];
        $book['book_title'] = $row['book_title'];
        $book['book_desc'] = $row['book_desc'];
        $book['book_author'] = $row['book_author'];
        $book['book_status'] = $row['book_status'];
        $book['book_price'] = $row['book_price'];
        $book['book_qty'] = $row['book_qty'];
        $book['book_qty'] = $row['book_qty'];
        $book['book_date'] = $row['book_date'];
        array_push( $booklist["books"],$book);
    }
    $response = array('status' => 'success', 'data' => $booklist);
    sendJsonResponse($response);
}else{
	$response = array('status' => 'failed', 'data' => null);
	sendJsonResponse($response);
}


function sendJsonResponse($sentArray)
{
    header('Content-Type: application/json');
    echo json_encode($sentArray);
}

?>