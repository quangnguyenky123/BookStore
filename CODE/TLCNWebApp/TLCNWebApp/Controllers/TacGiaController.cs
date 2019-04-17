using Microsoft.AspNetCore.Mvc;
using TLCNWebApp.BL;

namespace TLCNWebApp.Controllers
{
    public class TacGiaController : Controller
    {
        TacGiaBL tacGiaBL = new TacGiaBL();
        public IActionResult Index()
        {
            ViewBag.listStatus = tacGiaBL.GetAllStatus();
            return View();
        }
        [HttpGet]
        public JsonResult LoadData(string searchString, int page, int pageSize)
        {
            int totalRow = tacGiaBL.GetTotalRow(searchString);
            var listTacGia = tacGiaBL.GetAlAuthor(searchString, page, pageSize);
            return Json(new
            {
                data = listTacGia,
                totalRow = totalRow,
                status = true
            });
        }
        [HttpPost]
        public JsonResult Delete(int id)
        {
            int response = tacGiaBL.Delete(id);
            return Json(new
            {
                status = response
            });
        }
        [HttpGet]
        public JsonResult LoadDetail(int id)
        {
            var author = tacGiaBL.LoadDetail(id);
            return Json(new
            {
                data = author,
                status = true
            });
        }
        [HttpPost]
        public JsonResult Update(int id, string tenTacGia, string moTa, int trangThai)
        {
            int response = tacGiaBL.Update(id, tenTacGia, moTa, trangThai);
            return Json(new
            {
                status = response
            });
        }
        [HttpPost]
        public JsonResult Create(string tenTacGia, string moTa, int trangThai)
        {
            int response = tacGiaBL.Create(tenTacGia, moTa, trangThai);
            return Json(new
            {
                status = response
            });
        }
    }
}