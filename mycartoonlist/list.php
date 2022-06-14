<!DOCTYPE html>
<html lang="pl">
	<head>
		<title>My Cartoon List - Michał Bej JavaSrcipt Project</title>
		<meta charset="utf-8"/>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<link rel="stylesheet" href="style.css">
	</head>
	
	<body onLoad="zegar()" style="background-image: url(background.png); background-repeat: repeat-y; height:400%;">
		<?php
			if(!isset($_COOKIE['user']))
				setcookie('user',2,time()+3600,"/");
			setcookie('site',"list.php",time()+3600,"/");
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

				<div id="list">
					<table style="width:100%; table-layout:fixed; text-align:center; border-top:solid 1px #1d7c35; border-bottom:solid 1px #1d7c35;">
					<tr><td style="width:10%; border-left:solid 1px #1d7c35; border-right:solid 1px #1d7c35;">#</td>
					<td style="width:15%; border-right:solid 1px #1d7c35;">Nazwa</td>
					<td style="width:12%; border-right:solid 1px #1d7c35;">Typ</td>
					<td style="width:9%; border-right:solid 1px #1d7c35;">Liczba odcinków</td>
					<td style="width:14%; border-right:solid 1px #1d7c35;">Producent</td>
					<td style="width:15%; border-right:solid 1px #1d7c35;">Gatunek</td>
					<td style="width:15%; border-right:solid 1px #1d7c35;">Zdjęcie</td>
					<td style="width:10%; border-right:solid 1px #1d7c35;">Dodaj</td></tr>
					<?php
						$connect=mysqli_connect('localhost','root','','mycartoonlist');
						$i=0;
						$query=mysqli_query($connect, "SELECT content.contentName AS 'name'
						,contenttype.contentTypeName AS 'type', content.contentNumberOfEpisodes AS 'episodes',
						table1.producers AS 'producer',table2.genres AS 'genre',content.contentPicture AS 'picture' 
						FROM content JOIN contenttype ON content.contentType = contenttype.contentTypeID JOIN 
						(SELECT producentrelation.contentID, GROUP_CONCAT(producent.producentName SEPARATOR '; ') AS 'producers' 
						FROM producentrelation JOIN producent ON producentrelation.producentID = producent.producentID 
						GROUP BY producentrelation.contentID ) AS table1 ON table1.contentID = content.contentID JOIN 
						(SELECT genrerelation.contentID, GROUP_CONCAT(genre.genreName SEPARATOR '; ') AS 'genres' 
						FROM genrerelation JOIN genre ON genrerelation.genreID = genre.genreID 
						GROUP BY genrerelation.contentID) AS table2 ON table2.contentID = content.contentID  ORDER BY content.contentName ASC;");

						while($a=mysqli_fetch_array($query))
						{
							$i++;
							echo "<form action='add.php' method='post'>";
							echo "<tr><td style='width:10%; border-top:solid 1px #1d7c35; border-left:solid 1px #1d7c35; border-right:solid 1px #1d7c35;'>".$i."</td>";
							echo "<td style='width:15%; border-top:solid 1px #1d7c35; border-right:solid 1px #1d7c35; word-wrap:break-word;'><input class='add' type='text' name='add' size='10' readonly value='".$a['name']."'/></td>";
							echo "<td style='width:13%; border-top:solid 1px #1d7c35; border-right:solid 1px #1d7c35;'>".$a['type']."</td>";
							echo "<td style='width:7%; border-top:solid 1px #1d7c35; border-right:solid 1px #1d7c35;'>".$a['episodes']."</td>";
							echo "<td style='width:15%; border-top:solid 1px #1d7c35; border-right:solid 1px #1d7c35; word-wrap:break-word;'>".$a['producer']."</td>";
							echo "<td style='width:15%; border-top:solid 1px #1d7c35; border-right:solid 1px #1d7c35; word-wrap:break-word;'>".$a['genre']."</td>";
							echo "<td style='width:15%; border-top:solid 1px #1d7c35; border-right:solid 1px #1d7c35;'><img style='max-width:70%;' src='series_resources/".$a['picture']."' alt='".$a['picture']."' ></td>";
							if(isset($_COOKIE['user']))
							{
								if($_COOKIE['user'] != 2)
									echo "<td style='width:10%; border-top:solid 1px #1d7c35; border-right:solid 1px #1d7c35;'><input style='color:white; background:#222222;' type='submit' value='dodaj'/></td></tr>";
								else
									echo "<td style='width:10%; border-top:solid 1px #1d7c35; border-right:solid 1px #1d7c35;'><input style='color:white; background:#222222; border:none;' type='submit' value='' disabled/></td></tr>";
							}
							else
								echo "<td style='width:10%; border-top:solid 1px #1d7c35; border-right:solid 1px #1d7c35;'><input style='color:white; background:#222222; border:none;' type='submit' value='' disabled/></td></tr>";
							echo "</form>";
						}

						mysqli_close($connect);
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