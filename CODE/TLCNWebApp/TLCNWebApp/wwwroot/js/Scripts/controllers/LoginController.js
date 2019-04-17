var loginController = {
    registerEvent: function () {
        //$('.login_btn').off('click').on('click', function () {
        //    var uname = $('#Uname').val();
        //    var psw = $('#Psw').val();
        //    if (uname == "") {
        //        var html1 = "Bạn quên nhập UserName!!!!";
        //        $('#uname-empty').html(html1);
        //    }
        //    else
        //        $('#uname-empty').html("");
        //    if (psw == "") {
        //        var html2 = "Bạn quên nhập Password!!!"
        //        $('#psw-empty').html(html2);
        //    }
        //    else
        //        $('#psw-empty').html("");
        //    if (uname != "" && psw != "") {
        //        uname = uname.replace(/[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/]/gi, '');//Xóa kí tự đặc biệt     
        //        psw = psw.replace(/[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/]/gi, '');//Xóa kí tự đặc biệt  
        //        //Còn thiếu mã hóa
        //        //Kiểm soát độ dài
        //        var unamelength = uname.length;
        //        var pswlength = psw.length;
        //        if (unamelength >= 20 || pswlength >= 16) {
        //            $.notify({
        //                icon: 'fas fa-exclamation-triangle',
        //                message: "Tên tài khoản hoặc Mật khẩu không đúng!!!"

        //            }, {
        //                    type: "danger"
        //                });
        //        }
        //        else
        //            loginController.checkLogin(uname, psw);
        //    }
        //})
    },
    checkLogin: function (userName, password) {
        $.ajax({
            url: '/Login/CheckLogin',
            type: 'POST',
            data: {
                userName: userName,
                password: password
            },
            dataType: 'json',
            success: function (response) {
                if (!response.status) {
                    $.notify({
                        icon: 'fas fa-exclamation-triangle',
                        message: "Sai tài khoản hoặc mật khẩu! Vui lòng kiểm tra lại!"

                    }, {
                            type: "danger"
                        });
                }
                else {
                    sessionStorage.setItem('UserName', response.userName);
                    sessionStorage.setItem('Role', response.role);
                    location.href = '/DanhMuc';
                }
            }
        });
    }
};
$(document).ready(function () {
    $('#frm-login').submit(function (e) {
        e.preventDefault();
        var form = $(this);
        $(form).validate({
            rules: {
                "userName": {
                    required: true
                },
                "password": {
                    required: true

                }
            },
            messages: {
                "userName": {
                    required: "Vui lòng nhập tài khoản!"
                },
                "password": {
                    required: "Vui lòng nhập mật khẩu!"
                }
            }
        });
        if (!form.valid()) {
            return false;
        }
        else {
            var userName = $('#userName').val().trim();
            userName = userName.replace(/[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/]/gi, '');
            var password = $('#password').val().trim();
            password = password.replace(/[`~!@#$%^&*()_|+\-=?;:'",.<>\{\}\[\]\\\/]/gi, '');
            password = md5(password);
        }
        loginController.checkLogin(userName, password);

    });
    loginController.registerEvent();

});