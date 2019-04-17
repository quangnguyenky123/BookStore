var homeConfigCategoryList = {
    pageSize: 6,
    pageIndex: 1
};
var homeConfigHot = {
    pageSize: 6,
    pageIndex: 1
};
var homeConfigSellingSoon = {
    pageSize: 6,
    pageIndex: 1
};
var homeConfigNew = {
    pageSize: 6,
    pageIndex: 1
};
var homeConfigAll = {
    pageSize: 12,
    pageIndex: 1
};
var homeConfig = {
    pageSize: 12,
    pageIndex: 1
};
var homeConfigCategory = {
    pageSize: 12,
    pageIndex: 1
};

var flag = [];//The list contains the status of items in the cart, true: allow add,
var index = -1;
var maxItem = 3;

var formatter = new Intl.NumberFormat('en-EN');

var deleteItem = function (id, price) {
    $('#cart-item-' + id).remove();
    var listItem = JSON.parse(localStorage.getItem("cart"));
    //totalDownpaymentWhenDelete(price);
    for (var i = 0; i < listItem.length; i++) {
        if (listItem[i].id === id) {
            listItem.splice(i, 1);//remove id in list
            localStorage.setItem("cart", JSON.stringify(listItem));
            $('#total-price').html(formatter.format(totalPrice()) + "&nbsp;<sup>đ</sup>");
            totalItemDisplay();
            checkEmptyAfterDelete();
            return true;
        }
    }
};

var totalPrice = function () {
    var total = 0;
    var listItem = JSON.parse(localStorage.getItem("cart"));
    for (var i = 0; i < listItem.length; i++) {
        total += listItem[i].quantity * listItem[i].price;
    }
    return total;
};

var checkEmptyWhenOpenCart = function () {
    if (cartIsNotExist()) {
        var imgEmpty = $('#img-empty');
        if (imgEmpty.length !== 0) {
            $('#cart-content').hide();
            $('#price-cart').hide();
            $('#img-empty').remove();
            $('#all-item').append('<div id="img-empty" style="text-align: center;"><img src="./images/cart-empty.png"></div>');
        }
        else {
            $('#cart-content').hide();
            $('#price-cart').hide();
            $('#all-item').append('<div id="img-empty" style="text-align: center;"><img src="./images/cart-empty.png"></div>');
        }
    }
    else {
        var listItem = JSON.parse(localStorage.getItem("cart"));
        if (listItem.length === 0) {
            if (imgEmpty.length !== 0) {
                $('#cart-content').hide();
                $('#price-cart').hide();
                $('#img-empty').remove();
                $('#all-item').append('<div id="img-empty" style="text-align: center;"><img src="./images/cart-empty.png"></div>');
            }
            else {
                $('#cart-content').hide();
                $('#price-cart').hide();
                $('#all-item').append('<div id="img-empty" style="text-align: center;"><img src="./images/cart-empty.png"></div>');
            }
        }
    }
};

var checkEmptyAfterDelete = function () {
    var tbody = $("#cart-content tbody");
    var imgEmpty = $('#img-empty');
    if (tbody.children().length === 0) {
        if (imgEmpty.length !== 0) {
            $('#cart-content').hide();
            $('#price-cart').hide();

            $('#img-empty').remove();
            $('#all-item').append('<div id="img-empty" style="text-align: center;"><img src="./images/cart-empty.png"></div>');
        }
        else {
            $('#cart-content').hide();
            $('#price-cart').hide();

            $('#all-item').append('<div id="img-empty" style="text-align: center;"><img src="./images/cart-empty.png"></div>');
        }
    }
};

var totalItemDisplay = function () {
    if (cartIsNotExist()) {
        $('#cart-total').html(0 + " sách");
        $('#cart-total2').html(0);
    }
    else {
        var listItem = JSON.parse(localStorage.getItem("cart"));
        $('#cart-total').html(listItem.length + " sách");
        $('#cart-total2').html(listItem.length);
    }

};
var cartIsNotExist = function () {
    if (localStorage.getItem("cart") === null) {
        return true;
    }
    else {
        return false;
    }
};
var itemIsExistInCart = function (id, listItem) {
    for (var i = 0; i < listItem.length; i++) {
        if (id === listItem[i].id) {
            return true;
        }
    }
};
var homeController = {

    registerEvent: function () {

        $('.add-to-cart').off('click').on('click', function () {
           
            var id = $(this).data('id');
            var title = $(this).data('title');
            var price = $(this).data('price');
            var item = {
                id: id,
                title: title,
                quantity: 1,
                price: price
            };
            if (cartIsNotExist()) {
                var listItem = [];
                listItem.push(item);
                localStorage.setItem("cart", JSON.stringify(listItem));
                $.notify({
                    icon: 'fas fa-check',
                    message: "Đã thêm sách " + title + " vào giỏ hàng!"
                }, {
                        type: "success",
                        delay: 100,
                        offset: {
                            x: 20,
                            y: 70
                        }
                    });
                totalItemDisplay();
                $('#cart-content').show();
                $('#price-cart').show();
            }
            else {
                listItem = JSON.parse(localStorage.getItem("cart"));
                if (listItem.length === 0) {
                    listItem.push(item);
                    localStorage.setItem("cart", JSON.stringify(listItem));
                    $.notify({
                        icon: 'fas fa-check',
                        message: "Đã thêm sách " + title + " vào giỏ hàng!"
                    }, {
                            type: "success",
                            delay: 100,
                            offset: {
                                x: 20,
                                y: 70
                            }
                        });
                    totalItemDisplay();
                    $('#cart-content').show();
                    $('#price-cart').show();
                }
                else {
                    if (itemIsExistInCart(id, listItem)) {
                        $.notify({
                            icon: 'fas fa-exclamation-triangle',
                            message: "Sách đã có trong giỏ hàng, vào giỏ hàng để xem thông tin chi tiết!"
                        }, {
                                type: "warning",
                                delay: 100,
                                offset: {
                                    x: 20,
                                    y: 70
                                }
                            });
                    }
                    else {
                        listItem.push(item);
                        localStorage.setItem("cart", JSON.stringify(listItem));
                        $.notify({
                            icon: 'fas fa-check',
                            message: "Đã thêm sách " + title + " vào giỏ hàng!"
                        }, {
                                type: "success",
                                delay: 100,
                                offset: {
                                    x: 20,
                                    y: 70
                                }
                            });
                        totalItemDisplay();
                        $('#cart-content').show();
                        $('#price-cart').show();
                    }
                }

            }
        });
        $('.quick-view-button').off('click').on('click', function () {
            if ($(this).data('disable') === true) {
                $('#detail-image').attr('src', $(this).data('img'));
                $('#detail-title').html($(this).data('title'));
                $('#detail-author').html($(this).data('author'));
                $('#detail-price').html(formatter.format($(this).data('price')));

                $('#detail-description').html($(this).data('description'));
                $('#detail-description').removeClass('affter-click-readmore');
                $('#detail-description').addClass('detail-description');
                $('#read-more').html('Xem thêm');
                $('#read-more').data('status', 1);

                $('#detail-add-to-cart').hide();

                $('#product_view').modal('show');
            }
            else {
                $('#detail-image').attr('src', $(this).data('img'));
                $('#detail-title').html($(this).data('title'));
                $('#detail-author').html($(this).data('author'));
                $('#detail-price').html(formatter.format($(this).data('price')));

                $('#detail-description').html($(this).data('description'));
                $('#detail-description').removeClass('affter-click-readmore');
                $('#detail-description').addClass('detail-description');
                $('#read-more').html('Xem thêm');

                $('#detail-add-to-cart').show();
                $('#detail-add-to-cart').data('id', $(this).data('id'));
                $('#detail-add-to-cart').data('price', $(this).data('price'));
                $('#detail-add-to-cart').data('title', $(this).data('title'));

                $('#read-more').data('status', 1);
                $('#product_view').modal('show');
            }
            
        });
      
        $(".txt-quantity").bind("mouseup", function () {
            var listItem = JSON.parse(localStorage.getItem("cart"));
            var id = $(this).data("id");
            for (var i = 0; i < listItem.length; i++) {
                if (listItem[i].id === id) {
                    listItem[i].quantity = $("#txtquantity-" + id).val();
                    $('#total-price').html("");
                    localStorage.setItem("cart", JSON.stringify(listItem));
                    $('#total-price').html(formatter.format(totalPrice()) + "&nbsp;<sup>đ</sup>");
                    return true;
                }
            }


        });
    },
    //    $('.cancel-borrow').click(function () {
    //        var id = $(this).data("id");
    //        bootbox.confirm({
    //            title: "Xác nhận hủy",
    //            message: "Bạn có chắc chắn muốn hủy mượn cuốn sách này?",
    //            buttons: {
    //                cancel: {
    //                    label: '<i class="fa fa-times"></i> Không'
    //                },
    //                confirm: {
    //                    label: '<i class="fa fa-check"></i> Có'
    //                }
    //            },
    //            callback: function (result) {
    //                if (result) {
    //                    homeController.cancelBook(id);
    //                }

    //            }
    //        });


    //    });
    //    $(".image2").click(function () {
    //        var title = $(this).data("title");
    //        var subtitle = $(this).data("subtitle");
    //        var id = $(this).data("id");
    //        var downpayment = $(this).data("downpayment");
    //        var image = $(this).data("img");
    //        var duration = $(this).data("duration");
    //        var author = $(this).data("author");
    //        var part = $(this).data("part");
    //        var language = $(this).data("language");
    //        if (subtitle.length !== 0) {
    //            $('#detail-subtitle').html("<b style='color:black;'>Tiêu đề phụ</b> : " + subtitle);
    //              $('#detail-title').html(title.toString().toUpperCase() + " ( " + subtitle.toUpperCase()+" )");
    //        } else {
    //            $('#detail-subtitle').html("");
    //            $('#detail-title').html(title.toString().toUpperCase());
    //        }
    //        $('#detail-title').html(title.toString().toUpperCase());

    //        $('#detail-part').html("<b style='color:black;'>Tập</b> : " + part);
    //        $('#detail-author').html("<b style='color:black;'>Tác giả</b> : " + author);
    //        $('#detail-duration').html("<b style='color:black;'>Thời lượng</b> : " + duration + " trang");
    //        $('#detail-language').html("<b style='color:black;'>Ngôn ngữ</b> : " + language);
    //        $('#detail-downpayment').html(formatter.format(downpayment));
    //        $('#detail-image').attr("src", image);
    //        $('#detail-add-to-cart').data('id', id);
    //        $('#detail-add-to-cart').data("title", title);
    //        $('#detail-add-to-cart').data("downpayment", downpayment);
    //        $('#detail-add-to-cart').data("img", image);
    //        $('#detail-add-to-cart').data("title");
    //        $('#product_view').modal("show");
    //    });
    //    $('.quick-view-button').click(function () {
    //        var title = $(this).data("title");
    //        var subtitle = $(this).data("subtitle");
    //        var id = $(this).data("id");
    //        var downpayment = $(this).data("downpayment");
    //        var image = $(this).data("img");
    //        var duration = $(this).data("duration");
    //        var author = $(this).data("author");
    //        var part = $(this).data("part");
    //        var language = $(this).data("language");
    //        $('#detail-title').html(title);
    //        $('#detail-subtitle').html(subtitle);
    //        $('#detail-part').html("<b style='color:black;'>Tập</b> : " + part);
    //        $('#detail-author').html("<b style='color:black;'>Tác giả</b> : " + author);
    //        $('#detail-duration').html("<b style='color:black;'>Thời lượng</b> : " + duration + " trang");
    //        $('#detail-language').html("<b style='color:black;'>Ngôn ngữ</b> : " + language);
    //        $('#detail-downpayment').html(formatter.format(downpayment));
    //        $('#detail-image').attr("src", image);
    //        $('#detail-add-to-cart').data('id', id);
    //        $('#detail-add-to-cart').data("title", title);
    //        $('#detail-add-to-cart').data("downpayment", downpayment);
    //        $('#detail-add-to-cart').data("img", image);
    //        $('#detail-add-to-cart').data("title");
    //        $('#product_view').modal("show");
    //    });

    //},
    //login: function () {
    //    $.ajax({
    //        url: './Login/Login',
    //        type: 'POST',
    //        dataType: 'json',
    //        success: function (response) {
    //            if (response.status) {
    //                login_controller.notify("Đăng nhập thành công!", "success", "fas fa-check");
    //                $(".li-logout a").html("<i class='fa fa-shopping-cart'></i>(<b id='hold-session'>" + response.session + "</b>)Đăng xuất");

    //            }
    //            else {
    //                login_controller.notify("Tài khoản hoặc mật khẩu không đúng!Vui lòng kiểm tra lại", "danger", "fas fa-warning");
    //            }
    //        },
    //        error: function (err) {
    //            console.log(err);
    //        }
    //    })
    //},
    loadHotBook: function () {
        $.ajax({
            url: '/Home/GetHotBook',
            type: 'GET',
            data: {
                pageIndex: homeConfigHot.pageIndex,
                pageSize: homeConfigHot.pageSize
            },
            dataType: 'json',
            // Assign data and render to html
            success: function (response) {
                if (response.status) {
                    var data = response.data;
                    var html = '';
                    var template = $('#book-template').html();
                    $.each(data, function (i, item) {
                        html += Mustache.render(template, {
                            Id: item.id,
                            TenSach: (item.strTap !== null && item.strTap !== "") ? item.tenSach + " (Tập " + item.strTap + ")" : item.tenSach,
                            Gia: item.gia,
                            GiaFormat: formatter.format(item.gia),
                            TomTat: item.tomTat,
                            HinhAnh: item.hinhAnh,
                            Tap: item.strTap,
                            TacGia: item.tenTacGia
                        });
                    });
                    $('#book-hot').html(html);

                    homeController.pagingHotBook(response.totalRow, function () {
                        homeController.loadHotBook();
                    });
                    homeController.registerEvent();
                }
            }
        });
    },
    loadNewBook: function () {
        $.ajax({
            url: '/Home/GetNewBook',
            type: 'GET',
            data: {
                pageIndex: homeConfigNew.pageIndex,
                pageSize: homeConfigNew.pageSize
            },
            dataType: 'json',
            // Assign data and render to html
            success: function (response) {
                if (response.status) {
                    var data = response.data;
                    var html = '';
                    var template = $('#book-template').html();
                    $.each(data, function (i, item) {
                        html += Mustache.render(template, {
                            Id: item.id,
                            TenSach: (item.strTap !== null && item.strTap !== "") ? item.tenSach + " (Tập " + item.strTap + ")" : item.tenSach,
                            Gia: item.gia,
                            GiaFormat: formatter.format(item.gia),
                            TomTat: item.tomTat,
                            HinhAnh: item.hinhAnh,
                            Tap: item.strTap,
                            TacGia: item.tenTacGia
                        });
                    });
                    $('#book-new').html(html);

                    homeController.pagingNewBook(response.totalRow, function () {
                        homeController.loadNewBook();
                    });

                    homeController.registerEvent();
                }
            }
        });
    },
    loadSellingSoonBook: function () {
        $.ajax({
            url: '/Home/GetSellingSoonBook',
            type: 'GET',
            data: {
                pageIndex: homeConfigSellingSoon.pageIndex,
                pageSize: homeConfigSellingSoon.pageSize
            },
            dataType: 'json',
            // Assign data and render to html
            success: function (response) {
                if (response.status) {
                    var data = response.data;
                    var html = '';
                    var template = $('#selling-soon-book-template').html();
                    $.each(data, function (i, item) {
                        html += Mustache.render(template, {
                            Id: item.id,
                            TenSach: (item.strTap !== null && item.strTap !== "") ? item.tenSach + " (Tập " + item.strTap + ")" : item.tenSach,
                            Gia: item.gia,
                            GiaFormat: formatter.format(item.gia),
                            TomTat: item.tomTat,
                            HinhAnh: item.hinhAnh,
                            Tap: item.strTap,
                            TacGia: item.tenTacGia
                        });
                    });
                    $('#book-selling-soon').html(html);
                    homeController.pagingSellingSoonBook(response.totalRow, function () {
                        homeController.loadSellingSoonBook();
                    });

                    homeController.registerEvent();
                }
            }
        });
    },
    createOrder: function (form) {
        $.ajax({
            url: '/Home/CreateOrder',
            type: 'POST',
            data: form,
            contentType: false,
            processData: false,
            dataType: 'json',
            // Assign data and render to html
            success: function (response) {
                if (response.status) {
                    $.notify({
                        icon: 'fas fa-check',
                        message: "Đặt hàng thành công! Cảm ơn bạn"
                    }, {
                            type: "success",
                            delay: 100,
                            offset: {
                                x: 20,
                                y: 70
                            },
                            z_index: 8000
                        });       
                    $('#txt-username').val("");
                    $('#txt-address').val("");
                    $('#txt-email').val("");
                    $('#txt-phone').val("");
                    var listItem = [];
                    localStorage.setItem("cart", JSON.stringify(listItem));
                    totalItemDisplay();
                    $("#user-info-modal").modal("hide");

                }
                
            }
        });
    },
    loadDataSearch: function (changePageSize) {
        var searchString = $('#input-search').val();
        $.ajax({
            url: '/Home/Search',
            type: 'GET',
            data: {
                pageIndex: homeConfig.pageIndex,
                pageSize: homeConfig.pageSize,
                searchString: searchString
            },
            dataType: 'json',
            // Assign data and render to html
            success: function (response) {
                if (response.status) {
                    var data = response.data;
                    var html = '';
                    var template = $('#book-template').html();
                    $.each(data, function (i, item) {
                        html += Mustache.render(template, {
                            Id: item.id,
                            TenSach: (item.strTap !== null && item.strTap !== "") ? item.tenSach + " (Tập " + item.strTap + ")" : item.tenSach,
                            Gia: item.gia,
                            GiaFormat: formatter.format(item.gia),
                            TomTat: item.tomTat,
                            HinhAnh: item.hinhAnh,
                            Tap: item.strTap,
                            TacGia: item.tenTacGia
                        });
                    });
                    $('#book-search').html(html);
                    var searchResult = "Có " + response.totalRow + " kết quả với từ khóa : " + searchString;
                    $('#search-result').html(searchResult);

                    if (response.totalRow === 0) {
                        $('#paging-search').twbsPagination('destroy');
                    }
                    else {
                        homeController.pagingSearch(response.totalRow, function () {
                            homeController.loadDataSearch();
                        }, changePageSize);
                        homeController.registerEvent();
                    }
                }
            }
        });
    },

    loadBookByCategory: function (cateId, cateName) {
        $.ajax({
            url: '/Home/GetBookByCategory',
            type: 'GET',
            data: {
                pageIndex: homeConfigCategory.pageIndex,
                pageSize: homeConfigCategory.pageSize,
                cateId: cateId
            },
            dataType: 'json',
            // Assign data and render to html
            success: function (response) {
                if (response.status) {
                    var data = response.data;
                    var html = '';
                    var template = $('#book-template').html();
                    $.each(data, function (i, item) {
                        html += Mustache.render(template, {
                            Id: item.id,
                            TenSach: (item.strTap !== null && item.strTap !== "") ? item.tenSach + " (Tập " + item.strTap + ")" : item.tenSach,
                            Gia: item.gia,
                            GiaFormat: formatter.format(item.gia),
                            TomTat: item.tomTat,
                            HinhAnh: item.hinhAnh,
                            Tap: item.strTap,
                            TacGia: item.tenTacGia
                        });
                    });
                    $('#book-by-category').html(html);
                    var Result = "Có " + response.totalRow + " kết quả với danh mục : " + cateName;
                    $('#category-book').html(Result);

                    homeController.pagingCate(response.totalRow, function () {
                        homeController.loadBookByCategory(cateId, cateName);
                    });
                    homeController.registerEvent();
                }
            }
        });
    },
    getCustomerInfo: function (phone) {
        $.ajax({
            url: '/Home/GetCustomerInfo',
            type: 'GET',
            data: {
                phone: phone
            },
            dataType: 'json',
            // Assign data and render to html
            success: function (response) {
                if (response.status) {
                    data = response.data;
                    bootbox.confirm({
                        message: "Bạn đã từng mua hàng tại đây. Bạn có muốn sử dụng thông tin cá nhân lần trước để tiếp tục mua hàng không?",
                        buttons: {
                            cancel: {
                                label: '<i class="fa fa-times"></i> Cancel'
                            },
                            confirm: {
                                label: '<i class="fa fa-check"></i> Confirm'
                            }
                        },
                        callback: function (result) {
                            if (result) {
                                $('#txt-username').val(data.tenKh);
                                 $('#txt-address').val(data.diaChi);
                                $('#txt-email').val(data.email);
                                $('#txt-phone').val(data.soDienThoai);
                                $('#txt-id').data('id', data.id);
                            }
                        }
                    });
                }
            }
        });
    },
    loadAllSellingBook: function () {
        $.ajax({
            url: '/Home/GetAllSellingBook',
            type: 'GET',
            data: {
                pageIndex: homeConfigAll.pageIndex,
                pageSize: homeConfigAll.pageSize,
            },
            dataType: 'json',
            // Assign data and render to html
            success: function (response) {
                if (response.status) {
                    var data = response.data;
                    var html = '';
                    var template = $('#book-template').html();
                    $.each(data, function (i, item) {
                        html += Mustache.render(template, {
                            Id: item.id,
                            TenSach: (item.strTap !== null && item.strTap !== "") ? item.tenSach + " (Tập " + item.strTap + ")" : item.tenSach,
                            Gia: item.gia,
                            GiaFormat: formatter.format(item.gia),
                            TomTat: item.tomTat,
                            HinhAnh: item.hinhAnh,
                            Tap: item.strTap,
                            TacGia: item.tenTacGia
                        });
                    });
                    $('#book-all').html(html);
                    homeController.pagingAll(response.totalRow, function () {
                        homeController.loadAllSellingBook();
                    });
                    homeController.registerEvent();
                }
            }
        });
    },
    //loadHistoryByUser: function () {
    //    var session = $('#hold-session').html();
    //    var typeSearch = $('#search-option').val();
    //    var fromDay = $('#fromDay').val();
    //    var toDay = $('#toDay').val();
    //    $.ajax({
    //        url: './Home/GetHistoryByUser',
    //        type: 'GET',
    //        data: {
    //            typeSearch: typeSearch,
    //            fromDay: fromDay,
    //            toDay: toDay,
    //            userName: session
    //        },
    //        dataType: 'json',
    //        success: function (response) {
    //            if (response.status) {
    //                var data = response.data;
    //                $('#tableData').html("");
    //                $.each(data, function (i, item) {
    //                    var status = ""
    //                    if (item.Status == 1) {
    //                        status = "Đang chờ";
    //                    }
    //                    else {
    //                        if (item.Status == 2) {
    //                            status = "Đã nhận";
    //                        }
    //                        else {
    //                            if (item.Status == 3) {
    //                                status = "Quá hạn";
    //                            }
    //                            else {
    //                                if (item.Status == 4) {
    //                                    status = "Đã trả";
    //                                }
    //                                else {
    //                                    status = "Đã hủy";
    //                                }
    //                            }
    //                        }
    //                    }
    //                    if (item.Status == 1) {
    //                        $('#tableData').append(
    //                            "<tr style='min-height:50px;'>" +
    //                            "<td>" + item.BookTitle + "</td>" +
    //                            "<td>" + item.CreatedDay + "</td>" +
    //                            "<td>" + item.BorrowDay + "</td>" +
    //                            "<td>" + item.Deadline + "</td>" +
    //                            "<td>" + formatter.format(item.Total) + "&nbsp;<sup>đ</sup></td>" +
    //                            "<td>" + status + "</td>" +
    //                            "<td><button data-id=" + item.CartDetailId + " class='btn btn-danger cancel-borrow'>Hủy</button></td>" +
    //                            "</tr>"
    //                        );
    //                    }
    //                    else {
    //                        $('#tableData').append(
    //                            "<tr style='min-height:50px;'>" +
    //                            "<td>" + item.BookTitle + "</td>" +
    //                            "<td>" + item.CreatedDay + "</td>" +
    //                            "<td>" + item.BorrowDay + "</td>" +
    //                            "<td>" + item.Deadline + "</td>" +
    //                            "<td>" + formatter.format(item.Total) + "&nbsp;<sup>đ</sup></td>" +
    //                            "<td>" + status + "</td>" +
    //                            "<td></td>" +
    //                            "</tr>"
    //                        );

    //                    }

    //                });

    //                homeController.registerEvent();
    //            }
    //        }
    //    })
    //},
    //cancelBook: function (id) {
    //    $.ajax({
    //        url: './Home/CancelBook',
    //        type: 'POST',
    //        data: {
    //            id: id
    //        },
    //        dataType: 'json',
    //        // Assign data and render to html
    //        success: function (response) {
    //            if (response.status) {
    //                $.notify({
    //                    icon: 'fas fa-check',
    //                    message: "Hủy mượn thành công!"
    //                }, {
    //                        type: "success",
    //                        delay: 100,
    //                        offset: {
    //                            x: 20,
    //                            y: 70
    //                        },
    //                        z_index: 8000
    //                    });
    //                homeController.loadHistoryByUser();
    //                homeController.registerEvent();
    //            }
    //        }
    //    })
    //},

    pagingNewBook: function (total, callback) {
        var totalPage = Math.ceil(total / homeConfigNew.pageSize);
        //render pagination
        $('#paging-new').twbsPagination({
            totalPages: totalPage,
            visiblePages: 2,
            first: "",
            next: "<i class='fas fa-long-arrow-alt-right'></i>",
            prev: "<i class='fas fa-long-arrow-alt-left'></i>",
            last: "",
            onPageClick: function (event, page) {
                homeConfigNew.pageIndex = page;
            }
        });
        $("#paging-new> .pagination > .page-item").off('click').on('click', function (e) {
            setTimeout(callback, 100);
        });

    },
    pagingHotBook: function (total, callback) {
        var totalPage = Math.ceil(total / homeConfigHot.pageSize);
        //render pagination
        $('#paging-hot').twbsPagination({
            totalPages: totalPage,
            visiblePages: 2,
            first: "",
            next: "<i class='fas fa-long-arrow-alt-right'></i>",
            prev: "<i class='fas fa-long-arrow-alt-left'></i>",
            last: "",
            onPageClick: function (event, page) {
                homeConfigHot.pageIndex = page;
            }
        });
        $("#paging-hot> .pagination > .page-item").off('click').on('click', function (e) {
            setTimeout(callback, 100);
        });

    },
    pagingSellingSoonBook: function (total, callback) {
        var totalPage = Math.ceil(total / homeConfigSellingSoon.pageSize);
        //render pagination
        $('#paging-selling-soon').twbsPagination({
            totalPages: totalPage,
            visiblePages: 2,
            first: "",
            next: "<i class='fas fa-long-arrow-alt-right'></i>",
            prev: "<i class='fas fa-long-arrow-alt-left'></i>",
            last: "",
            onPageClick: function (event, page) {
                homeConfigSellingSoon.pageIndex = page;
            }
        });
        $("#paging-selling-soon> .pagination > .page-item").off('click').on('click', function (e) {
            setTimeout(callback, 100);
        });

    },
    pagingSearch: function (total, callback, changePageSize) {
        var totalPage = Math.ceil(total / homeConfig.pageSize);
        //render pagination
        //Unbind pagination if it existed or click change pagesize
        if ($('#paging-search a').length === 0 || changePageSize === true) {
            $('#paging-search').empty();
            $('#paging-search').removeData("twbs-pagination");
            $('#paging-search').unbind("page");
        }
        $('#paging-search').twbsPagination({
            totalPages: totalPage,
            visiblePages: 5,
            first: "",
            next: "<i class='fas fa-long-arrow-alt-right'></i>",
            prev: "<i class='fas fa-long-arrow-alt-left'></i>",
            last: "",
            onPageClick: function (event, page) {
                homeConfig.pageIndex = page;

            }
        });
        $(".page-item").off('click').on('click', function (e) {
            setTimeout(callback, 100);
        });

    },
    pagingCate: function (total, callback) {
        var totalPage = Math.ceil(total / homeConfigCategory.pageSize);
        //render pagination
        $('#paging-category').twbsPagination({
            totalPages: totalPage,
            visiblePages: 5,
            first: "",
            next: "<i class='fas fa-long-arrow-alt-right'></i>",
            prev: "<i class='fas fa-long-arrow-alt-left'></i>",
            last: "",
            onPageClick: function (event, page) {
                homeConfigCategory.pageIndex = page;
            }
        });
        $(".page-item").off('click').on('click', function (e) {
            setTimeout(callback, 100);
        });

    },
    pagingAll: function (total, callback) {
        var totalPage = Math.ceil(total / homeConfigAll.pageSize);
        //render pagination
        $('#paging-all').twbsPagination({
            totalPages: totalPage,
            visiblePages: 5,
            first: "",
            next: "<i class='fas fa-long-arrow-alt-right'></i>",
            prev: "<i class='fas fa-long-arrow-alt-left'></i>",
            last: "",
            onPageClick: function (event, page) {
                homeConfigAll.pageIndex = page;
            }
        });
        $(".page-item").off('click').on('click', function (e) {
            setTimeout(callback, 100);
        });

    }

};
$(document).ready(function () {
    // load data
    homeController.loadNewBook();
    homeController.loadHotBook();
    homeController.loadSellingSoonBook();
    totalItemDisplay();
    //var GetCurrentDate = function () {
    //    var fullDate = new Date();
    //    var twoDigitMonth = fullDate.getMonth() + 1;
    //    if (twoDigitMonth < 10) {
    //        twoDigitMonth = "0" + twoDigitMonth;
    //    }
    //    var day = fullDate.getDate();
    //    if (day < 10) {
    //        day = "0" + day;
    //    }
    //    var currentDate = fullDate.getFullYear() + "-" + twoDigitMonth + "-" + day;
    //    return currentDate;
    //};

    //var sessionMaxBook = $('#hold-session-max-book').html();
    //maxItem = sessionMaxBook;
    //// alert(sessionMaxBook);
    ////if (sessionMaxBook !== null && sessionMaxBook !== "" && sessionMaxBook !== undefined) {
    ////    alert(sessionMaxBook);
    ////}
    //$("#input-search").on("keyup", function (e) {
    //    //alert("abc");
    //    e.preventDefault();
    //    if (e.keyCode === 13) {

    //        var searchString = $('#input-search').val();
    //        if (searchString.trim() === "") {
    //            return false;
    //        }
    //        else {
    //            var html = "<div id='search-content' class='box featured'>"
    //                + "<div id='search-result' class='box-heading'></div>"
    //                + "<div class='box-content'>"
    //                + "<div class='box-product'>"
    //                + " <ul id='book-search' class='row'>"
    //                + "</ul>"
    //                + "</div>"
    //                + "<div id='paging-search' class='pagination'>"
    //                + "</div>"
    //                + "<div class='clear'></div>"
    //                + "</div>"
    //                + "</div>";
    //            $('#content').html(html);
    //            homeController.loadDataSearch(true);
    //        }
    //    }
    //});
    //$("#btn-choose-create").click(function () {
    //    $("#file-input-create").click();
    //});
    //$("#file-input-create").change(function (event) {
    //    var output = document.getElementById('image-create');
    //    output.src = URL.createObjectURL(event.target.files[0]);
    //});
    //var currentDate = GetCurrentDate();
    //var fromDay = GetCurrentDate();
    //$(".cate-list > a").click(function () {
    //    $(".cate-list > a").css("background", "");
    //    $(".cate-list > a").css("color", "");
    //    $(this).css("background", "#f36c4f");
    //    $(this).css("color", "#fff");
    //})
    //$('#toDay').val(currentDate);
    //$('#fromDay').val(fromDay);
    $('#btn-search').click(function () {
        var searchString = $('#input-search').val();
        if (searchString.trim() === "") {
            return false;
        }
        else {
            var html = "<div id='search-content' class='box featured'>"
                + "<div id='search-result' class='box-heading'></div>"
                + "<div class='box-content'>"
                + "<div class='box-product'>"
                + " <ul id='book-search' class='row'>"
                + "</ul>"
                + "</div>"
                + "<div id='paging-search' class='pagination'>"
                + "</div>"
                + "<div class='clear'></div>"
                + "</div>"
                + "</div>";
            $('#content').html(html);
            homeController.loadDataSearch(true);
        }

    });
    $('.all-book').click(function () {
        $('#input-search').val('');
        var html = "<div class='box featured'>"
            + "<div class='box-heading'>Tất cả sách</div>"
            + "<div class='box-content'>"
            + "<div class='box-product'>"
            + " <ul id='book-all' class='row'>"

            + "</ul>"
            + "</div>"
            + "<div id='paging-all' class='pagination'>"

            + "</div>"
            + "<div class='clear'></div>"
            + "</div>"
            + "</div>";
        $('#content').html(html);
        homeController.loadAllSellingBook();
        return false;
    });

    $('.cate-list').click(function () {
        homeConfigCategory.pageIndex = 1;
        $('#input-search').val('');
        var cateId = $(this).data('id');
        var cateName = $(this).children().html();
        var html = "<div class='box featured'>"
            + "<div id='category-book' class='box-heading'></div>"
            + "<div class='box-content'>"
            + "<div class='box-product'>"
            + " <ul id='book-by-category' class='row'>"

            + "</ul>"
            + "</div>"
            + "<div id='paging-category' class='pagination'>"

            + "</div>"
            + "<div class='clear'></div>"
            + "</div>"
            + "</div>";
        $('#list-cate-modal').modal('hide');
        $('#content').html(html);
        homeController.loadBookByCategory(cateId, cateName);
    });
    $('.more-cate').click(function () {
        $('#list-cate-modal').modal('show');
    });
    //$('#btn-borrow').click(function () {
    //    var tbody = $("#cart-content tbody");
    //    if (tbody.children().length == 0) {
    //        $.notify({
    //            icon: 'fas fa-exclamation-triangle',
    //            message: "Giỏ hàng trống!"
    //        }, {
    //                type: "warning",
    //                delay: 100,
    //                offset: {
    //                    x: 20,
    //                    y: 70
    //                },
    //                z_index: 8000
    //            });
    //    }
    //    else {
    //        homeController.sendOrder($(this).data("username"));
    //    }
    //});
    $('.mycart').click(function () {
        var imgEmpty = $('#img-empty');
        if (cartIsNotExist()) {
            if (imgEmpty.length !== 0) {
                $('#cart-content').hide();
                $('#price-cart').hide();
                $('#img-empty').remove();
                $('#all-item').append('<div id="img-empty" style="text-align: center;"><img src="./images/cart-empty.png"></div>');
                $('#total-price').html(0 + "&nbsp;<sup>đ</sup>");
            }
            else {
                $('#cart-content').hide();
                $('#price-cart').hide();
                $('#all-item').append('<div id="img-empty" style="text-align: center;"><img src="./images/cart-empty.png"></div>');
                $('#total-price').html(0 + "&nbsp;<sup>đ</sup>");
            }
        }
        else {
            var listItem = JSON.parse(localStorage.getItem("cart"));
            if (listItem.length === 0) {
                if (imgEmpty.length !== 0) {
                    $('#cart-content').hide();
                    $('#price-cart').hide();
                    $('#img-empty').remove();
                    $('#all-item').append('<div id="img-empty" style="text-align: center;"><img src="./images/cart-empty.png"></div>');
                    $('#total-price').html(0 + "&nbsp;<sup>đ</sup>");

                }
                else {
                    $('#cart-content').hide();
                    $('#price-cart').hide();
                    $('#all-item').append('<div id="img-empty" style="text-align: center;"><img src="./images/cart-empty.png"></div>');
                    $('#total-price').html(0 + "&nbsp;<sup>đ</sup>");
                }
            }
            else {
                imgEmpty.remove();
                var row = "";
                for (var i = 0; i < listItem.length; i++) {
                    row += "<tr id='cart-item-" + listItem[i].id + "' >"
                        + "<td>" + listItem[i].title + "</td>"
                        + "<td><input style='max-width:55px;color:black;padding-right:0px;' id='txtquantity-" + listItem[i].id + "' type='number' min='1'class='form-control txt-quantity' data-id='" + listItem[i].id + "' value='" + listItem[i].quantity + "' step='1' onkeydown='return false'>"
                        + "<td>" + formatter.format(listItem[i].price) + "&nbsp;<sup>đ</sup></td>"
                        + "<td><button onclick='deleteItem(" + listItem[i].id + "," + listItem[i].price + ")' data-sss='" + listItem[i].price + "' id='cart-delete-" + listItem[i].id + "' class='btn btn-danger delete-cart-item'><span class='fas fa-times'></span></button></td></tr >";
                }
                $('#cart-content >tbody').html("");
                $('#cart-content >tbody').html(row);
                $('#total-price').html("");
                $('#total-price').html(formatter.format(totalPrice()) + "&nbsp;<sup>đ</sup>");
                homeController.registerEvent();
            }
        }
        $('#cart-modal').modal('show');
    });
    $("#btn-pay").click(function () {
        var listItem = new Array();
        listItem = JSON.parse(localStorage.getItem("cart"));
        if (listItem.length === 0 || listItem.length === null || listItem.length === undefined) {
            $.notify({
                icon: 'fas fa-exclamation-triangle',
                message: "Giỏ hàng trống!"
            }, {
                    type: "warning",
                    delay: 100,
                    offset: {
                        x: 20,
                        y: 70
                    },
                    z_index: 8000
                });
        }
        else {
            $('#cart-modal').modal('hide');
            $('#txt-username').val('');
            $('#txt-address').val('');
            $('#txt-email').val('');
            $('#txt-phone').val('');
            $('#txt-id').data('id', '');
            $("#user-info-modal").modal("show");
        }
        
    });
    $('#txt-phone').change(function () {
        if ($('#txt-phone').val() !== "") {
            homeController.getCustomerInfo($('#txt-phone').val());
        }
        
    });
    $('#frm-info').submit(function (e) {
        e.preventDefault();
        var form = $(this);
        $(form).validate({
            rules: {
                "txt-username": {
                    required: true
                },
                "txt-address": {
                    required: true
                },
                "txt-email": {
                    required: true,
                    email: true
                },
                "txt-phone": {
                    required: true,
                    digits: true
                }
            },
            messages: {
                "txt-username": {
                    required: "Vui lòng nhập tên!"
                },
                "txt-address": {
                    required: "Vui lòng nhập địa chỉ!"
                },
                "txt-email": {
                    required: "Vui lòng nhập email!",
                    email: "Vui lòng nhập đúng email!"
                },
                "txt-phone": {
                    required: "Vui lòng nhập số điện thoại!",
                    digits: "Vui lòng nhập đúng số điện thoại!"
                }
            }
        });
        if (!form.valid()) {
            return false;
        }
        else {
            var TenKh = $('#txt-username').val();
            var DiaChi = $('#txt-address').val();
            var Email = $('#txt-email').val();
            var SoDienThoai = $('#txt-phone').val();
            var Id = $('#txt-id').data('id');
            var formData = new FormData();
            var customer = {
                Id: Id,
                TenKh: TenKh,
                DiaChi: DiaChi,
                Email: Email,
                SoDienThoai: SoDienThoai
            };
            formData.append("Customer", JSON.stringify(customer));
            formData.append("Order", localStorage.getItem("cart"));
            homeController.createOrder(formData);
        }
    });
    //$('.history').click(function () {
    //    var session = $('#hold-session').html();
    //    if (session != null && session !== "" && session !== undefined) {
    //        homeController.loadHistoryByUser();
    //        $('#history-modal').modal('show');

    //    }
    //    else {
    //        $.notify({
    //            icon: 'fas fa-exclamation-triangle',
    //            message: "Vui lòng đăng nhập để xem!"
    //        }, {
    //                type: "warning",
    //                delay: 100,
    //                offset: {
    //                    x: 20,
    //                    y: 70
    //                }
    //            });
    //    }

    //});

    $('.first').click(function () {
        window.location.reload();
    });
    $('#logo').click(function () {
        window.location.reload();
    });
    $('#read-more').click(function () {
        if ($('#read-more').data('status') === 1) {
            $('#detail-description').removeClass('detail-description');
            $('#detail-description').addClass('affter-click-readmore');
            $('#read-more').html('Thu gọn');
            $('#read-more').data('status', 0);
        }
        else {
            $('#detail-description').removeClass('affter-click-readmore');
            $('#detail-description').addClass('detail-description');
            $('#read-more').html('Xem thêm');
            $('#read-more').data('status', 1);
        }
        
        
    });
    $('#detail-add-to-cart').click(function () {
        var id = $('#detail-add-to-cart').data('id');
        var title = $('#detail-add-to-cart').data('title');
        var price = $('#detail-add-to-cart').data('price');
        var item = {
            id: id,
            title: title,
            quantity: 1,
            price: price
        };
        if (cartIsNotExist()) {
            var listItem = [];
            listItem.push(item);
            localStorage.setItem("cart", JSON.stringify(listItem));
            $.notify({
                icon: 'fas fa-check',
                message: "Đã thêm sách " + title + " vào giỏ hàng!"
            }, {
                    type: "success",
                    delay: 100,
                    offset: {
                        x: 20,
                        y: 70
                    },
                    z_index:8000
                });
            totalItemDisplay();
            $('#cart-content').show();
            $('#price-cart').show();
        }
        else {
            listItem = JSON.parse(localStorage.getItem("cart"));
            if (listItem.length === 0) {
                listItem.push(item);
                localStorage.setItem("cart", JSON.stringify(listItem));
                $.notify({
                    icon: 'fas fa-check',
                    message: "Đã thêm sách " + title + " vào giỏ hàng!"
                }, {
                        type: "success",
                        delay: 100,
                        offset: {
                            x: 20,
                            y: 70
                        },
                        z_index: 8000
                    });
                totalItemDisplay();
                $('#cart-content').show();
                $('#price-cart').show();
            }
            else {
                if (itemIsExistInCart(id, listItem)) {
                    $.notify({
                        icon: 'fas fa-exclamation-triangle',
                        message: "Sách đã có trong giỏ hàng, vào giỏ hàng để xem thông tin chi tiết!"
                    }, {
                            type: "warning",
                            delay: 100,
                            offset: {
                                x: 20,
                                y: 70
                            },
                            z_index: 8000
                        });
                }
                else {
                    listItem.push(item);
                    localStorage.setItem("cart", JSON.stringify(listItem));
                    $.notify({
                        icon: 'fas fa-check',
                        message: "Đã thêm sách " + title + " vào giỏ hàng!"
                    }, {
                            type: "success",
                            delay: 100,
                            offset: {
                                x: 20,
                                y: 70
                            },
                            z_index: 8000
                        });
                    totalItemDisplay();
                    $('#cart-content').show();
                    $('#price-cart').show();
                }
            }

        }
    });
    //$('#btn-search-history').click(function () {
    //    homeController.loadHistoryByUser();
    //})
    //$('#detail-add-to-cart').click(function () {
    //    $("#product_view").modal("hide");
    //    var id = $(this).data('id');
    //    //if cart empty
    //    if (listId.length < maxItem) {
    //        if (listId.length === 0) {
    //            removeImgWhenAdd();
    //            var title = $(this).data('title');
    //            var img = $(this).data('img');
    //            var downpayment = $(this).data('downpayment');
    //            var tbody = $("#cart-content tbody");
    //            listId.push(id);
    //            $('#cart-content').show();
    //            $('#price-cart').show();
    //            totalDownpaymentWhenAdd(downpayment);
    //            $('#cart-content >tbody:last-child').append('<tr id="cart-item-' + id + '"><td>'
    //                + title +
    //                '</td><td><img class="img-cart-item" src="'
    //                + img +
    //                '"> <td>'
    //                + formatter.format(downpayment) +
    //                '&nbsp;<sup>đ</sup></td><td><button onclick="deleteItem(' + id + ',' + downpayment + ')" data-sss="' + downpayment + '" id="cart-delete-' + id + '" class="btn btn-danger delete-cart-item"><span class="fas fa-times"></span></button></td></tr>');
    //            flag[0] = false;
    //            totalItem();
    //            $.notify({
    //                icon: 'fas fa-check',
    //                message: "Đã thêm sách " + title + " vào giỏ hàng!"
    //            }, {
    //                    type: "success",
    //                    delay: 100,
    //                    offset: {
    //                        x: 20,
    //                        y: 70
    //                    },
    //                    z_index: 8000
    //                });
    //        }
    //        //if cart has already existed 
    //        else {
    //            for (var i = 0; i < listId.length; i++) {
    //                if (listId[i] == id) {//if item has already existed
    //                    flag[i] = false;
    //                    index = i;//get index of id in list
    //                    break;
    //                }
    //                else {
    //                    flag[i + 1] = true;
    //                    index = i + 1;
    //                }

    //            }
    //            if (flag[index]) {//if status of id true then add item else show message

    //                var title = $(this).data('title');
    //                var img = $(this).data('img');
    //                var downpayment = $(this).data('downpayment');
    //                var tbody = $("#cart-content tbody");
    //                listId.push(id);
    //                $('#cart-content').show();
    //                totalDownpaymentWhenAdd(downpayment);
    //                $('#cart-content >tbody:last-child').append('<tr id="cart-item-' + id + '"><td>'
    //                    + title +
    //                    '</td><td><img class="img-cart-item" src="'
    //                    + img +
    //                    '"> <td>'
    //                    + formatter.format(downpayment) +
    //                    '&nbsp;<sup>đ</sup></td><td><button onclick="deleteItem(' + id + ',' + downpayment + ')" id="cart-delete-' + id + '" class="btn btn-danger delete-cart-item"><span class="fas fa-times"></span></button></td></tr>');
    //                flag[index] = false;
    //                totalItem();
    //                $.notify({
    //                    icon: 'fas fa-check',
    //                    message: "Đã thêm sách " + title + " vào giỏ hàng!"
    //                }, {
    //                        type: "success",
    //                        delay: 100,
    //                        offset: {
    //                            x: 20,
    //                            y: 70
    //                        },
    //                        z_index: 8000
    //                    });
    //            }

    //            else {
    //                $.notify({
    //                    icon: 'fas fa-exclamation-triangle',
    //                    message: "Sách đã có trong giỏ hàng"
    //                }, {
    //                        type: "warning",
    //                        delay: 100,
    //                        offset: {
    //                            x: 20,
    //                            y: 70
    //                        },
    //                        z_index: 8000
    //                    });
    //            }
    //        }
    //    }
    //    else {
    //        $.notify({
    //            icon: 'fas fa-exclamation-triangle',
    //            message: "Giỏ hàng đã đầy!"
    //        }, {
    //                type: "warning",
    //                delay: 100,
    //                offset: {
    //                    x: 20,
    //                    y: 70
    //                },
    //                z_index: 8000
    //            });
    //    }
    //})

});
