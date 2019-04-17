var role = sessionStorage.getItem('Role');
if (role === "" || role === undefined || role === null) {
    location.href = '/Login';
}
else {
    var sachConfig = {
        pageSize: 5,
        pageIndex: 1,
        searchString: ""
    };
    var sachController = {

        registerEvent: function () {
            $('#pageSize').off('change').on('change', function () {
                sachConfig.pageSize = $('#pageSize').val();
                sachController.loadData(true);
            });
            $('#search').off('keyup').on('keyup', function () {
                sachConfig.searchString = $('#search').val();
                sachController.loadData(true);
            });
            $('.btn-delete').off('click').on('click', function () {
                var id = $(this).data('id');
                sachController.deleteBook(id);
            });
            $('.btn-detail').off('click').on('click', function () {
                var id = $(this).data('id');
                sachController.loadDetail(id);
            });
            //$('.btn-update').off('click').on('click', function () {
            //    var id = $(this).data('id');
            //    sachController.loadDetailUpdate(id);
            //    $('#author-update').modal('show');
            //})

            //$('#frm-update').off('submit').on('submit', function (e) {
            //    e.preventDefault();
            //    var form = $(this);
            //    $(form).validate({
            //        rules: {
            //            "txtTensach": {
            //                required: true
            //            }
            //        },
            //        messages: {
            //            "txtTensach": {
            //                required: "Tên tác giả không được để trống"
            //            }
            //        }
            //    });
            //    if (!form.valid()) {
            //        return false;
            //    }
            //    else {
            //        var Id = $('#btn-update').data('id');
            //        var Tensach = $('#txtTensach').val();
            //        var MoTa = $('#txtMoTa').val();
            //        var TrangThai = $('#sll-status').val();
            //        sachController.updateAuthor(Id, Tensach, MoTa, TrangThai);
            //    }
            //})
            $('#frm-create-book').off('submit').on('submit', function (e) {
                e.preventDefault();
                var form = $(this);
                $(form).validate({
                    rules: {
                        "create-title": {
                            required: true
                        },
                        "create-category": {
                            required: true
                        },
                        "create-author": {
                            required: true
                        },
                        "create-publisher": {
                            required: true
                        },
                        "create-price": {
                            required: true
                        },
                        "create-image": {
                            required: true
                        }
                    },
                    messages: {
                        "create-title": {
                            required: "Tên sách không được để trống"
                        },
                        "create-category": {
                            required: "Danh mục không được để trống"
                        },
                        "create-author": {
                            required: "Tác giả không được để trống"
                        },
                        "create-publisher": {
                            required: "Nhà xuất bản không được để trống"
                        },
                        "create-price": {
                            required: "Giá sách không được để trống"
                        },
                        "create-image": {
                            required: "Hình ảnh không được để trống"
                        }
                    }
                });
                if (!form.valid()) {
                    return false;
                }
                else {
                    var title = $('#create-title').val();
                    var summary = $('#create-summary').val();
                    var category = $('#create-category').val();
                    var author = $('#create-author').val();
                    var publisher = $('#create-publisher').val();
                    var part = $('#create-part').val();
                    var price = $('#create-price').val();
                    var status = $('#create-status').val();
                    var book = {
                        TenSach: title,
                        TomTat: summary,
                        TenDanhMuc: category,
                        TenTacGia: author,
                        TenNhaXuatBan: publisher,
                        strTap: part,
                        Gia: price,
                        TrangThai: status
                    };
                    var formData = new FormData();
                    var files = $('#file-input-create').get(0).files;
                    if (files.length > 0) {
                        formData.append("HelpSectionImages", files[0]);
                        formData.append("Book", JSON.stringify(book));
                    }
                    else {
                        return false;
                    }
                    sachController.createBook(formData);
                }
            });
        },
        loadData: function (changeSize) {
            $.ajax({
                url: '/Sach/LoadData',
                type: 'GET',
                data: {
                    searchString: sachConfig.searchString,
                    page: sachConfig.pageIndex,
                    pageSize: sachConfig.pageSize
                },
                dataType: 'json',
                success: function (response) {
                    if (response.status) {
                        var data = response.data;
                        var html = '';
                        var template = $('#data-template').html();
                        $.each(data, function (i, item) {
                            html += Mustache.render(template, {
                                Id: item.id,
                                TenSach: item.tenSach,
                                HinhAnh: item.hinhAnh,
                                SoLuong: item.soLuong,
                                Gia: item.gia,
                                TrangThai: item.tenTrangThai
                            });
                        });
                        sachController.paging(response.totalRow, function () {
                            sachController.loadData();
                        }, changeSize);
                        $('#tblData').html(html);
                        sachController.registerEvent();
                    }
                }
            });
        },
        loadDetail: function (id) {
            $.ajax({
                url: '/Sach/LoadDetail',
                type: 'GET',
                data: {
                    id: id
                },
                dataType: 'json',
                success: function (response) {
                    if (response.status) {
                        var data = response.data;
                        var html = '';
                        var template = $('#detail-template').html();
                        html += Mustache.render(template, {
                            TenSach: data.tenSach,
                            TomTat: data.tomTat,
                            TenDanhMuc: data.tenDanhMuc,
                            TenTacGia: data.tenTacGia,
                            TenNhaXuatBan: data.tenNhaXuatBan,
                            Tap: data.tap,
                            Gia: data.gia,
                            SoLuong: data.soLuong,
                            SoLuotMua: data.soLuotMua,
                            TenTrangThai: data.tenTrangThai,
                            HinhAnh: data.hinhAnh
                        });
                        $('#detail-body').html(html);
                        $('#book-detail').modal('show');
                    }
                }
            });
        },
        //loadDetailUpdate: function (id) {
        //    $.ajax({
        //        url: '/sach/LoadDetail',
        //        type: 'GET',
        //        data: {
        //            id: id
        //        },
        //        dataType: 'json',
        //        success: function (response) {
        //            if (response.status) {
        //                var data = response.data;
        //                var html = '';
        //                var template = $('#update-template').html();
        //                $.each(data, function (i, item) {
        //                    stt = item.trangThai;
        //                    html += Mustache.render(template, {
        //                        Id: item.id,
        //                        Tensach: item.tensach,
        //                        MoTa: item.moTa,
        //                        TrangThai: item.trangThai
        //                    });
        //                });
        //                $('#author-update').html(html);
        //                var stt = $('#sll-status').data('stt');
        //                if (stt == 1) {
        //                    $('#sll-status option[value=1]').attr('selected', 'selected');
        //                }
        //                else {
        //                    $('#sll-status option[value=2]').attr('selected', 'selected');
        //                }

        //                sachController.registerEvent();
        //            }
        //        }
        //    })
        //},
        //updateAuthor: function (Id, Tensach, MoTa, TrangThai) {
        //    $.ajax({
        //        url: '/sach/Update',
        //        type: 'POST',
        //        data: {
        //            Id: Id,
        //            Tensach: Tensach,
        //            MoTa: MoTa,
        //            TrangThai: TrangThai
        //        },
        //        dataType: 'json',
        //        success: function (response) {
        //            if (response.status == 1) {
        //                $.notify({
        //                    icon: 'fas fa-check-double',
        //                    message: "Cập nhật thành công"

        //                }, {
        //                        type: "success",
        //                        z_index: 8000

        //                    });
        //                sachController.loadData();
        //            }
        //            else {
        //                if (response.status == 0) {
        //                    $.notify({
        //                        icon: 'fas fa-exclamation-triangle',
        //                        message: "Tên tác giả đã tồn tại!"

        //                    }, {
        //                            type: "danger",
        //                            z_index: 8000
        //                        });
        //                }
        //            }
        //        }
        //    })
        //},
        createBook: function (formData) {
            $.ajax({
                url: '/Sach/Create',
                type: 'POST',
                data: formData,
                contentType: false,
                processData: false,
                dataType: 'json',
                success: function (response) {
                    if (response.status) {

                        $.notify({
                            icon: 'fas fa-check-double',
                            message: response.message

                        }, {
                                type: "success",
                                z_index: 8000

                            });
                        sachController.loadData(true);
                    }
                    else {

                        $.notify({
                            icon: 'fas fa-exclamation-triangle',
                            message: response.message

                        }, {
                                type: "danger",
                                z_index: 8000
                            });

                    }
                }
            });
        },
        deleteBook: function (id) {
            $.ajax({
                url: '/Sach/Delete',
                type: 'POST',
                data: {
                    id: id
                },
                dataType: 'json',
                success: function (response) {
                    if (response.status == 1) {
                        $.notify({
                            icon: 'fas fa-check-double',
                            message: "Xóa thành công"

                        }, {
                                type: "success"
                            });

                        sachController.loadData(true);
                    }
                    else {
                        if (response.status == 0) {
                            $.notify({
                                icon: 'fas fa-exclamation-triangle',
                                message: "Sách đã có trong phiếu nhập hoặc đơn đặt hàng! Không thể xóa"

                            }, {
                                    type: "danger"
                                });
                        }
                    }
                }
            })
        },
        paging: function (totalRow, callback, changeSize) {
            var totalPage = Math.ceil(totalRow / sachConfig.pageSize);
            if ($('#pagination a').length == 0 || changeSize === true) {
                $('#pagination').empty();
                $('#pagination').removeData("twbs-pagination");
                $('#pagination').unbind('page');
            }
            $('#pagination').twbsPagination({
                totalPages: totalPage,
                visiblePages: 5,
                first: 'Trang đầu',
                prev: 'Trang trước',
                next: 'Trang sau',
                last: 'Trang cuối',
                onPageClick: function (event, page) {
                    sachConfig.pageIndex = page;
                }
            });
            $('.page-item').click(function (event) {
                setTimeout(callback, 10);
            });
        }

    };
    $(document).ready(function () {

        sachController.loadData();
        $('#btn-choose-create').click(function () {
            $('#file-input-create').click();
        });

        //$('#btn-add').off('click').on('click', function () {
        //    $('#author-create').modal('show');
        //})
    })
}

