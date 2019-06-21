var commAlertPop = (function( ) {
	
	var _popUp = function(title,content,callback){
		var divTag	= document.createElement("div");
		
		divTag.className = "pop-wrap";
		divTag.id = "pop-01";
		divTag.style = "display:none";
		
		var dlTag = document.createElement("dl"),
		    dtTag = document.createElement("dt");
		
		dtTag.className = "pop-header";
		
		var h2Tag  = document.createElement("h2"),
		    btnTag = document.createElement("button"),
		    spanTag1 = document.createElement("span"),
		    spanTag2 = document.createElement("span");
		
		h2Tag.className = "txt-medium-sm-02";
		h2Tag.innerText = title;
		
		btnTag.type = "button";
		btnTag.className = "btn-close";
		btnTag.innerText = "닫힘";
		
		spanTag1.className = "ico-del-02";
		
		spanTag2.className = "blind";
		spanTag2.innerText = "팝업창 닫힘";
		
		btnTag.appendChild(spanTag1);
		btnTag.appendChild(spanTag2);
		
		dtTag.appendChild(h2Tag);
		dtTag.appendChild(btnTag);
		
		dlTag.appendChild(dtTag);
		
		var ddTag = document.createElement("dd"),
			divTag2 = document.createElement("div"),
			divTag3 = document.createElement("div"),
			divTag4 = document.createElement("div"),
			pTag = document.createElement("p"),
			btnTag2 = document.createElement("button");

		ddTag.className = "pop-body";

		divTag2.className = "pop-cont";

		divTag3.className = "pop-msg";

		pTag.className = "txt-light txt-center";

		pTag.innerText = content;

		divTag4.className = "pop-btn-wrap txt-center";

		btnTag2.className = "btn-footer-close txt-medium";

		btnTag2.type = "button";
		btnTag2.innerText = "확인";
		btnTag2.id = "popConfirmBtn";

		divTag3.appendChild(pTag);
		divTag2.appendChild(divTag3);
		ddTag.appendChild(divTag2);

		divTag4.appendChild(btnTag2);
		ddTag.appendChild(divTag4);

		dlTag.appendChild(ddTag);

		divTag.appendChild(dlTag);
		
		document.getElementsByTagName("body")[0].appendChild(divTag);
		
		$("#pop-01").bPopup();
		
		if (typeof callback === "function") {
			$("#popConfirmBtn").off();
			
			$("#popConfirmBtn").click(function() {
				$(this).closest('.pop-wrap').bPopup().close();
				
				$("#pop-01").remove();
				
				callback();
			});
		}
	}
	
	return {
		popUp	:	_popUp
	}
	
}())