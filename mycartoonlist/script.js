console.log("JavaScript Connected");

function zegar() 
{
	var data = new Date();
	var godzina = data.getHours();
	var min = data.getMinutes();
	if(godzina<10)
		godzina = "0"+godzina;
	if(min<10)
		min = "0"+min;
	var sec = data.getSeconds();
	if(sec<10)
		sec = "0"+sec;
	var teraz = godzina+":"+min+":"+sec;
	setTimeout("zegar()",1000);
	document.getElementById("zegarek").innerHTML = teraz;
}