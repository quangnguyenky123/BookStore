using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using TLCNWebApp.BL;
using TLCNWebApp.Models.DTO;
using TLCNWebApp.Models.Entities;

namespace TLCNWebApp.Controllers
{
    public class QuanLyDonHangController : Controller
    {
        DonDatHangBL donDatHangBL = new DonDatHangBL();
        KhachHangBL khachHangBL = new KhachHangBL();
        ChiTietDonDatHangBL chiTietDonDatHangBL = new ChiTietDonDatHangBL();
        public IActionResult Index()
        {
            ViewBag.listTrangThai = donDatHangBL.GetAllStatus();
            return View();
        }
        [HttpGet]
        public JsonResult LoadData(string searchString, int pageIndex, int pageSize)
        {
            List<DonDatHangDTO> listDDH = donDatHangBL.GetListDonDatHang(searchString, pageIndex, pageSize);
            int totalRow = donDatHangBL.GetTotalRow(searchString);
            return Json(new
            {
                data = listDDH,
                totalRow = totalRow,
                status = true
            });
        }
        [HttpGet]
        public JsonResult GetOrderDetail(string id)
        {          
            DonDatHangDTO order = donDatHangBL.GetDonDatHangById(id);
            KhachHangDTO customer = khachHangBL.GetCustomerByOrderId(id);
            List<OrderDTO> listOrderDetail = chiTietDonDatHangBL.GetListOrderDetailByOrderId(id);          
            return Json(new
            {
                order = order,
                customer = customer,
                orderDetail = listOrderDetail,
                status=true
            });
        }
        [HttpPost]
        public JsonResult Update(string id, DateTime date, int status)
        {
            donDatHangBL.Update(id,date,status);
            return Json(new
            {
                status = true
            });
        }
    }
}