using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using TLCNWebApp.BL;
using WebApiContrib.Formatting;
using TLCNWebApp.Models.DTO;
using TLCNWebApp.Models.Entities;
using System.IO;
using TLCNWebApp.Common;

namespace TLCNWebApp.Controllers
{
    public class SachController : Controller
    {
        SachBL sachBL = new SachBL();
        public IActionResult Index()
        {
            ViewBag.listTrangThaiSach = sachBL.GetAllStatus();
            ViewBag.listDanhMuc = sachBL.GetAllCategory();
            ViewBag.listTacGia = sachBL.GetAllAuthor();
            ViewBag.listNhaXuatBan = sachBL.GetAllPublisher();
            return View();
        }
        [HttpGet]
        public JsonResult LoadData(string searchString, int page, int pageSize)
        {
            int totalRow = sachBL.GetTotalRow(searchString);
            var listSach = sachBL.GetAllBook(searchString, page, pageSize);
            return Json(new
            {
                data = listSach,
                totalRow = totalRow,
                status = true
            });
        }
        [HttpPost]
        public JsonResult Delete(int id)
        {
            int response = sachBL.Delete(id);
            return Json(new
            {
                status = response
            });
        }
        [HttpPost]
        public async Task<JsonResult> Create()
        {
            bool status = false;
            string mess = "";
            var pic = HttpContext.Request.Form.Files["HelpSectionImages"];
            Microsoft.Extensions.Primitives.StringValues book;
            HttpContext.Request.Form.TryGetValue("Book", out book);
            SachDTO sach = JsonConvert.DeserializeObject<SachDTO>(book);
            if (sach.strTap != null && sach.strTap!="")
            {
                sach.Tap = int.Parse(sach.strTap);
            }
            else
            {
                sach.Tap = null;
            }
            Sach newBook = new Sach();
            if(sachBL.CheckTitle(sach.TenSach,sach.Tap))
            {
                newBook.TenSach = sach.TenSach.Trim() ;
                newBook.Gia = sach.Gia;
                newBook.NgayThem = DateTime.Now.Date;
                newBook.SoLuong = 0;
                newBook.SoLuotMua = 0;
                newBook.Tap = sach.Tap;
                newBook.TomTat = sach.TomTat;
                newBook.TrangThai = sach.TrangThai;
                var fileName = newBook.TenSach+ newBook.Tap;
                var extension = Path.GetExtension(pic.FileName);
                newBook.HinhAnh = LanguageHelper.RemoveUnicode(fileName) + extension;
                var path = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot\\images\\HinhAnhSach", LanguageHelper.RemoveUnicode(fileName)+extension);              
                if (sachBL.CheckCategory(sach.TenDanhMuc))
                {
                    newBook.IdDanhMuc = sachBL.SelectCategoryByName(sach.TenDanhMuc).Id;
                    if (sachBL.CheckAuthor(sach.TenTacGia))
                    {
                        newBook.IdTacGia = sachBL.SelectAuthorByName(sach.TenTacGia).Id;
                        if (sachBL.CheckPublisher(sach.TenNhaXuatBan))
                        {
                            newBook.IdNxb = sachBL.SelectPublisherByName(sach.TenNhaXuatBan).Id;
                            sachBL.Create(newBook);
                            using (var stream = new FileStream(path, FileMode.Create))
                            {
                                await pic.CopyToAsync(stream);
                            }
                            status = true;
                            mess = "Thêm sách mới thành công!";
                        }
                        else
                        {
                            mess = "Nhà xuất bản chưa được tạo!";
                            status = false;
                        }
                    }
                    else
                    {
                        mess = "Tác giả chưa được tạo!";
                        status = false;
                    }
                }
                else
                {
                    mess = "Danh mục chưa được tạo!";
                    status = false;
                }
            }
            else
            {
                mess = "Sách đã tồn tại!";
                status = false;
            }           
            return Json(new
            {
                message=mess,
                status = status
            });
        }
        [HttpGet]
        public JsonResult LoadDetail(int id)
        {
            var book = sachBL.GetBookDTOById(id);
            return Json(new
            {
                status = true,
                data= book
            });
        }
    }
}