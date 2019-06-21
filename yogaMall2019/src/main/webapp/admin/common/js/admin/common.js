$(function () {
    // 셀렉트박스 플러그인

    $('select').selectric();

    leftMenu.init();

    headerMenu.init();

    // lnb height
    $(window).resize(function () {
        var container_height = $('#container').height();
        $('#container .lnb').height(container_height - 20);
    }).resize();

    // 팝업 닫기
    $("body").on('click', '.pop-wrap [class*=btn][class*=close]',function () {
        $(this).closest('.pop-wrap').bPopup().close();
    });

    // 달력
    $('.cal-wrap').each(function () {
        var _btn = $(this).find('.btn-cal');
        $(this).find('.ui-ipt').datepicker({
            language: 'ko-KR',
            trigger: _btn,
            format: 'yyyy-mm-dd',
            autoHide: true
        });
    });

    //파일찾기
    var fileTarget = $('.filebox .upload-hidden');
        fileTarget.on('change', function(){
            if(window.FileReader){
                var filename = $(this)[0].files[0].name;
            } else {
                var filename = $(this).val().split('/').pop().split('\\').pop();
            }
            $(this).siblings('.upload-name').val(filename);
        });


})


var leftMenu = {

	bookmarkYn : "",
	init : function() {
		this.addEvnt();
	},

	addEvnt : function() {

	    // LNB 메뉴
	    $('#container').on('click', '.lnb dt a', function (e) {
	        e.preventDefault();
	        $(this).closest('dt').toggleClass('select');
	    });
	    $('#container').on('click', '.lnb .lnb-control .btn-lnb-hide', function (e) {
	        e.preventDefault();
	        $('body').toggleClass('on');
	        leftMenu.gridResize();
	    });

	    // lnb 즐겨찾기
	    $('#container').on('click', '.lnb dd li .btn-bookmark', function () {

	    	if (!comm_authChk.chkAuthMenu(this)) {

				return;
			}

	        $(this).toggleClass('on');

	        leftMenu.bookmartYn = $(this).hasClass("on") ? 'Y' : 'N'

	        leftMenu.saveBook($(this).data("code"));

	    });
	},

	gridResize : function() {
		 if (rgrid = $('.ui-jqgrid-btable:visible')) {
			 rgrid.each(function(index) {
				gridId = $(this).attr('id');
//				alert(gridId)
				gridParentWidth = $('#gbox_' + gridId).parent().width();

				$('#' + gridId).setGridWidth(gridParentWidth, false);
			});
		}
	},
	saveBook : function(code){

		$.ajax({
			url			: cmmn.getContextRoot()+"/cm/am/au/saveBookmark.do",
	        dataType	: "json",
	        type		: "POST",
	        data 		: {"menuCd" : code, "bookmrkYn" : leftMenu.bookmartYn},
	        async		: false,
	        cache 		: false,
	        success 	: function(data) {

	        },
	        error		: function(xhr, errMsg) {
	        	console.log("ajax error: " , errMsg);

	        }
		});
	}
}

var headerMenu = {

	init : function() {
		this.addEvnt();
	},

	addEvnt : function() {

	    $('#bookmark-view').on('click', function (e) {
	        e.preventDefault();
	        $('#header .top .bookmark-wrap ul').empty();
	        $(this).toggleClass('on');
	        $(this).closest('.top').toggleClass('on');

	        $.ajax({
				url			: cmmn.getContextRoot()+"/cm/am/au/getBookmark.do",
		        dataType	: "json",
		        type		: "POST",
		        async		: false,
		        cache 		: false,
		        success 	: function(data) {

		        	for (var i = 0; i < data.length; i++) {

		        		var liTag = document.createElement("li"),
						aTag  = document.createElement("a"),
						divTag = document.createElement("div"),
			        	spanTag = document.createElement("span");

			        	divTag.setAttributeArr("type|class|data-code", "button|btn-bookmark on|"+ data[i].menuCd);

						spanTag.setAttribute("class", "blind");

						spanTag.innerHTML = "즐겨찾기";

						divTag.appendChild(spanTag);

						aTag.setAttributeArr("href|data-url|data-code|onclick|class|data-depth1|data-depth2|data-depth3",
								"#|"  + cmmn.getContextRoot() + data[i].prgmUrl
								+ "|" + data[i].menuCd
								+ "|sideMenu.active(this)"	// onclick
								+ "|ellipsis subBookMark|" + data[i].menuLv1 + "|" + data[i].menuLv2 +"|" + data[i].menuCd + "|");

						aTag.innerHTML = data[i].menuNm;

						liTag.appendChild(aTag);
						liTag.appendChild(divTag);

			        	$('#header .top .bookmark-wrap ul').append(liTag);
		        	}

		        },
		        error		: function(xhr, errMsg) {
		        	console.log("ajax error: " , errMsg);

		        }
			});
	    });

	    $('#bookmark-view-main').on('click', function (e) {
	        e.preventDefault();
	        $('#header .top .bookmark-wrap ul').empty();
	        $(this).toggleClass('on');
	        $(this).closest('.top').toggleClass('on');

	        $.ajax({
				url			: cmmn.getContextRoot()+"/cm/am/au/getBookmark.do",
		        dataType	: "json",
		        type		: "POST",
		        async		: false,
		        cache 		: false,
		        success 	: function(data) {

		        	for (var i = 0; i < data.length; i++) {

		        		var liTag = document.createElement("li"),
						aTag  = document.createElement("a"),
						divTag = document.createElement("div"),
			        	spanTag = document.createElement("span");

			        	divTag.setAttributeArr("type|class|data-code", "button|btn-bookmark on|"+ data[i].menuCd);

						spanTag.setAttribute("class", "blind");

						spanTag.innerHTML = "즐겨찾기";

						divTag.appendChild(spanTag);

						aTag.setAttributeArr("href|data-url|data-code|class|data-depth1|data-depth2|data-depth3",
								"#|"  + cmmn.getContextRoot() + data[i].prgmUrl
								+ "|" + data[i].menuCd
								+ "|ellipsis bookmarkA|" + data[i].menuLv1 + "|" + data[i].menuLv2 +"|" + data[i].menuCd + "|");

						aTag.innerHTML = data[i].menuNm;

						liTag.appendChild(aTag);
						liTag.appendChild(divTag);

			        	$('#header .top .bookmark-wrap ul').append(liTag);
		        	}

					$(".bookmarkA").on("click", function(){

						$("[name=curIdx]").val($(this).data("depth1"));
						$("[name=depth2]").val($(this).data("depth2"));
						$("[name=depth3]").val($(this).data("depth3"));

						$("#firstMenu").submit();
					})

		        },
		        error		: function(xhr, errMsg) {
		        	console.log("ajax error: " , errMsg);

		        }
			});
	    });

	    $('#header .top .btn-bookmark').on('click', function (e) {
	        e.preventDefault();
//	        $(this).toggleClass('on');
	    });
	}
}