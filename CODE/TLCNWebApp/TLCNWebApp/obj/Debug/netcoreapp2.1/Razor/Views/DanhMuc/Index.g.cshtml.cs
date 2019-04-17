#pragma checksum "D:\Data\ASP.NET\Website bán sách sử dụng ASP.NET Core-15110291-14110188\CODE\TLCNWebApp\TLCNWebApp\Views\DanhMuc\Index.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "d06fc726d24bbd5bd1678d7b4474952bce820f34"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_DanhMuc_Index), @"mvc.1.0.view", @"/Views/DanhMuc/Index.cshtml")]
[assembly:global::Microsoft.AspNetCore.Mvc.Razor.Compilation.RazorViewAttribute(@"/Views/DanhMuc/Index.cshtml", typeof(AspNetCore.Views_DanhMuc_Index))]
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
#line 1 "D:\Data\ASP.NET\Website bán sách sử dụng ASP.NET Core-15110291-14110188\CODE\TLCNWebApp\TLCNWebApp\Views\DanhMuc\Index.cshtml"
using TLCNWebApp.Models.DTO;

#line default
#line hidden
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"d06fc726d24bbd5bd1678d7b4474952bce820f34", @"/Views/DanhMuc/Index.cshtml")]
    public class Views_DanhMuc_Index : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<DanhMucDTO>
    {
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_0 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("src", new global::Microsoft.AspNetCore.Html.HtmlString("~/js/Scripts/controllers/DanhMucController.js"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
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
#line 3 "D:\Data\ASP.NET\Website bán sách sử dụng ASP.NET Core-15110291-14110188\CODE\TLCNWebApp\TLCNWebApp\Views\DanhMuc\Index.cshtml"
  
    ViewData["Title"] = "Index";
    Layout = "~/Views/Layout/_Admin.cshtml";

#line default
#line hidden
            DefineSection("scripts", async() => {
                BeginContext(153, 12, true);
                WriteLiteral("\r\n    \r\n    ");
                EndContext();
                BeginContext(165, 69, false);
                __tagHelperExecutionContext = __tagHelperScopeManager.Begin("script", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "79eb5a84d16b454bbe996c53408eb597", async() => {
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
                BeginContext(234, 2, true);
                WriteLiteral("\r\n");
                EndContext();
            }
            );
            BeginContext(239, 5107, true);
            WriteLiteral(@"<div class=""title"">
    <h4>Quản lý danh mục</h4>
</div>
<div class=""row"">
    <div class=""add-item"">
        <a class=""btn btn-default"" href=""#"" id=""btn-add"" role=""button"" >Thêm mới</a>
    </div>
    <div class=""search"">
        <select name="""" id=""pageSize"" class=""text-inline-select"">
            <option value=""5"">5 rows</option>
            <option value=""10"">10 rows</option>
            <option value=""20"">20 rows</option>
        </select>
        <input type=""text"" id=""search"" class=""text-inline-input"" placeholder=""&#xF002; Nhập tên danh mục..."">

    </div>
    <div class=""table-responsive"">
        <table class=""table table-hover table-bordered"">
            <thead>
                <tr>
                    <th style=""width:350px;"">Tên danh mục</th>
                    <th>Mô tả</th>
                    <th style=""width:150px;"">Trạng thái</th>
                    <th style=""width:150px;""></th>
                </tr>
            </thead>
            <tbody id=""tblData""></tbody>");
            WriteLiteral(@"
        </table>
        <script id=""data-template"" type=""x-tmpl-mustache"">
            <tr>
                <td>{{TenDanhMuc}}</td>
                <td>{{MoTa}}</td>
                <td>{{TrangThai}}</td>
                <td>
                    <button type=""button"" class=""fas fa-pen blue btn-update"" data-id=""{{Id}}"" title=""Click để cập nhật""></button>
                    <button type=""button"" class=""fas fa-info green btn-detail"" data-id=""{{Id}}"" title=""Click để xem chi tiết""></button>
                    <button type=""button"" class=""fas fa-trash red btn-delete"" data-id=""{{Id}}"" title=""Click để xóa""></button>

                </td>
            </tr>
        </script>
    </div>
    <div id=""pagination"" style=""text-align:center""></div>
</div>
<div class=""footer"">
    <h5>&copy; BookStore Management. All right reserved.</h5>
</div>
<div id=""category-detail"" class=""modal fade"" role=""dialog"">
    <div class=""modal-dialog modal-lg"">
        <div class=""modal-content"">
            <div cla");
            WriteLiteral(@"ss=""modal-header"">
                <button type=""button"" class=""close"" data-dismiss=""modal"">&times;</button>
                <h4 class=""modal-title"">Chi tiết danh mục</h4>
            </div>
            <div class=""modal-body"">
                <div class=""row"">
                    <div id=""detail-content"" class=""col-xs-12 col-sm-12 col-md-12 col-lg-12"">

                    </div>
                </div>
            </div>
            <div class=""modal-footer"">
                <button type=""button"" class=""btn btn-danger modal-btn"" data-dismiss=""modal"">Đóng</button>
            </div>
        </div>
    </div>
</div>

<script id=""detail-template"" type=""x-tmpl-mustache"">
    <div class=""form-group row detail-row"">
        <label class=""col-sm-3 col-form-label detail-lbl"" for="""">Tên danh mục :</label>
        <div class=""col-sm-9"">
            <input type=""text"" value=""{{TenDanhMuc}}"" class=""form-control"" id="""" disabled>
        </div>
    </div>
    <div class=""form-group row detail-row""");
            WriteLiteral(@">
        <label class=""col-sm-3 col-form-label detail-lbl"" for="""">Trạng thái :</label>
        <div class=""col-sm-9"">
            <input type=""text"" value=""{{TrangThai}}"" class=""form-control"" id="""" disabled>
        </div>
    </div>
    <div class=""form-group row detail-row"">
        <label class=""col-sm-3 col-form-label detail-lbl"" for="""">Mô tả :</label>
        <div class=""col-sm-9"">
            <textarea class=""form-control"" name="""" id="""" cols=""30"" rows=""10"" disabled> {{MoTa}}</textarea>
        </div>
    </div>
</script>
<div id=""category-update"" class=""modal fade"" role=""dialog"">
</div>
<script id=""update-template"" type=""x-tmpl-mustache"">
    <div class=""modal-dialog modal-lg"">

        <!-- Modal content-->
        <div class=""modal-content"">
            <form id=""frm-update"" method=""post"">
                <div class=""modal-header"">
                    <button type=""button"" class=""close"" data-dismiss=""modal"">&times;</button>
                    <h4 class=""modal-title"">Cập nhật d");
            WriteLiteral(@"anh mục</h4>
                </div>
                <div class=""modal-body"">
                    <div class=""row"">
                        <div class=""col-xs-12 col-sm-12 col-md-12 col-lg-12"">


                            <div class=""form-group row detail-row"">
                                <label class=""col-sm-3 col-form-label detail-lbl"" for="""">Tên danh mục :</label>
                                <div class=""col-sm-9"">

                                    <input type=""text"" value=""{{TenDanhMuc}}"" class=""form-control"" id=""txtTenDanhMuc"" name=""txtTenDanhMuc"">
                                </div>
                            </div>
                            <div class=""form-group row detail-row"">
                                <label class=""col-sm-3 col-form-label detail-lbl"" for="""">Trạng thái :</label>
                                <div class=""col-sm-9"">
                                    <select class=""form-control"" name="""" data-stt=""{{TrangThai}}"" id=""sll-status"">
");
            EndContext();
#line 127 "D:\Data\ASP.NET\Website bán sách sử dụng ASP.NET Core-15110291-14110188\CODE\TLCNWebApp\TLCNWebApp\Views\DanhMuc\Index.cshtml"
                                         foreach (var status in ViewBag.listStatus)
                                        {

#line default
#line hidden
            BeginContext(5474, 51, true);
            WriteLiteral("                                            <option");
            EndContext();
            BeginWriteAttribute("value", " value=\"", 5525, "\"", 5543, 1);
#line 129 "D:\Data\ASP.NET\Website bán sách sử dụng ASP.NET Core-15110291-14110188\CODE\TLCNWebApp\TLCNWebApp\Views\DanhMuc\Index.cshtml"
WriteAttributeValue("", 5533, status.Id, 5533, 10, false);

#line default
#line hidden
            EndWriteAttribute();
            BeginContext(5544, 1, true);
            WriteLiteral(">");
            EndContext();
            BeginContext(5546, 19, false);
#line 129 "D:\Data\ASP.NET\Website bán sách sử dụng ASP.NET Core-15110291-14110188\CODE\TLCNWebApp\TLCNWebApp\Views\DanhMuc\Index.cshtml"
                                                                  Write(status.TenTrangThai);

#line default
#line hidden
            EndContext();
            BeginContext(5565, 11, true);
            WriteLiteral("</option>\r\n");
            EndContext();
#line 130 "D:\Data\ASP.NET\Website bán sách sử dụng ASP.NET Core-15110291-14110188\CODE\TLCNWebApp\TLCNWebApp\Views\DanhMuc\Index.cshtml"
                                        }

#line default
#line hidden
            BeginContext(5619, 2405, true);
            WriteLiteral(@"                                    </select>
                                </div>
                            </div>
                            <div class=""form-group row detail-row"">
                                <label class=""col-sm-3 col-form-label detail-lbl"" for="""">Mô tả :</label>
                                <div class=""col-sm-9"">
                                    <textarea class=""form-control"" name=""txtMoTa"" id=""txtMoTa"" cols=""30"" rows=""10"">{{MoTa}}</textarea>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class=""modal-footer"">
                    <button type=""button"" class=""btn btn-danger modal-btn"" data-dismiss=""modal"">Đóng</button>
                    <button id=""btn-update"" data-id=""{{Id}}"" type=""submit"" class=""btn btn-success modal-btn"">Cập nhật</button>
                </div>
            </form>
        </div>

    </div>
</script>
<di");
            WriteLiteral(@"v id=""category-create"" class=""modal fade"" role=""dialog"">
    <div class=""modal-dialog modal-lg"">
        <form id=""frm-create"" method=""post"">
            <!-- Modal content-->
            <div class=""modal-content"">
                <div class=""modal-header"">
                    <button type=""button"" class=""close"" data-dismiss=""modal"">&times;</button>
                    <h4 class=""modal-title"">Thêm danh mục mới</h4>
                </div>
                <div class=""modal-body"">
                    <div class=""row"">
                        <div class=""col-xs-12 col-sm-12 col-md-12 col-lg-12"">
                            <div class=""form-group row detail-row"">
                                <label class=""col-sm-3 col-form-label detail-lbl"" for="""">Tên danh mục :</label>
                                <div class=""col-sm-9"">
                                    <input type=""text"" value="""" class=""form-control""name=""categoryName"" id=""categoryName"">
                                </div>
          ");
            WriteLiteral(@"                  </div>
                            <div class=""form-group row detail-row"">
                                <label class=""col-sm-3 col-form-label detail-lbl"" for="""">Trạng thái :</label>
                                <div class=""col-sm-9"">
                                    <select class=""form-control"" name="""" id=""categoryStatus"">
");
            EndContext();
#line 175 "D:\Data\ASP.NET\Website bán sách sử dụng ASP.NET Core-15110291-14110188\CODE\TLCNWebApp\TLCNWebApp\Views\DanhMuc\Index.cshtml"
                                         foreach (var status in ViewBag.listStatus)
                                        {

#line default
#line hidden
            BeginContext(8152, 51, true);
            WriteLiteral("                                            <option");
            EndContext();
            BeginWriteAttribute("value", " value=\"", 8203, "\"", 8221, 1);
#line 177 "D:\Data\ASP.NET\Website bán sách sử dụng ASP.NET Core-15110291-14110188\CODE\TLCNWebApp\TLCNWebApp\Views\DanhMuc\Index.cshtml"
WriteAttributeValue("", 8211, status.Id, 8211, 10, false);

#line default
#line hidden
            EndWriteAttribute();
            BeginContext(8222, 1, true);
            WriteLiteral(">");
            EndContext();
            BeginContext(8224, 19, false);
#line 177 "D:\Data\ASP.NET\Website bán sách sử dụng ASP.NET Core-15110291-14110188\CODE\TLCNWebApp\TLCNWebApp\Views\DanhMuc\Index.cshtml"
                                                                  Write(status.TenTrangThai);

#line default
#line hidden
            EndContext();
            BeginContext(8243, 11, true);
            WriteLiteral("</option>\r\n");
            EndContext();
#line 178 "D:\Data\ASP.NET\Website bán sách sử dụng ASP.NET Core-15110291-14110188\CODE\TLCNWebApp\TLCNWebApp\Views\DanhMuc\Index.cshtml"
                                        }

#line default
#line hidden
            BeginContext(8297, 990, true);
            WriteLiteral(@"                                    </select>
                                </div>
                            </div>
                            <div class=""form-group row detail-row"">
                                <label class=""col-sm-3 col-form-label detail-lbl"" for="""">Mô tả :</label>
                                <div class=""col-sm-9"">
                                    <textarea class=""form-control"" name="""" id=""categoryDescription"" cols=""30"" rows=""10""></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class=""modal-footer"">
                    <button type=""button"" class=""btn btn-danger modal-btn"" data-dismiss=""modal"">Đóng</button>
                    <button id=""btn-tao"" type=""submit"" class=""btn btn-success modal-btn"">Tạo</button>
                </div>
            </div>
            </form>
    </div>
</div>
");
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
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<DanhMucDTO> Html { get; private set; }
    }
}
#pragma warning restore 1591
