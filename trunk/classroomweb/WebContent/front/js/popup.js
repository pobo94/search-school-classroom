function showDlg(dlgID) {
	// 显示遮盖的层
	var objDeck = document.getElementById("deck");
	if (!objDeck) {
		objDeck = document.createElement("div");
		objDeck.id = "deck";
		document.body.appendChild(objDeck);
	}
	objDeck.className = "showDeck";
	objDeck.style.filter = "alpha(opacity=50)";
	objDeck.style.opacity = 40 / 100;
	objDeck.style.MozOpacity = 40 / 100;
	// 显示遮盖的层end

	// 禁用select
	hideOrShowSelect(true);

	// 改变样式
	document.getElementById(dlgID).className = 'showDlg';

	// 调整位置至居中
	adjustLocation(dlgID);

}

function closeDlg(dlgID) {
	document.getElementById(dlgID).className = 'hideDlg';
	document.getElementById("deck").className = "hideDeck";
	hideOrShowSelect(false);
}

function hideOrShowSelect(v) {
	var allselect = document.getElementsByTagName("select");
	for ( var i = 0; i < allselect.length; i++) {
		// allselect[i].style.visibility = (v==true)?"hidden":"visible";
		allselect[i].disabled = (v == true) ? "disabled" : "";
	}
}

function adjustLocation(dlgID) {
	var obox = document.getElementById(dlgID);
	if (obox != null && obox.style.display != "none") {
		var w = 600;
		var h = 400;
		var oLeft, oTop;

		if (window.innerWidth) {
			oLeft = window.pageXOffset + (window.innerWidth - w) / 2 + "px";
			oTop = window.pageYOffset + (window.innerHeight - h) / 2 + "px";
		} else {
			var dde = document.documentElement;
			oLeft = dde.scrollLeft + (dde.offsetWidth - w) / 2 + "px";
			oTop = dde.scrollTop + (dde.offsetHeight - h) / 2 + "px";
		}

		obox.style.left = oLeft;
		obox.style.top = oTop;
	}
}

(function(config) {
	config['lock'] = true;
	config['background'] = '#0f0f0f';
	config['opacity'] = 0.5;
	config['fixed'] = true;
	config['okVal'] = 'Ok';
	config['cancelVal'] = 'Cancel';
	// [more..]
})(art.dialog.defaults);

function closeLearning(){
	alert("关闭前");
	return true;
}

function popupDlg(url2,callback) {
	var dialog = art.dialog({
		id : 'N3690',
		padding : 0,
		margin : 0,
		border : false,
		title : false,
		close : callback
	});
	
	$.ajax({
		url : url2,
		success : function(data) {
			dialog.content(data);
		},
		cache : false
	});
//	$.post(url2,"",function(data,status){
//		dialog.content(data);
//	});
}
