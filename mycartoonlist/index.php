<!DOCTYPE html>
<html lang="pl">
	<head>
		<title>My Cartoon List - Michał Bej JavaSrcipt Project</title>
		<meta charset="utf-8"/>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<link rel="stylesheet" href="style.css">
	</head>
	
	<body onLoad="zegar()" style="background-image: url(background.png); height:200%">
		<?php
			if(!isset($_COOKIE['user']))
				setcookie('user',2,time()+3600,"/");
			setcookie('site',"index.php",time()+3600,"/");
		?>
		<script type="text/javascript" src="script.js"></script>
		<div id="container">
			
			<div id="left">
			
			</div>
			
			<div id="center" style="background-color:#222222;">
			
				<div id="top">
				
					<div id="zegarek"></div>
					<div id="logo">
						<a href="index.php"><img src="logo.png" alt="logo"></img></a>
					</div>
					<div id="login">
						<?php
							if(isset($_COOKIE['user']))
							{
								if($_COOKIE['user'] != 2)
								{
									$connect=mysqli_connect('localhost','root','','mycartoonlist');
									$query=mysqli_query($connect, "SELECT users.login FROM users WHERE userID=".$_COOKIE['user']);
									$a=mysqli_fetch_array($query);
									echo "Witaj ".$a['login']." <a class='clearhref' href='unlogin.php'> Wyloguj </a>";
									mysqli_close($connect);
								}	
								else
								{
									echo "<a class='clearhref' href='login.php' style='margin-right:10px;'>Zaloguj</a>";
									echo "<a class='clearhref' href='register.php'>Zarejestruj</a>";
								}
							}
							else
							{
								echo "<a class='clearhref' href='login.php' style='margin-right:10px;'>Zaloguj</a>";
								echo "<a class='clearhref' href='register.php'>Zarejestruj</a>";
							}
						?>
					</div>
					
				</div>
								
				<div id="nav">
					<table>
						<tr>
							<th class="menu"><a class="clearhref" href="index.php">Start</a></th>
							<th class="menu"><a class="clearhref" href="mylist.php">Moja Lista</a></th>
							<th class="menu"><a class="clearhref" href="list.php">Lista Serii</a></th>
						</tr>
					</table>
				</div>
				
				<div id="wpis">
					<table style="height:100%; width:100%; text-align:center;">
						<tr>
							<td style="width:100%; height:10%; text-weight:bold; font-size:30px; text-align:center;" colspan="4">Nowe wpisy</td>
						</tr>
						<tr><td colspan='4' style='height:10%;'></td></tr>
					
						<?php
							$connect=mysqli_connect('localhost','root','','mycartoonlist');
							
							$query=mysqli_query($connect, "SELECT content.contentName AS 'name',content.contentDescription AS 'description'
							,content.contentPicture AS 'picture' FROM content ORDER BY content.contentID DESC LIMIT 2");

							while($a=mysqli_fetch_array($query))
							{
								
								echo "<tr>";
								echo "<td rowspan='2' style='width:5%; height:40%;'></td>";
								echo "<td style='width:45%; max-height:10%; text-weight:bold; font-size:20px;'>".$a['name']."</td>";
								echo "<td rowspan='2' style='width:45%; max-height:40%; text-align:center;'><img style='max-height:100%; max-width:55%' src='series_resources/".$a['picture']."' alt='".$a['picture']."' ></td>";
								echo "<td rowspan='2' style='width:5%;'></td>";
								echo "</tr>";

								echo "<tr>";
								echo "<td style='width:45%; max-height:30%; font-size:14px;'>".$a['description']."</td>";
								echo "</tr>";

								echo "<tr>";
								echo "<td colspan='4' style='height:10px;'></td>";
								echo "</tr>";
							}
							
							mysqli_close($connect);
						?>
					</table>
				
				</div>
				
			</div>
			
			<div id="right">
			
			</div>
			
			<div style="clear:both;"></div>
			
		</div>
	</body>
</html>