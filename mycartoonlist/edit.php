<?php
    if(isset($_POST['delete']))
    {
        $connect=mysqli_connect('localhost','root','','mycartoonlist');
        $query=mysqli_query($connect, "DELETE FROM contentrelation WHERE contentID=(SELECT contentID FROM content WHERE contentName='".$_POST['name']."') AND userID=".$_COOKIE['user']);
        mysqli_close($connect);
        header("Location: mylist.php");
    }
    else
    {
        if(isset($_POST['delete']))
            $delete=1;
        else
            $delete=0;
        echo $delete;

        $connect=mysqli_connect('localhost','root','','mycartoonlist');
        $query=mysqli_query($connect, "UPDATE contentrelation SET rate = ".$_POST['rate'].", progress = ".$_POST['progress'].", status = ".$_POST['status']." WHERE contentID=(SELECT contentID FROM content WHERE contentName='".$_POST['name']."') AND userID=".$_COOKIE['user']);
        mysqli_close($connect);
        header("Location: mylist.php");
    }
?>