/**
 * @author: hewro
 * @description: 后台管理系统的核心js
 */

$(function () {
    loginCheck();
    initWeb();
});


var loginCheck = function () {
    $("#login_form").submit(function () {
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
    }
};