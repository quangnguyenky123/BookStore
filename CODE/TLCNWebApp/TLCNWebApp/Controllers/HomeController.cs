using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using TLCNWebApp.BL;
using TLCNWebApp.Models.DTO;
using TLCNWebApp.Models.Entities;

namespace TLCNWebApp.Controllers
{
    public class HomeController : Controller
    {
        SachBL sachBL = new SachBL();
        DanhMucBL danhMucBL = new DanhMucBL();
        DonDatHangBL donDatHangBL = new DonDatHangBL();
        KhachHangBL khachHangBL = new KhachHangBL();
        public IActionResult Index()
        {
            ViewBag.ListCategoryAll = danhMucBL.GetAllCategory();
            ViewBag.ListCategoryDisplay = danhMucBL.GetCategoryDisplay();
            return View();
        }
        [HttpGet]
        public JsonResult GetNewBook(int pageIndex,int pageSize)
        {
            List<SachDTO> listSach = sachBL.GetListNewBookToDisplay(pageIndex, pageSize);
            int totalRow = sachBL.GetTotalRowNewBook();
            return Json(new {
                data=listSach,
                totalRow=totalRow,
                status=true
            });
        }
        [HttpGet]
        public JsonResult GetHotBook(int pageIndex, int pageSize)
        {
            List<SachDTO> listSach = sachBL.GetListHotBookToDisplay(pageIndex, pageSize);
            int totalRow = sachBL.GetTotalRowHotBook();
            return Json(new
            {
                data = listSach,
                totalRow = totalRow,
                status = true
            }); 
        }
        [HttpGet]
        public JsonResult GetSellingSoonBook(int pageIndex, int pageSize)
        {
            List<SachDTO> listSach = sachBL.GetListSellingSoonBookToDisplay(pageIndex, pageSize);
            int totalRow = sachBL.GetTotalRowSellingSoonBook();
            return Json(new
            {
                data = listSach,
                totalRow = totalRow,
                status = true
            });
        }
        [HttpGet]
        public JsonResult GetBookByCategory(int pageIndex, int pageSize,int cateId)
        {
            List<SachDTO> listSach = sachBL.GetBookByCategoryToDisplay(pageIndex, pageSize,cateId);
            int totalRow = sachBL.GetTotalRowBookByCategory(cateId);
            return Json(new
            {
                data = listSach,
                totalRow = totalRow,
                status = true
            });
        }
        [HttpGet]
        public JsonResult GetAllSellingBook(int pageIndex, int pageSize)
        {
            List<SachDTO> listSach = sachBL.GetAllSellingBookToDisplay(pageIndex, pageSize);
            int totalRow = sachBL.GetTotalRowAllSellingBook();
            return Json(new
            {
                data = listSach,
                totalRow = totalRow,
                status = true
            });
        }
        [HttpGet]
        public JsonResult Search(int pageIndex, int pageSize,string searchString)
        {
            List<SachDTO> listSach = sachBL.SearchToDisplay(pageIndex, pageSize, searchString);
            int totalRow = sachBL.GetTotalRowSearch(searchString);
            return Json(new
            {
                data = listSach,
                totalRow = totalRow,
                status = true
            });
        }
        [HttpGet]
        public JsonResult GetCustomerInfo(string phone)
        {
            KhachHangDTO cus = khachHangBL.GetCustomerByPhone(phone);
            if (cus != null)
            {
                return Json(new
                {
                    data = cus,
                    status = true
                });
            }
            else
            {
                return Json(new
                {
                    status = false
                });
            }
           
        }
        [HttpPost]
        public JsonResult CreateOrder()
        {
            Microsoft.Extensions.Primitives.StringValues customerJson;
            Microsoft.Extensions.Primitives.StringValues orderJson;
            HttpContext.Request.Form.TryGetValue("Customer", out customerJson);
            HttpContext.Request.Form.TryGetValue("Order", out orderJson);
            KhachHang customer = JsonConvert.DeserializeObject<KhachHang>(customerJson);
            List<OrderDTO> listOrderDetail = JsonConvert.DeserializeObject<List<OrderDTO>>(orderJson);
            donDatHangBL.CreateOrder(customer, listOrderDetail);
            return Json(new
            {
                status = true
            });
        }

    }
}