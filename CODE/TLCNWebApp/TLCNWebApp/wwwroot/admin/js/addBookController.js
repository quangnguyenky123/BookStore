var addBookController = {
    init: function () {
        addBookController.registerEvent();
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
        $('#frmAddBook').validate({
            rules: {
                inputTuaSach: {
                    required: true,
                    minlength: 5
                },
                inputMoTa: {
                    required: true,
                    minlength: 5
                },
                inputDanhMuc: {
                    required: true
                },
                inputTacGia: {
                    required: true
                },
                inputNhaXuatBan: {
                    required: true
                },
                inputSoLuong: {
                    required: true,
                    regex: /^\d$/,
                },
                inputGia: {
                    required: true,
                    regex: /^\d{1,4}(\.\d{1,2})?$/
                },
                inputTrangThai: {
                    required: true
                },
                inputHinhAnh: {
                    required: true,
                    extension: "jpg|jpeg|png"
                }

            },
            messages: {
                inputTuaSach: {
                    required: "Bắt buộc nhập tựa sách",
                    minlength: "Chiều dài tựa sách phải lớn hơn 5 ký tự"
                },
                inputMoTa: {
                    required: "Bắt buộc nhập mô tả",
                    minlength: "Chiều dài mô tả phải lớn hơn 5 ký tự"
                },
                inputDanhMuc: {
                    required: "Bắt buộc chọn danh mục sách"
                },
                inputTacGia: {
                    required: "Bắt buộc chọn tác giả"
                },
                inputNhaXuatBan: {
                    required: "Bắt buộc chọn nhà xuất bản"
                },
                inputSoLuong: {
                    required: "Bắt buộc nhập số lượng",
                    regex: "Số lượng phải là số nguyên > 0",
                },
                inputGia: {
                    required: "Bắt buộc nhập giá",
                    regex: "Giá phải là số > 0 & < 9999.99",
                },
                inputTrangThai: {
                    required: "Bắt buộc chọn trạng thái"
                },
                inputHinhAnh: {
                    required: "Bắt buộc chọn hình ảnh",
                    extension: "File hình ảnh phải có định dạng là jpg,jpeg,png"
                }
            },
            submitHandler: function (form) {
                form.submit();
            }
        });
        $('#btnTao').off('click').on('click', function () {
            if ($('#frmAddBook').valid()) {
                alert("success");
            }

        });
    }
}
addBookController.init();