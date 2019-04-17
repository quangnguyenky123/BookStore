var role = sessionStorage.getItem('Role');
if (role === "" || role === undefined || role === null) {
    location.href = '/Login';
}
else {
    var QuanLyNhapSachConfig = {
        addRowStatus: false,
        index: 1,
        listNhaXuatBanHtml: "",
        pageIndex: 1,
        pageSize: 5,
        couponIsValid: false
    };
    var formatter = new Intl.NumberFormat('en-EN');
    var QuanLyNhapSachController = {
        registerEvent: function () {
            $(".delete-import-detail").off("click").on("click", function () {
                $("#row-" + $(this).data("id")).remove();
            });
            $(".book-title").off("change").on("change", function () {
                var value = $(this).val();
                var option = $("#book").find("[value='" + value + "']");
                if (option.length > 0) {
                    $(this).attr("data-id", option.data("id"));
                    option.remove();
                }
            });
            $('.btn-detail').off('click').on('click', function () {
                var id = $(this).data('id');
                QuanLyNhapSachController.loadDetail(id);
            });
        },
        createCoupon: function (formData) {
            $.ajax({
                url: '/QuanLyNhapSach/CreateCoupon',
                type: 'POST',
                data: formData,
                contentType: false,
                processData: false,
                dataType: 'json',
                success: function (response) {
                    if (response.status) {
                        $.notify({
                            icon: 'fas fa-check',
                            message: "Nhập sách thành công!"

                        }, {
                                type: "success",
                                z_index: 8000

                            });
                        QuanLyNhapSachController.loadData(true);
                        QuanLyNhapSachController.resetForm();
                        QuanLyNhapSachConfig.couponIsValid = false;
                        $("#import").modal("hide");
                    }
                }
            });
        },
        loadDetail: function (id) {
            $.ajax({
                url: '/QuanLyNhapSach/GetCouponDetail',
                type: 'GET',
                data: {
                    id: id
                },
                dataType: 'json',
                success: function (response) {
                    if (response.status) {
                        $("#detail-publisher-name").val(response.nxb);
                        $("#detail-date").val(response.date);
                        $("#price").html(formatter.format(response.price));
                        var data = response.data;
                        var html = '';
                        var template = $('#detail-template').html();
                        $.each(data, function (i, item) {
                            html += Mustache.render(template, {
                                TenSach: item.tenSach,
                                Tap: item.tap,
                                SoLuong: item.soLuong,
                                DonGia: formatter.format(item.donGia)
                            });
                        });
                        $('#detai-data').html(html);
                        $("#coupon-detail").modal("show");
                    }
                }
            });
        },
        loadData: function (changeSize) {
            $.ajax({
                url: '/QuanLyNhapSach/LoadData',
                type: 'GET',
                data: {
                    searchString: $("#search").val(),
                    pageIndex: QuanLyNhapSachConfig.pageIndex,
                    pageSize: QuanLyNhapSachConfig.pageSize
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
                                NgayNhap: item.ngayNhap,
                                TenNXB: item.tenNXB,
                                TongTien: formatter.format(item.tongTien)
                            });
                        });
                        QuanLyNhapSachController.paging(response.totalRow, function () {
                            QuanLyNhapSachController.loadData();
                        }, changeSize);
                        $('#tblData').html(html);
                        QuanLyNhapSachController.registerEvent();
                    }
                }
            });
        },
        getBookByPublisherName: function (tenNBX) {
            $.ajax({
                url: '/QuanLyNhapSach/GetBook',
                type: 'GET',
                data: {
                    tenNBX: tenNBX
                },
                dataType: 'json',
                success: function (response) {
                    if (response.status) {
                        var data = response.data;
                        var html = "<tr id='row-" + QuanLyNhapSachConfig.index + "'>"
                            + "<td>"
                            + "<input id='bookTile-" + QuanLyNhapSachConfig.index + "' class='form-control input-form-nhap book-title' type='text' list='book' />";
                        QuanLyNhapSachConfig.listNhaXuatBanHtml = "";
                        QuanLyNhapSachConfig.listNhaXuatBanHtml += "<datalist id='book'>";
                        $.each(data, function (i, item) {
                            if (item.tap != null && item.tap != "") {
                                QuanLyNhapSachConfig.listNhaXuatBanHtml += "<option data-id='" + item.id + "' value='" + item.tenSach + " (Tập " + item.tap + ")'></option>";
                            }
                            else {
                                QuanLyNhapSachConfig.listNhaXuatBanHtml += "<option data-id='" + item.id + "' value='" + item.tenSach + "'></option>";
                            }

                        });
                        QuanLyNhapSachConfig.listNhaXuatBanHtml += "</datalist>";
                        html += QuanLyNhapSachConfig.listNhaXuatBanHtml
                            + "</td>"
                            + "<td>"
                            + "<input style='max-width:85px;' class='form-control input-form-nhap' value='1' type='number' min='1' />"
                            + "</td>"
                            + "<td>"
                            + "<input  style='max-width:120px;'class='form-control input-form-nhap' value='0' type='number' min='0' />"
                            + "</td>"
                            + "<td>"
                            + "<button data-id='" + QuanLyNhapSachConfig.index + "' style='padding: 0px; ' type='button' class='btn btn-danger delete-import-detail'><span class='fas fa-times'></span></button>"
                            + "</td>"
                            + "</tr>";
                        $('#data').html(html);
                        QuanLyNhapSachConfig.addRowStatus = true;
                        $('#publisher-error').html("");
                        QuanLyNhapSachConfig.index++;
                        QuanLyNhapSachController.registerEvent();
                    }
                    else {
                        QuanLyNhapSachConfig.addRowStatus = false;
                        $('#publisher-error').html("Tên nhà xuất bản không tồn tại hoặc nhà xuất bản này chưa có sách nào! Vui lòng kiểm tra lại");
                    }
                }
            });
        },
        paging: function (totalRow, callback, changeSize) {
            var totalPage = Math.ceil(totalRow / QuanLyNhapSachConfig.pageSize);
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
                    QuanLyNhapSachConfig.pageIndex = page;
                }
            });
            $('.page-item').click(function (event) {
                setTimeout(callback, 10);
            });
        },
        resetForm: function () {
            $("#data").html("");
            $("#publisher").val("");
        }
    };
    $(document).ready(function () {
        $('#pageSize').change(function () {
            QuanLyNhapSachConfig.pageSize = $('#pageSize').val();
            QuanLyNhapSachController.loadData(true);
        });
        $('#search').keyup(function () {
            QuanLyNhapSachConfig.searchString = $('#search').val();
            QuanLyNhapSachController.loadData(true);
        });
        QuanLyNhapSachController.loadData();
        var newRow = function () {
            if ($("#book").html() == null || $("#book").html() == "" || $("#book").html() == undefined) {
                return row = "<tr id='row-" + QuanLyNhapSachConfig.index + "'>"
                    + "<td>"
                    + "<input id='bookTile-" + QuanLyNhapSachConfig.index + "' class='form-control input-form-nhap book-title' type='text' list='book' />"
                    + QuanLyNhapSachConfig.listNhaXuatBanHtml
                    + "</td>"

                    + "<td>"
                    + "<input style='max-width:85px;' class='form-control input-form-nhap' value='1' type='number' min='1' />"
                    + "</td>"
                    + "<td>"
                    + "<input style='max-width:120px;' class='form-control input-form-nhap' value='0' type='number' min='0' />"
                    + "</td>"
                    + "<td>"
                    + "<button data-id='" + QuanLyNhapSachConfig.index + "' style='padding: 0px; ' type='button' class='btn btn-danger delete-import-detail'><span class='fas fa-times'></span></button>"
                    + "</td>"
                    + "</tr>";
            }
            else {
                return row = "<tr id='row-" + QuanLyNhapSachConfig.index + "'>"
                    + "<td>"
                    + "<input id='bookTile-" + QuanLyNhapSachConfig.index + "' class='form-control input-form-nhap book-title' type='text' list='book' />"
                    + "</td>"

                    + "<td>"
                    + "<input style='max-width:85px;' class='form-control input-form-nhap' value='1' type='number' min='1' />"
                    + "</td>"
                    + "<td>"
                    + "<input style='max-width:120px;' class='form-control input-form-nhap' value='0' type='number' min='0' />"
                    + "</td>"
                    + "<td>"
                    + "<button data-id='" + QuanLyNhapSachConfig.index + "' style='padding: 0px; ' type='button' class='btn btn-danger delete-import-detail'><span class='fas fa-times'></span></button>"
                    + "</td>"
                    + "</tr>";
            }

        };
        $("#btn-add-row").click(function () {
            if (!QuanLyNhapSachConfig.addRowStatus || $("#publisher").val() == "") {
                $.notify({
                    icon: 'fas fa-exclamation-triangle',
                    message: "Vui lòng chọn nhà xuất bản trước!"

                }, {
                        type: "danger",
                        z_index: 8000

                    });
            }
            else {

                $("#data").append(newRow());
                QuanLyNhapSachController.registerEvent();
                QuanLyNhapSachConfig.index++;
            }

        });
        $("#publisher").change(function () {
            $("#data").html("");
            tenNBX = $("#publisher").val();
            if (tenNBX === null || tenNBX === "") {
                return;
            }
            else {
                QuanLyNhapSachController.getBookByPublisherName(tenNBX);
            }


        });
        $("#btn-confirm").click(function () {
            var nxb = $("#publisher").val();
            var coupons = new Array();
            var formData = new FormData();
            formData.append("Publisher", nxb);
            $("#tbl-data tbody tr").each(function () {
                var row = $(this);
                if (row.find("TD").eq(0).children()[0].value === null
                    || row.find("TD").eq(0).children()[0].value === ""
                    || row.find("TD").eq(1).children()[0].value === null
                    || row.find("TD").eq(1).children()[0].value === ""
                    || row.find("TD").eq(2).children()[0].value === null
                    || row.find("TD").eq(2).children()[0].value === "") {
                    QuanLyNhapSachConfig.couponIsValid = false;
                    $.notify({
                        icon: 'fas fa-exclamation-triangle',
                        message: "Vui lòng không bỏ trống bất kỳ trường nào!"

                    }, {
                            type: "danger",
                            z_index: 8000

                        });
                    return false;
                }
                else {
                    if (row.find("TD").eq(1).children()[0].value < 0
                        || row.find("TD").eq(2).children()[0].value < 0) {
                        QuanLyNhapSachConfig.couponIsValid = false;
                        $.notify({
                            icon: 'fas fa-exclamation-triangle',
                            message: "Đơn giá và số lượng phải lớn hơn 0!"

                        }, {
                                type: "danger",
                                z_index: 8000

                            });
                        return false;
                    }
                    else {
                        if ((row.find("TD").eq(1).children()[0].value % 1) !== 0) {
                            QuanLyNhapSachConfig.couponIsValid = false;
                            $.notify({
                                icon: 'fas fa-exclamation-triangle',
                                message: "Số lượng phải là số nguyên!"

                            }, {
                                    type: "danger",
                                    z_index: 8000

                                });
                            return false;
                        }
                        else {
                            var item = {
                                IdSach: row.find("TD").eq(0).children()[0].dataset.id,
                                SoLuong: row.find("TD").eq(1).children()[0].value,
                                DonGia: row.find("TD").eq(2).children()[0].value
                            };
                            coupons.push(item);
                            QuanLyNhapSachConfig.couponIsValid = true;


                        }
                    }

                }

            });
            if (QuanLyNhapSachConfig.couponIsValid) {
                formData.append("CouponDetail", JSON.stringify(coupons));
                QuanLyNhapSachController.createCoupon(formData);
            }
        });
    });
}


