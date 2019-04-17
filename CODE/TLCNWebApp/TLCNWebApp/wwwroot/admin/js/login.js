var login_controller = {
    init: function () {
        login_controller.registerEvent();
    },
    registerEvent: function () {
        $.validator.addMethod(
            "regex",
            function (value, element, regexp) {
                var re = new RegExp(regexp);
                return this.optional(element) || re.test(value);
            },
            "Please check your input."
        );
        $('#frmLogin').validate({
            rules: {
                inputEmail: {
                    required: true,
                    email:true
                },
                inputPassword: {
                    required: true,
                }
            },
            messages: {
                inputEmail: {
                    required: "Bắt buộc nhập email",
                    email:"Email có định dạng XXX@gmail.com"
                },
                inputPassword: {
                    required: "Bắt buộc nhập mật khẩu",
                }
            },
            submitHandler: function (form) {
                form.submit();
            }
        });
        $('#btn-login').off('click').on('click', function () {
            if ($('#frmLogin').valid()) {
                var username=$('#inputEmail').val();
                var password=$('#inputPassword').val();
                login_controller.login(username,password)
            }

        });
    },
    login: function (username,password) {
        $.ajax({
            url: '',
            data: {
                username: username,
                password:password
            },
            type: 'POST',
            dataType: 'json',
            success: function (response) {
                if (response.status) {
                    $('#xemNhanVien').modal('hide');
                    nhanVienController.notify("Cập nhật nhân viên thành công !!!");
                    nhanVienController.loadData(true);
                }
                else {
                    alert(response.message);
                }
            },
            error: function (err) {
                console.log(err);
            }
        })
    },
}
login_controller.init();