using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using TLCNWebApp.BL;
using TLCNWebApp.Models.DTO;

namespace TLCNWebApp.Controllers
{
    public class ViewOrderController : Controller
    {
        DonDatHangBL donDatHangBL = new DonDatHangBL();
        KhachHangBL khachHangBL = new KhachHangBL();
        DanhMucBL danhMucBL = new DanhMucBL();
        ChiTietDonDatHangBL chiTietDonDatHangBL = new ChiTietDonDatHangBL();
        public IActionResult MyOrder(string id)
        {
            ViewBag.ListCategoryAll = danhMucBL.GetAllCategory();
            ViewBag.ListCategoryDisplay = danhMucBL.GetCategoryDisplay();
            donDatHangBL.UpdateOrderStatus(id);
            ViewBag.order = donDatHangBL.GetDonDatHangById(id);
            ViewBag.customer = khachHangBL.GetCustomerByOrderId(id);
            ViewBag.listOrderDetail = chiTietDonDatHangBL.GetListOrderDetailByOrderId(id);
            return View();
        }
    }
}