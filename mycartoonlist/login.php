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
					$query=mysqli_query($connect, "SELECT users.userID,users.password FROM users WHERE users.login='".$_POST['login']."'");
					if(mysqli_num_rows($query)==1)
					{
						$a=mysqli_fetch_array($query);
						if($a['password'] == $_POST['password'])
						{
							setcookie('user',$a['userID'],time()+3600,"/");
							header("Location: ".$_COOKIE['site']);
						}
						else
						{
							echo "<script type='text/JavaScript'> alert('Podano złe dane'); </script>";
						}
					}
					else
					{
						echo "<script type='text/JavaScript'> alert('Podano użytkownik nie istnieje'); </script>";
					}
					mysqli_close($connect);
				}
			}
		?>
		<form style="width:200px; height:100px; position: fixed; top: 50%; left: 50%; margin-top: -100px;  margin-left: -200px;" action="login.php" method="post">
			login: <input type="text" name="login"><br/><br/>
			hasło: <input type="password" name="password"><br/><br/>
			<input type="submit" value="Zaloguj">
		</form>
	</body>
</html>