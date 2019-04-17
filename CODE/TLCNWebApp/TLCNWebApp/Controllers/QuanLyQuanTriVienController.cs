using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using TLCNWebApp.BL;
using TLCNWebApp.Models.DTO;

namespace TLCNWebApp.Controllers
{
    public class QuanLyQuanTriVienController : Controller
    {
        private TaiKhoanBL taiKhoanBL = new TaiKhoanBL();
        public IActionResult Index()
        {
            ViewBag.listRoles = taiKhoanBL.GetAllRoles();
            ViewBag.listAccountStatus = taiKhoanBL.GetAllAccountStatus();
            return View();
        }
        [HttpGet]
        public JsonResult LoadData(string searchString, int pageIndex, int pageSize)
        {
            List<TaiKhoanDTO> list = taiKhoanBL.GetListAccount(searchString, pageIndex, pageSize);
            int totalRow = taiKhoanBL.GetTotalRow(searchString);
            return Json(new
            {
                data = list,
                totalRow = totalRow,
                status = true
            });
        }
        [HttpGet]
        public JsonResult LoadDetail(int id)
        {
            var data = taiKhoanBL.getAccountById(id);
            return Json(new
            {
                data = data,
                status = true
            });
        }
        [HttpPost]
        public JsonResult Update()
        {
            Microsoft.Extensions.Primitives.StringValues accountJson;
            HttpContext.Request.Form.TryGetValue("Account", out accountJson);
            TaiKhoanDTO account = JsonConvert.DeserializeObject<TaiKhoanDTO>(accountJson);
            taiKhoanBL.Update(account);
            return Json(new
            {
                status = true
            });
        }
        [HttpPost]
        public JsonResult Create()
        {
            Microsoft.Extensions.Primitives.StringValues accountJson;
            HttpContext.Request.Form.TryGetValue("Account", out accountJson);
            TaiKhoanDTO account = JsonConvert.DeserializeObject<TaiKhoanDTO>(accountJson);
            int status = taiKhoanBL.Create(account);
            return Json(new
            {
                status = status
            });
        }
    }
}