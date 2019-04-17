var role = sessionStorage.getItem('Role');
if (role === "" || role === undefined || role === null) {
    location.href = '/Login';
}
else {
    var nxbConfig = {
        pageSize: 5,
        pageIndex: 1,
        searchString: ""
    }
    var nxbController = {

        registerEvent: function () {

            $('.btn-delete').off('click').on('click', function () {
                var id = $(this).data('id');
                nxbController.deletePublisher(id);
            })
            $('.btn-detail').off('click').on('click', function () {
                var id = $(this).data('id');
                nxbController.loadDetail(id);
            })
            $('.btn-update').off('click').on('click', function () {
                var id = $(this).data('id');
                nxbController.loadDetailUpdate(id);
                $('#publisher-update').modal('show');
            })
            $('#frm-update').off('submit').on('submit', function (e) {
                e.preventDefault();
                var form = $(this);
                $(form).validate({
                    rules: {
                        "txtTennxb": {
                            required: true
                        }
                    },
                    messages: {
                        "txtTennxb": {
                            required: "Tên nhà xuất bản không được để trống"
                        }
                    }
                });
                if (!form.valid()) {
                    return false;
                }
                else {
                    var Id = $('#btn-update').data('id');
                    var Tennxb = $('#txtTennxb').val();
                    var MoTa = $('#txtMoTa').val();
                    var TrangThai = $('#sll-status').val();
                    nxbController.updatePublisher(Id, Tennxb, MoTa, TrangThai);
                }
            })
            $('#frm-create').off('submit').on('submit', function (e) {
                e.preventDefault();
                var form = $(this);
                $(form).validate({
                    rules: {
                        "publisherName": {
                            required: true
                        }
                    },
                    messages: {
                        "publisherName": {
                            required: "Tên nhà xuất bản không được để trống"
                        }
                    }
                });
                if (!form.valid()) {
                    return false;
                }
                else {
                    var Tennxb = $('#publisherName').val();
                    var MoTa = $('#publisherDescription').val();
                    var TrangThai = $('#publisherStatus').val();
                    nxbController.createPublisher(Tennxb, MoTa, TrangThai);
                }
            })

        },
        loadData: function (changeSize) {
            $.ajax({
                url: '/NhaXuatBan/LoadData',
                type: 'GET',
                data: {
                    searchString: nxbConfig.searchString,
                    page: nxbConfig.pageIndex,
                    pageSize: nxbConfig.pageSize
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
                                TenNXB: item.tenNxb,
                                MoTa: item.moTa,
                                TrangThai: item.tenTrangThai
                            });
                        });
                        nxbController.paging(response.totalRow, function () {
                            nxbController.loadData();
                        }, changeSize);
                        $('#tblData').html(html);
                        nxbController.registerEvent();
                    }
                }
            })
        },
        loadDetail: function (id) {
            $.ajax({
                url: '/NhaXuatBan/LoadDetail',
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
                        $.each(data, function (i, item) {
                            html += Mustache.render(template, {
                                Id: item.id,
                                TenNXB: item.tenNxb,
                                MoTa: item.moTa,
                                TrangThai: item.tenTrangThai
                            });
                        });
                        $('#detail-content').html(html);
                        $('#publisher-detail').modal('show');
                    }
                }
            })
        },
        loadDetailUpdate: function (id) {
            $.ajax({
                url: '/NhaXuatBan/LoadDetail',
                type: 'GET',
                data: {
                    id: id
                },
                dataType: 'json',
                success: function (response) {
                    if (response.status) {
                        var data = response.data;
                        var html = '';
                        var template = $('#update-template').html();
                        $.each(data, function (i, item) {
                            stt = item.trangThai;
                            html += Mustache.render(template, {
                                Id: item.id,
                                TenNXB: item.tenNxb,
                                MoTa: item.moTa,
                                TrangThai: item.trangThai
                            });
                        });
                        $('#publisher-update').html(html);
                        var stt = $('#sll-status').data('stt');
                        if (stt == 1) {
                            $('#sll-status option[value=1]').attr('selected', 'selected');
                        }
                        else {
                            $('#sll-status option[value=2]').attr('selected', 'selected');
                        }
                        nxbController.registerEvent();
                    }
                }
            })
        },
        updatePublisher: function (Id, Tennxb, MoTa, TrangThai) {
            $.ajax({
                url: '/NhaXuatBan/Update',
                type: 'POST',
                data: {
                    Id: Id,
                    tenNXB: Tennxb,
                    MoTa: MoTa,
                    TrangThai: TrangThai
                },
                dataType: 'json',
                success: function (response) {
                    if (response.status == 1) {
                        $.notify({
                            icon: 'fas fa-check-double',
                            message: "Cập nhật thành công"

                        }, {
                                type: "success",
                                z_index: 8000

                            });
                        nxbController.loadData();
                    }
                    else {
                        if (response.status == 0) {
                            $.notify({
                                icon: 'fas fa-exclamation-triangle',
                                message: "Tên nhà xuất bản đã tồn tại!"

                            }, {
                                    type: "danger",
                                    z_index: 8000
                                });
                        }
                    }
                }
            })
        },
        createPublisher: function (Tennxb, MoTa, TrangThai) {
            $.ajax({
                url: '/NhaXuatBan/Create',
                type: 'POST',
                data: {
                    tenNXB: Tennxb,
                    MoTa: MoTa,
                    TrangThai: TrangThai
                },
                dataType: 'json',
                success: function (response) {
                    if (response.status == 1) {
                        $.notify({
                            icon: 'fas fa-check-double',
                            message: "Thêm mới thành công"

                        }, {
                                type: "success",
                                z_index: 8000

                            });
                        nxbController.loadData(true);
                    }
                    else {
                        if (response.status == 0) {
                            $.notify({
                                icon: 'fas fa-exclamation-triangle',
                                message: "Tên nhà xuất bản đã tồn tại!"

                            }, {
                                    type: "danger",
                                    z_index: 8000
                                });
                        }
                    }
                }
            })
        },
        deletePublisher: function (id) {
            $.ajax({
                url: '/NhaXuatBan/Delete',
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

                        nxbController.loadData(true);
                    }
                    else {
                        if (response.status == 0) {
                            $.notify({
                                icon: 'fas fa-exclamation-triangle',
                                message: "Nhà xuất bản đã tồn tại sách! Không thể xóa"

                            }, {
                                    type: "danger"
                                });
                        }
                    }
                }
            })
        },
        paging: function (totalRow, callback, changeSize) {
            var totalPage = Math.ceil(totalRow / nxbConfig.pageSize)
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
                    nxbConfig.pageIndex = page;
                }
            });
            $('.page-item').click(function (event) {
                setTimeout(callback, 10);
            })
        }
    }
    $(document).ready(function () {
        nxbController.loadData();
        $('#btn-add').off('click').on('click', function () {
            $('#publisher-create').modal('show');
        })
        $('#pageSize').off('change').on('change', function () {
            nxbConfig.pageSize = $('#pageSize').val();
            nxbController.loadData(true);
        })
        $('#search').off('keyup').on('keyup', function () {
            nxbConfig.searchString = $('#search').val();
            nxbController.loadData(true);
        })

    })
}
