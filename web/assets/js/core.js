/**
 * @author: hewro
 * @description: 后台管理系统的核心js
 */

$(function () {
    loginCheck();
    initWeb();
    initTheme();
});


var loginCheck = function () {
    $("#login_form").submit(function () {
        var identify = $("#chooseIdentify").children('option:selected').val();
        $.ajax({
            url: '/servlet/login',
            type: 'POST',
            data: {username: $("input[name='username']").val(),password: $("input[name = 'password']").val(),type:$("select[name='type']").val()},
            error: function (data) {
                alert("error" + data);
                return false;
            },
            success: function (data) {
                //alert("success");
                var results = $.parseJSON(data);
                //alert(results.status);
                if (results.status === 1){//登录成功
                    toastr.success("登录成功，即将为您跳转管理页面");
                    window.location.href="/"+ identify +"/dashboard.jsp";

                }else{//登录失败
                    toastr.error("登录失败，请检查用户名或密码");
                }
            }
        });
        //alert("submit");
        return false;
    });
};

var initWeb = function(){
    toastr.options = {
        "closeButton": true,
        "debug": false,
        "newestOnTop": false,
        "progressBar": true,
        "positionClass": "toast-bottom-center",
        "preventDuplicates": true,
        "onclick": null,
        "showDuration": "300",
        "hideDuration": "1000",
        "timeOut": "5000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    };
    

};

var initTheme = function () {
    $(".off-screen-toggle").click(function() {
        $('#aside').toggleClass('off-screen');
    });
    //ui-toggle.js
    $(document).on('click', '[ui-toggle-class]', function (e) {
        e.preventDefault();
        var $this = $(e.target);
        $this.attr('ui-toggle-class') || ($this = $this.closest('[ui-toggle-class]'));

        var classes = $this.attr('ui-toggle-class').split(','),
            targets = ($this.attr('target') && $this.attr('target').split(',')) || Array($this),
            key = 0;
        $.each(classes, function( index, value ) {
            var target = targets[(targets.length && key)];
            $( target ).toggleClass(classes[index]);
            key ++;
        });
        $this.toggleClass('active');

    });
    //设置菜单
    $(document).on('click', '[data-toggle-class]', function (event) {
        event.preventDefault();
        var $this = $(this),
            data = $this.data('toggle-class'),
            toggles = {};
        $.each(data.split(','),
            function() {
                var query = $.trim(this);
                if (!query) return;
                var querySplit = query.split('='),
                    key = querySplit[0],
                    value = querySplit[1];
                toggles[key] = value;
            });
        $.each(toggles,
            function(name, value) {
                $(name).toggleClass(value);
            });
    });
    //ui-nav.js
    var next;
    $(document).on('click', '[ui-nav] a', function (e) {
        next && next.trigger('mouseleave.nav');
        var _this = $(this);
        _this.parent().siblings( ".active" ).toggleClass('active');
        _this.next().is('ul') &&  _this.parent().toggleClass('active') &&  e.preventDefault();
        //mobile
        _this.next().is('ul') || ( ( $(window).width() < 768 ) && $('.off-screen').removeClass('show off-screen') );
    });

    // folded & fixed
    $(document).on('mouseenter', '[ui-nav] a', function (e) {
        next && next.trigger('mouseleave.nav');
        $('> .nav', $('.app-aside')).remove();
        if ( !$('.app-aside-fixed.app-aside-folded').length || ( $(window).width() < 768 )){//这条很关键，只是在折叠的情况下才会有mouseenter事件
            return;
        }

        var _this = $(e.target)
            , top
            , w_h = $(window).height()
            , offset = 50
            , min = 150;
        !_this.is('a') && (_this = _this.closest('a'));
        if( _this.next().is('ul') ){
            next = _this.next();//拿到li标签里面的ul标签
        }else{
            return;
        }
        _this.parent().addClass('active');
        top = _this.parent().position().top + offset;
        next.css('top', top);
        if( top + next.height() > w_h ){
            next.css('bottom', 0);
        }
        if(top + min > w_h){
            next.css('bottom', w_h - top - offset).css('top', 'auto');
        }
        next.appendTo('.app-aside');//把ul标签插入到.app-aside 末尾
        next.on('mouseleave.nav', function(e){//复原操作
            //$(backdrop).remove();
            next.appendTo(_this.parent());
            next.off('mouseleave.nav').css('top', 'auto').css('bottom', 'auto');
            _this.parent().removeClass('active');
        });
        $('.smart').length && $('<div class="dropdown-backdrop"/>').insertAfter('.app-aside').on('click', function(next){
            next && next.trigger('mouseleave.nav');
        });

    });

    $(document).on('mouseleave', '.app-aside', function (e){
        next && next.trigger('mouseleave.nav');
        $('> .nav', $('.app-aside')).remove();
    });

    //ui-client.js

    // Checks for ie
    var isIE = !!navigator.userAgent.match(/MSIE/i) || !!navigator.userAgent.match(/Trident.*rv:11\./);
    isIE && $('html').addClass('ie');

    // Checks for iOs, Android, Blackberry, Opera Mini, and Windows mobile devices
    /*var ua = window['navigator']['userAgent'] || window['navigator']['vendor'] || window['opera'];
    (/iPhone|iPod|iPad|Silk|Android|BlackBerry|Opera Mini|IEMobile/).test(ua) && $('html').addClass('smart');*/

};
