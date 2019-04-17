
var danhMucConfig = {
    pageSize: 5,
    pageIndex: 1,
    searchString: ""
}
var danhMucController = {

    registerEvent: function () {
        $('#pageSize').off('change').on('change', function () {
            danhMucConfig.pageSize = $('#pageSize').val();
            danhMucController.loadData(true);
        })
        $('#search').off('keyup').on('keyup', function () {
            danhMucConfig.searchString = $('#search').val();
            danhMucController.loadData(true);
        })
        $('.btn-delete').off('click').on('click', function () {
            var id = $(this).data('id');
            danhMucController.deleteCategory(id);
        })
        $('.btn-detail').off('click').on('click', function () {
            var id = $(this).data('id');
            danhMucController.loadDetail(id);
        })
        $('.btn-update').off('click').on('click', function () {
            var id = $(this).data('id');
            danhMucController.loadDetailUpdate(id);
            $('#category-update').modal('show');
        })

        $('#frm-update').off('submit').on('submit', function (e) {
            e.preventDefault();
            var form = $(this);
            $(form).validate({
                rules: {
                    "txtTenDanhMuc": {
                        required: true
                    }
                },
                messages: {
                    "txtTenDanhMuc": {
                        required: "Tên danh mục không được để trống"
                    }
                }
            });
            if (!form.valid()) {
                return false;
            }
            else {
                var Id = $('#btn-update').data('id');
                var TenDanhMuc = $('#txtTenDanhMuc').val();
                var MoTa = $('#txtMoTa').val();
                var TrangThai = $('#sll-status').val();
                danhMucController.updateCategory(Id, TenDanhMuc, MoTa, TrangThai);
            }
        })
        $('#frm-create').off('submit').on('submit', function (e) {
            e.preventDefault();
            var form = $(this);
            $(form).validate({
                rules: {
                    "categoryName": {
                        required: true
                    }
                },
                messages: {
                    "categoryName": {
                        required: "Tên danh mục không được để trống"
                    }
                }
            });
            if (!form.valid()) {
                return false;
            }
            else {
                var TenDanhMuc = $('#categoryName').val();
                var MoTa = $('#categoryDescription').val();
                var TrangThai = $('#categoryStatus').val();
                danhMucController.createCategory(TenDanhMuc, MoTa, TrangThai);
            }
        })

    },
    loadData: function (changeSize) {
        $.ajax({
            url: '/DanhMuc/LoadData',
            type: 'GET',
            data: {
                searchString: danhMucConfig.searchString,
                page: danhMucConfig.pageIndex,
                pageSize: danhMucConfig.pageSize
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
                            TenDanhMuc: item.tenDanhMuc,
                            MoTa: item.moTa,
                            TrangThai: item.tenTrangThai
                        });
                    });
                    danhMucController.paging(response.totalRow, function () {
                        danhMucController.loadData();
                    }, changeSize);
                    $('#tblData').html(html);
                    danhMucController.registerEvent();
                }
            }
        })
    },
    loadDetail: function (id) {
        $.ajax({
            url: '/DanhMuc/LoadDetail',
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
                            TenDanhMuc: item.tenDanhMuc,
                            MoTa: item.moTa,
                            TrangThai: item.tenTrangThai
                        });
                    });
                    $('#detail-content').html(html);
                    $('#category-detail').modal('show');
                }
            }
        })
    },
    loadDetailUpdate: function (id) {
        $.ajax({
            url: '/DanhMuc/LoadDetail',
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
                            TenDanhMuc: item.tenDanhMuc,
                            MoTa: item.moTa,
                            TrangThai: item.trangThai
                        });
                    });
                    $('#category-update').html(html);
                    var stt = $('#sll-status').data('stt');
                    if (stt == 1) {
                        $('#sll-status option[value=1]').attr('selected', 'selected');
                    }
                    else {
                        $('#sll-status option[value=2]').attr('selected', 'selected');
                    }
                    danhMucController.registerEvent();
                }
            }
        })
    },
    updateCategory: function (Id, TenDanhMuc, MoTa, TrangThai) {
        $.ajax({
            url: '/DanhMuc/Update',
            type: 'POST',
            data: {
                Id: Id,
                TenDanhMuc: TenDanhMuc,
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
                    danhMucController.loadData();
                    danhMucController.registerEvent();
                }
                else {
                    if (response.status == 0) {
                        $.notify({
                            icon: 'fas fa-exclamation-triangle',
                            message: "Tên danh mục đã tồn tại!"

                        }, {
                                type: "danger",
                                z_index: 8000
                            });
                    }
                }
            }
        })
    },
    createCategory: function (TenDanhMuc, MoTa, TrangThai) {
        $.ajax({
            url: '/DanhMuc/Create',
            type: 'POST',
            data: {
                TenDanhMuc: TenDanhMuc,
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
                    //danhMucController.loadData(true);
                }
                else {
                    if (response.status == 0) {
                        $.notify({
                            icon: 'fas fa-exclamation-triangle',
                            message: "Tên danh mục đã tồn tại!"

                        }, {
                                type: "danger",
                                z_index: 8000
                            });
                    }
                }
            }
        });
    },
    deleteCategory: function (id) {
        $.ajax({
            url: '/DanhMuc/Delete',
            type: 'POST',
            data: {
                id: id
            },
            dataType: 'json',
            success: function (response) {
                if (response.status === 1) {
                    $.notify({
                        icon: 'fas fa-check-double',
                        message: "Xóa thành công"

                    }, {
                            type: "success"
                        });

                    danhMucController.loadData(true);
                }
                else {
                    if (response.status=== 0) {
                        $.notify({
                            icon: 'fas fa-exclamation-triangle',
                            message: "Danh mục đã tồn tại sách! Không thể xóa"

                        }, {
                                type: "danger"
                            });
                    }
                }
            }
        });
    },
    paging: function (totalRow, callback, changeSize) {
        var totalPage = Math.ceil(totalRow / danhMucConfig.pageSize)
        if ($('#pagination a').length === 0 || changeSize === true) {
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
                danhMucConfig.pageIndex = page;
            }
        });
        $('.page-item').click(function (event) {
            setTimeout(callback, 10);
        });
    }
};
$(document).ready(function () {
    var role = sessionStorage.getItem('Role');
    if (role === "" || role === undefined || role === null) {
        location.href = '/Login';
    }
    else {
        danhMucController.loadData();
        $('#btn-add').off('click').on('click', function () {
            $('#category-create').modal('show');
        });
    }
});
