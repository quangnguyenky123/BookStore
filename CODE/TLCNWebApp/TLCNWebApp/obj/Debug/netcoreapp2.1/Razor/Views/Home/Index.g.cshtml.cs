#pragma checksum "D:\Data\ASP.NET\Website bán sách sử dụng ASP.NET Core-15110291-14110188\CODE\TLCNWebApp\TLCNWebApp\Views\Home\Index.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "16cc0eefbb490389e75c5bdcd7277e2653bdbdb8"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_Home_Index), @"mvc.1.0.view", @"/Views/Home/Index.cshtml")]
[assembly:global::Microsoft.AspNetCore.Mvc.Razor.Compilation.RazorViewAttribute(@"/Views/Home/Index.cshtml", typeof(AspNetCore.Views_Home_Index))]
namespace AspNetCore
{
    #line hidden
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Threading.Tasks;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.AspNetCore.Mvc.Rendering;
    using Microsoft.AspNetCore.Mvc.ViewFeatures;
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"16cc0eefbb490389e75c5bdcd7277e2653bdbdb8", @"/Views/Home/Index.cshtml")]
    public class Views_Home_Index : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<dynamic>
    {
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_0 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("src", new global::Microsoft.AspNetCore.Html.HtmlString("~/js/Scripts/controllers/HomeController.js"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        #line hidden
        #pragma warning disable 0169
        private string __tagHelperStringValueBuffer;
        #pragma warning restore 0169
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext __tagHelperExecutionContext;
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner __tagHelperRunner = new global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner();
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager __backed__tagHelperScopeManager = null;
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager __tagHelperScopeManager
        {
            get
            {
                if (__backed__tagHelperScopeManager == null)
                {
                    __backed__tagHelperScopeManager = new global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager(StartTagHelperWritingScope, EndTagHelperWritingScope);
                }
                return __backed__tagHelperScopeManager;
            }
        }
        private global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.UrlResolutionTagHelper __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper;
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
#line 1 "D:\Data\ASP.NET\Website bán sách sử dụng ASP.NET Core-15110291-14110188\CODE\TLCNWebApp\TLCNWebApp\Views\Home\Index.cshtml"
  
    ViewData["Title"] = "Index";
    Layout = "~/Views/Layout/_User.cshtml";

#line default
#line hidden
            DefineSection("scripts", async() => {
                BeginContext(103, 6, true);
                WriteLiteral("\r\n    ");
                EndContext();
                BeginContext(109, 66, false);
                __tagHelperExecutionContext = __tagHelperScopeManager.Begin("script", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "c06b20a4525149d59ac2b87de8a434cc", async() => {
                }
                );
                __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.UrlResolutionTagHelper>();
                __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper);
                __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_0);
                await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
                if (!__tagHelperExecutionContext.Output.IsContentModified)
                {
                    await __tagHelperExecutionContext.SetOutputContentAsync();
                }
                Write(__tagHelperExecutionContext.Output);
                __tagHelperExecutionContext = __tagHelperScopeManager.End();
                EndContext();
                BeginContext(175, 2, true);
                WriteLiteral("\r\n");
                EndContext();
            }
            );
            BeginContext(180, 9869, true);
            WriteLiteral(@"<div id=""container"">
    <p id=""back-top""> <a href=""#top""><span></span></a> </p>
    <div class=""container"">
        <div id=""notification""></div>
        <div class=""row"">
            <div class=""col-sm-12 "" id=""content"">
                <script type=""text/javascript"">
                    if ($('.container').width() > 723) {
                        (function ($) {
                            $.fn.equalHeights = function (minHeight, maxHeight) {
                                tallest = (minHeight) ? minHeight : 0;
                                this.each(function () {
                                    if ($(this).height() > tallest) {
                                        tallest = $(this).height()
                                    }
                                });
                                if ((maxHeight) && tallest > maxHeight) tallest = maxHeight;
                                return this.each(function () {
                                    $(this).height(tallest)
 ");
            WriteLiteral(@"                               })
                            }
                        })(jQuery)
                        $(window).load(function () {
                            if ($("".maxheight-feat"").length) {
                                $("".maxheight-feat"").equalHeights()
                            }
                        });
                    };
                </script>
                <div class=""box specials"">
                    <div class=""box-heading"">Sách mới</div>
                    <div class=""box-content"">
                        <div class=""box-product"">
                            <ul id=""book-new"" class=""row""></ul>
                        </div>
                        <div id=""paging-new"" class=""pagination"">

                        </div>

                    </div>
                </div>
                <div class=""box specials"">
                    <div class=""box-heading special-heading"">Sách bán chạy</div>
                    <div class=""box-content""");
            WriteLiteral(@">
                        <div class=""box-product"">
                            <ul id=""book-hot"" class=""row""></ul>
                        </div>
                        <div id=""paging-hot"" class=""pagination"">

                        </div>
                    </div>
                </div>
                <div class=""box specials"">
                    <div class=""box-heading special-heading"">Sách sắp bán</div>
                    <div class=""box-content"">
                        <div class=""box-product"">
                            <ul id=""book-selling-soon"" class=""row""></ul>
                        </div>
                        <div id=""paging-selling-soon"" class=""pagination"">

                        </div>
                    </div>
                </div>
            </div>
            <div class=""clear""></div>
        </div>
    </div>
</div>

<script id=""book-template"" type=""x-tmpl-mustache"">
    <li class=""col-sm-2"">
        <div>
            <div class=""image2"" data-id=");
            WriteLiteral(@"""{{Id}}""
                 data-price=""{{Gia}}""
                 data-description=""{{TomTat}}""
                 data-img=""~/images/HinhAnhSach/{{HinhAnh}}""
                 data-title=""{{TenSach}}""
                 data-author=""{{TacGia}}""
                 data-part=""{{Tap}}""
                <a title=""{{TenSach}}"">
                    <img class=""book-img"" id="""" src=""images/HinhAnhSach/{{HinhAnh}}"" alt=""{{HinhAnh}}"" />
                </a>
                <a data-id=""{{Id}}""
                   data-price=""{{Gia}}""
                   data-img=""/images/HinhAnhSach/{{HinhAnh}}""
                   data-title=""{{TenSach}}""
                   data-author=""{{TacGia}}""
                   data-description=""{{TomTat}}""
                   data-part=""{{Tap}}"" rel=""colorbox"" class=""colorbox4 quick-view-button"">
                    <i class=""fa fa-search-plus ""></i>
                </a>
            </div>
            <div class=""inner"">
                <div class=""f-left maxheight-feat"">
              ");
            WriteLiteral(@"      <div class=""name book-title book-title1"" title=""{{TenSach}}"">
                        <a>{{TenSach}}</a>
                    </div>
                    <div class=""description book-description book-description1"" title=""{{TomTat}}"">{{TomTat}}</div>
                </div>
                <div class=""cart-button"">
                    <div class=""price"">
                        <span class=""price-display"">{{GiaFormat}}</span>&nbsp;<sup>đ</sup>
                    </div>

                    <div class=""cart"">
                        <a title=""Add to cart""
                           data-id=""{{Id}}""
                           data-price=""{{Gia}}""
                           data-description=""{{TomTat}}""
                           data-img=""~/images/HinhAnhSach/{{HinhAnh}}""
                           data-title=""{{TenSach}}""
                           data-author=""{{TacGia}}""
                           data-part=""{{Tap}}""
                           class=""button addToCart tooltip-1 add-to-ca");
            WriteLiteral(@"rt"">
                            <i class=""fa fa-shopping-cart""></i>
                            <span>Add to cart</span>
                        </a>
                    </div>
                    <span class=""clear""></span>
                </div>
                <div class=""clear"">
                </div>
            </div>
            <div class=""clear""></div>
        </div>
    </li>
</script>
<script id=""selling-soon-book-template"" type=""x-tmpl-mustache"">
    <li class=""col-sm-2"">
        <div>
            <div class=""image2"" data-id=""{{Id}}""
                 data-price=""{{Gia}}""
                 data-description=""{{TomTat}}""
                 data-img=""~/images/HinhAnhSach/{{HinhAnh}}""
                 data-title=""{{TenSach}}""
                 data-author=""{{TacGia}}""
                 data-part=""{{Tap}}""
                <a title=""{{TenSach}}"">
                    <img class=""book-img"" id="""" src=""images/HinhAnhSach/{{HinhAnh}}"" alt=""{{HinhAnh}}"" />
                </a>
          ");
            WriteLiteral(@"      <a data-id=""{{Id}}""
                   data-price=""{{Gia}}""
                   data-img=""/images/HinhAnhSach/{{HinhAnh}}""
                   data-title=""{{TenSach}}""
                   data-author=""{{TacGia}}""
                   data-description=""{{TomTat}}""
                   data-disable=""true""
                   data-part=""{{Tap}}"" rel=""colorbox"" class=""colorbox4 quick-view-button"">
                    <i class=""fa fa-search-plus ""></i>
                </a>
            </div>
            <div class=""inner"">
                <div class=""f-left maxheight-feat"">
                    <div class=""name book-title book-title1"" title=""{{TenSach}}"">
                        <a>{{TenSach}}</a>
                    </div>
                    <div class=""description book-description book-description1"" title=""{{TomTat}}"">{{TomTat}}</div>
                </div>
                <div class=""cart-button"">
                    <div class=""price"">
                        <span class=""price-display"">{{Gia");
            WriteLiteral(@"Format}}</span>&nbsp;<sup>đ</sup>
                    </div>

                    <div class=""cart"">
                        <a title=""Add to cart""
                           data-id=""{{Id}}""
                           data-price=""{{Gia}}""
                           data-description=""{{TomTat}}""
                           data-img=""/images/HinhAnhSach/{{HinhAnh}}""
                           data-title=""{{TenSach}}""
                           data-author=""{{TacGia}}""
                           data-part=""{{Tap}}""
                           class=""button addToCart tooltip-1 disable"">
                            <i class=""fa fa-shopping-cart""></i>
                            <span>Add to cart</span>
                        </a>
                    </div>
                    <span class=""clear""></span>
                </div>
                <div class=""clear"">
                </div>
            </div>
            <div class=""clear""></div>
        </div>
    </li>
</script>
<div class=""mo");
            WriteLiteral(@"dal fade product_view"" id=""product_view"">
    <div class=""modal-dialog"">
        <div class=""modal-content"">
            <div class=""modal-header"">
                <a href=""#"" data-dismiss=""modal"" class=""class pull-right""><span class=""fas fa-times""></span></a>
                <h3 class=""modal-title"" style=""margin-left:20px;"">Chi tiết sách</h3>
            </div>
            <div class=""modal-body"">
                <div id=""row-detail-book"" class=""row"">
                    <div class=""col-md-4 product_img"">
                        <img id=""detail-image"" src="""" class=""img-responsive"">
                    </div>
                    <div class=""col-md-8 product_content"">
                        <p style=""font-weight:bold;color :black;"" id=""detail-title""></p>
                        <p><span id=""detail-part""></span></p>
                        <p><span style=""font-weight:bold"" id=""detail-author""></span></p>
                        <p><span class=""detail-description"" id=""detail-description""></span><");
            WriteLiteral(@"span data-status=""1"" class=""detail-description"" id=""read-more"">Xem thêm</span></p>
                        <p style=""color:black;font-size:20px"" id=""cost""><b >Giá</b> :&nbsp;<span  id=""detail-price""></span><sup>đ</sup></></p>
                    </div>
                </div>
            </div>
            <div class=""modal-footer"">
                <div class=""btn-ground"">
                    <button style=""margin-right:15px;"" id=""detail-add-to-cart"" type=""button"" class=""btn btn-primary""><span class=""fas fa-shopping-cart""></span>&nbsp;Thêm vào giỏ hàng</button>
                </div>
            </div>
        </div>
    </div>
</div>");
            EndContext();
        }
        #pragma warning restore 1998
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.ViewFeatures.IModelExpressionProvider ModelExpressionProvider { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IUrlHelper Url { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IViewComponentHelper Component { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IJsonHelper Json { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<dynamic> Html { get; private set; }
    }
}
#pragma warning restore 1591
