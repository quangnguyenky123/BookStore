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
    public class QuanLyNhapSachController : Controller
    {
        NhaXuatBanBL nhaXuatBanBL = new NhaXuatBanBL();
        SachBL sachBL = new SachBL();
        PhieuNhapBL phieuNhapBL = new PhieuNhapBL();
        ChiTietPhieuNhapBL chiTietPhieuNhapBL = new ChiTietPhieuNhapBL();
        public IActionResult Index()
        {
            ViewBag.listNhaXuatBan = nhaXuatBanBL.GetPublisherAvailable();
            return View();
        }
        [HttpGet]
        public JsonResult GetBook(string tenNBX)
        {
            bool status = true;
            List<Sach> listBook = sachBL.GetBookByPublisher(tenNBX);
            if(listBook.Count==0)
            {
                status = false;
            }
            return Json(new
            {
                status= status,
                data= listBook
            });
        }
        [HttpPost]
        public JsonResult CreateCoupon()
        {
            Microsoft.Extensions.Primitives.StringValues publisher;
            Microsoft.Extensions.Primitives.StringValues couponDetail;
            HttpContext.Request.Form.TryGetValue("Publisher", out publisher);
            HttpContext.Request.Form.TryGetValue("CouponDetail", out couponDetail);
            List<ChiTietPhieuNhapSach> listCoupons = JsonConvert.DeserializeObject<List<ChiTietPhieuNhapSach>>(couponDetail);
            NhaXuatBan nxb = nhaXuatBanBL.GetPublisherByName(publisher);
            phieuNhapBL.CretaCoupon(nxb, listCoupons);
            return Json(new
            {
                status = true
            });
        }
        [HttpGet]
        public JsonResult LoadData(string searchString, int pageIndex, int pageSize)
        {
            List<PhieuNhapDTO> listPhieuNhap = phieuNhapBL.GetListPhieuNhap(searchString, pageIndex, pageSize);
            int totalRow = phieuNhapBL.GetTotalRow(searchString);
            return Json(new
            {
                data = listPhieuNhap,
                totalRow=totalRow,
                status=true
            });
        }
        [HttpGet]
        public JsonResult GetCouponDetail(string id)
        {
            var coupon = phieuNhapBL.GetPhieuNhapById(id);
            return Json(new
            {
                data = chiTietPhieuNhapBL.GetListChiTietPhieuNhapDTOByPNId(id),
                date = coupon.NgayNhap,
                nxb = coupon.TenNXB,
                price = phieuNhapBL.GetPriceForCoupon(id),
                status = true
            });
        }


    }
}