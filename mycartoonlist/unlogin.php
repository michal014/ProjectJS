<?php
    setcookie('user',2,time()+3600,"/");
    header("Location: ".$_COOKIE['site']);
?>