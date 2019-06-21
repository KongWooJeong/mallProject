var COMMON_DUP_CHK = {
		
		dupChkFn		: function(chkAgreeData, callUrl, callback){
			$.ajax({
				
				url			:	callUrl,
				data		:	{"chkAgreeData" : chkAgreeData},
				traditional	:	true,
				
				success		: callback
					
			})
		}
}