var commValidCheck = {
		
		bool : "",
		
		popUp : function(regExp, $tag, message) {
			var that	= this,
				tagName = $tag.data("name");
			
			if (!regExp.test($tag.val())) {
				commAlertPop.popUp(tagName, message, function() {
					$tag.focus();
				})
				
				that.bool = false;	// 사용 불가
			} else {
				that.bool = true;	// 사용 가능
			}
		}
		
}