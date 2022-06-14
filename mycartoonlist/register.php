<!DOCTYPE html>
<html lang="pl">
	<head>
		<title>My Cartoon List - Michał Bej JavaSrcipt Project</title>
		<meta charset="utf-8"/>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<link rel="stylesheet" href="style.css">
	</head>
	
	<body>
		<?php
			if(isset($_POST['login']) && $_POST['login']!="")
			{
				if(isset($_POST['password']) && $_POST['password']!="")
				{
					$connect=mysqli_connect('localhost','root','','mycartoonlist');
					$query=mysqli_query($connect, "SELECT users.userID FROM users WHERE users.login='".$_POST['login']."'");
					if(mysqli_num_rows($query)==0)
					{
						mysqli_query($connect, "INSERT INTO users VALUES (NULL,'".$_POST['login']."', '".$_POST['password']."', '4')");
						header("Location: ".$_COOKIE['site']);
					}
					else
					{
						echo "<script type='text/JavaScript'> alert('Podany użytkownik już istniejeo'); </script>";
					}
					mysqli_close($connect);
				}
			}
		?>
		<form style="width:200px; height:100px; position: fixed; top: 50%; left: 50%; margin-top: -100px;  margin-left: -200px;" action="register.php" method="post">
			login: <input type="text" name="login"><br/><br/>
			hasło: <input type="password" name="password"><br/><br/>
			<input type="submit" value="Zarejestruj">
		</form>
	</body>
</html>