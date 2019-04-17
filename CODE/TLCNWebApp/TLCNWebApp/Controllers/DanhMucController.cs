using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using TLCNWebApp.BL;
using TLCNWebApp.Common;

namespace TLCNWebApp.Controllers
{
   
    public class DanhMucController : Controller
    {
        DanhMucBL danhMucBL = new DanhMucBL();
        private readonly AuthorizationHelper _requestHandler;

        public DanhMucController(AuthorizationHelper requestHandler)
        {
            _requestHandler = requestHandler;
        }
        public IActionResult Index()
        {
            //if (userName == null)
            //{
            //    return RedirectToAction("Index", "Login");
            //}
            //if (auth.Authorize("Admin", userName))
            //{
            ViewBag.listStatus = danhMucBL.GetAllStatus();
            return View();
            //}
            //return RedirectToAction("Error401", "Error");
        }
        [HttpGet]
        public JsonResult LoadData(string searchString,int page,int pageSize)
        {
            int totalRow = danhMucBL.GetTotalRow(searchString);
            var listDanhMuc = danhMucBL.GetAllCategory(searchString ,page, pageSize );
            return Json(new
            {
                data = listDanhMuc,
                totalRow= totalRow,
                status =true
            });
        }
        [HttpPost]
        public JsonResult Delete(int id)
        {
            int response = danhMucBL.Delete(id);
            return Json(new
            {
                status = response
            });
        }
        [HttpGet]
        public JsonResult LoadDetail(int id)
        {
            var category = danhMucBL.LoadDetail(id);
            return Json(new
            {
                data = category,
                status = true
        
            });
        }
        [HttpPost]
        public JsonResult Update(int id, string tenDanhMuc,string moTa,int trangThai)
        {
            int response = danhMucBL.Update(id, tenDanhMuc, moTa, trangThai);
            return Json(new
            {
                status = response
            });
        }
        [HttpPost]
        public JsonResult Create(string tenDanhMuc, string moTa, int trangThai)
        {
            int response = danhMucBL.Create(tenDanhMuc, moTa, trangThai);
            return Json(new
            {
                status = response
            });
        }

    }
}