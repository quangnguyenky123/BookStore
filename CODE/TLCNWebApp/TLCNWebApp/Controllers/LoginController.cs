using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using TLCNWebApp.Models.Entities;
using TLCNWebApp.Models.DTO;
using TLCNWebApp.BL;
using Microsoft.AspNetCore.Http;

namespace TLCNWebApp.Controllers
{
    public class LoginController : Controller
    {
        TaiKhoanBL taiKhoanBL = new TaiKhoanBL();
        public IActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public IActionResult CheckLogin(string userName, string password)
        {
            if (taiKhoanBL.LoginIsValid(userName,password))
            {
                string role = taiKhoanBL.GetRoleByUserName(userName);
                return Json(new
                {
                    status = true,
                    userName = userName,
                    role=role
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

    }
}