/*
This is your general purpose AJAX function file. I'm not sure if this should be called AJAX because it doesn't use XML.
This is your general purpose AJA function file.

How to use:
	getContent(var1=a&var2=b$var3=c);
	this updates an element in the calling page that has id="content" with the data returned from action.php

	http://www.nucleocide.net
*/

function browser_check() {
	if (window.XMLHttpRequest) {
		return new XMLHttpRequest();
	} else if(window.ActiveXObject) {
		return new ActiveXObject("Microsoft.XMLHTTP");
	} else {
		document.write("<div class=\"error\">Your browser is a piece of shit that can't handle XML Http Requests.</div>");
	}
}			

var ajax = browser_check();		

function getMap(action) {
	var link = 'action.php?' + action + '&rand=' + Math.random();
	if (ajax.readyState == 4 || ajax.readyState == 0) {
		ajax.open("GET", link, true);
		ajax.onreadystatechange = handleGetMap; 
		ajax.send(null);
	}			
}

function handleGetMap() {
	if (ajax.readyState == 4) {
		drawMap();
	}
}

function autoRefresh() {
	getMap();
	setTimeout("autoRefresh()",2000);
}
window.onload = autoRefresh;

function drawMap() {
	bigArray = ajax.responseText.split("|");
	mapWidth = bigArray[0];
	mapHeight = bigArray[1];
	mapArray = bigArray[2].split(",");
	mapTitle = bigArray[3] + " (" + mapWidth + "x" + mapHeight + ")";
	//masterString = "<table cellpadding='0' cellspacing='0' id='map' width='" + mapWidth*16 + "'>";
	var output = "<div id=\"title\">" + mapTitle + "</div>";
	for(i=0; i<mapHeight; i++) {
		//masterString += "<tr><td>";
		output2 = "";
			for (j=0; j<mapWidth; j++) {
				if ((mapArray[((i*mapWidth+j)+0)]) >= 5000) {
					output2 += "<img src=\"images/accessories/" + (mapArray[((i*mapWidth+j)+0)]-5000) + ".gif\">";
				} else if ((mapArray[((i*mapWidth+j)+0)]) >= 4000) {
					output2 += "<img src=\"images/shields/" + (mapArray[((i*mapWidth+j)+0)]-4000) + ".gif\">";
				} else if ((mapArray[((i*mapWidth+j)+0)]) >= 3000) {
					output2 += "<img src=\"images/weapons/" + (mapArray[((i*mapWidth+j)+0)]-3000) + ".gif\">";
				} else if ((mapArray[((i*mapWidth+j)+0)]) >= 2000) {
					output2 += "<img src=\"images/items/" + (mapArray[((i*mapWidth+j)+0)]-2000) + ".gif\">";
				} else if ((mapArray[((i*mapWidth+j)+0)]) >= 1000) {
					output2 += "<img src=\"images/avatars/" + (mapArray[((i*mapWidth+j)+0)]-1000) + ".gif\">";
				} else {
					output2 += "<img src=\"images/enviro/" + (mapArray[((i*mapWidth+j)+0)]) + ".gif\">";
				}
			}
		//masterString += "</td></tr>";
		output += output2 + "<br>";
	}
	//masterString += "</table>";
	document.getElementById('map').innerHTML = output;


}



function getKey(keyStroke) {
	var key = new Array();
	key['w'] = "javascript:getMap('move=u');";
	key['a'] = "javascript:getMap('move=l');";
	key['s'] = "javascript:getMap('move=d');";
	key['d'] = "javascript:getMap('move=r');";
	key['f'] = "javascript:getMap('grab=1');";
	isNetscape=(document.layers);
	eventChooser = (isNetscape) ? keyStroke.which : event.keyCode;
	if (!isNetscape) {
		eventChooser = (window.event) ? event.keyCode : keyStroke.keyCode; //should make firefox work, but it doesn't :'(
	}
	which = String.fromCharCode(eventChooser).toLowerCase();
	for (var i in key) if (which == i) document.location=key[i];
}
document.onkeydown = getKey;
