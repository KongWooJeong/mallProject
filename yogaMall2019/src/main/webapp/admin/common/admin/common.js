$(function () {
    // 셀렉트박스 플러그인
    $('select').selectric();

    // LNB 메뉴
    $('#container').on('click', ".lnb dt a", function (e) {
        e.preventDefault();
        $(this).closest('dt').toggleClass('select');
    });
    $('#container').on('click', ".lnb .lnb-control .btn-lnb-hide",function (e) {
        e.preventDefault();
        $('body').toggleClass('on');
    });

    // lnb 즐겨찾기
    $('#container').on('click', ".lnb dd li .btn-bookmark", function () {
        $(this).toggleClass('on');
    });
    $('#bookmark-view').on('click', function (e) {
        e.preventDefault();
        $(this).toggleClass('on');
        $(this).closest('.top').toggleClass('on');
    });
    $('#header').on('click', ".top .btn-bookmark", function (e) {
        e.preventDefault();
        $(this).toggleClass('on');
    });

    // lnb height
    $(window).resize(function () {
        var container_height = $('#container').height();
        $('#container .lnb').height(container_height - 20);
    }).resize();


})