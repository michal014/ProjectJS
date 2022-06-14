<?php
    $name = $_POST['add'];
    $user = $_COOKIE['user'];
    $connect=mysqli_connect('localhost','root','','mycartoonlist');
	$query=mysqli_query($connect, "SELECT * FROM contentrelation WHERE contentID=(SELECT contentID FROM content WHERE contentName='".$name."') AND userID=".$user);
	if(mysqli_num_rows($query)==0)
	{
		mysqli_query($connect, "INSERT INTO contentrelation VALUES ((SELECT contentID FROM content WHERE contentName='".$name."'),".$user.",0,0,0)");
		header("Location: list.php");	
    }
	mysqli_close($connect);
?>