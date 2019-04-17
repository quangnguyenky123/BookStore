using Microsoft.AspNetCore.Mvc;
using TLCNWebApp.BL;

namespace TLCNWebApp.Controllers
{
    public class NhaXuatBanController : Controller
    {
        NhaXuatBanBL nhaXuatBanBL = new NhaXuatBanBL();
        public IActionResult Index()
        {
            ViewBag.listStatus = nhaXuatBanBL.GetAllStatus();
            return View();
        }
        [HttpGet]
        public JsonResult LoadData(string searchString, int page, int pageSize)
        {
            int totalRow = nhaXuatBanBL.GetTotalRow(searchString);
            var listTacGia = nhaXuatBanBL.GetAllPublisher(searchString, page, pageSize);
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
            int response = nhaXuatBanBL.Delete(id);
            return Json(new
            {
                status = response
            });
        }
        [HttpGet]
        public JsonResult LoadDetail(int id)
        {
            var publisher = nhaXuatBanBL.LoadDetail(id);
            return Json(new
            {
                data = publisher,
                status = true
            });
        }
        [HttpPost]
        public JsonResult Update(int id, string tenNXB, string moTa, int trangThai)
        {
            int response = nhaXuatBanBL.Update(id, tenNXB, moTa, trangThai);
            return Json(new
            {
                status = response
            });
        }
        [HttpPost]
        public JsonResult Create(string tenNXB, string moTa, int trangThai)
        {
            int response = nhaXuatBanBL.Create(tenNXB, moTa, trangThai);
            return Json(new
            {
                status = response
            });
        }
    }
}