<!DOCTYPE html>
<html lang="pl">
	<head>
		<title>My Cartoon List - Michał Bej JavaSrcipt Project</title>
		<meta charset="utf-8"/>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<link rel="stylesheet" href="style.css">
	</head>
	
	<body onLoad="zegar()" style="background-image: url(background.png); height:400%;">
		<?php
			if(!isset($_COOKIE['user']))
				setcookie('user',2,time()+3600,"/");
			setcookie('site',"mylist.php",time()+3600,"/");
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

				<div id="mylist">
					<table style="width:100%; table-layout:fixed; text-align:center; border-top:solid 1px #1d7c35; border-bottom:solid 1px #1d7c35;">
					<tr><td style="width:10%; border-left:solid 1px #1d7c35; border-right:solid 1px #1d7c35;">#</td>
					<td style="width:15%; border-right:solid 1px #1d7c35;">Nazwa</td>
					<td style="width:12%; border-right:solid 1px #1d7c35;">Postęp</td>
					<td style="width:9%; border-right:solid 1px #1d7c35;">Ocena</td>
					<td style="width:14%; border-right:solid 1px #1d7c35;">Status</td>
					<td style="width:15%; border-right:solid 1px #1d7c35;">Zdjęcie</td>
					<td style="width:15%; border-right:solid 1px #1d7c35;">Usuń?</td>
					<td style="width:10%; border-right:solid 1px #1d7c35;">Zapisz</td></tr>
					<?php
						$connect=mysqli_connect('localhost','root','','mycartoonlist');
						$i=0;
						if(isset($_COOKIE['user']))
						{
							$query=mysqli_query($connect, "SELECT content.contentName AS 'name',contentrelation.progress AS 'progress',
							content.contentNumberOfEpisodes AS 'episodes',contentrelation.rate AS 'rate',contentrelation.status AS 'status',
							content.contentPicture AS 'picture'FROM content JOIN contentrelation ON 
							content.contentID=contentrelation.contentID WHERE contentrelation.userID=".$_COOKIE['user']);

							while($a=mysqli_fetch_array($query))
							{
								$i++;
								echo "<form action='edit.php' method='post'>";
								echo "<tr><td style='width:10%; border-top:solid 1px #1d7c35; border-left:solid 1px #1d7c35; border-right:solid 1px #1d7c35;'>".$i."</td>";
								echo "<td style='width:15%; border-top:solid 1px #1d7c35; border-right:solid 1px #1d7c35; word-wrap:break-word;'><input class='add' type='text' name='name' size='10' readonly value='".$a['name']."'/></td>";
								echo "<td style='width:13%; border-top:solid 1px #1d7c35; border-right:solid 1px #1d7c35;'><input style='width:20px; -moz-appearance: textfield;' class='edit' type='number' name='progress' min='0' max=".$a['episodes']." value='".$a['progress']."'/> / ".$a['episodes']."</td>";
								echo "<td style='width:7%; border-top:solid 1px #1d7c35; border-right:solid 1px #1d7c35;'><input style='width:20px; -moz-appearance: textfield;' class='edit' type='number' name='rate' max='10' min='0' value='".$a['rate']."'/> / 10</td>";
								if ($a['progress'] >= $a['episodes'])
									{
									echo "<td style='width:15%; border-top:solid 1px #1d7c35; border-right:solid 1px #1d7c35; word-wrap:break-word;'><input class='add' type='text' size='10' readonly value='Obejrzane'/></td>";
									echo "<input type='hidden' value='1' name='status'/>";
									}
								else
									{
									echo "<td style='width:15%; border-top:solid 1px #1d7c35; border-right:solid 1px #1d7c35; word-wrap:break-word;'><input class='add' type='text' size='10' readonly value='W Trakcie'/></td>";
									echo "<input type='hidden' value='0' name='status'/>";
									}
								echo "<td style='width:15%; border-top:solid 1px #1d7c35; border-right:solid 1px #1d7c35;'><img style='max-width:70%;' src='series_resources/".$a['picture']."' alt='".$a['picture']."' ></td>";
								echo "<td style='width:15%; border-top:solid 1px #1d7c35; border-right:solid 1px #1d7c35; word-wrap:break-word;'><input class='edit' type='checkbox' value='1' name='delete'>Usuń</td>";
								echo "<td style='width:10%; border-top:solid 1px #1d7c35; border-right:solid 1px #1d7c35;'><input style='color:white; background:#222222;' type='submit' value='Zapisz'/></td></tr>";
								echo "</form>";
							}

							mysqli_close($connect);
						}
					?>
					</table>
				</div>
				
			</div>
			
			<div id="right">
			
			</div>
			
			<div style="clear:both"></div>
			
		</div>
	</body>
</html>