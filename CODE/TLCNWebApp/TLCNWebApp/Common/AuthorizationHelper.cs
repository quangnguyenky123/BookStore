using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TLCNWebApp.Models.Entities;

namespace TLCNWebApp.Common
{
    public  class AuthorizationHelper 
    {
        BookStoreContext db = new BookStoreContext();
        IHttpContextAccessor _httpContextAccessor;
        public AuthorizationHelper(IHttpContextAccessor httpContextAccessor)
        {
            _httpContextAccessor = httpContextAccessor;
        }
        public bool Authorize(string role,string userName)
        {
            QuanTriVien qtv = db.QuanTriVien.Where(q => q.TaiKhoan.Trim().ToUpper() == userName.Trim().ToUpper() && q.IdQuyenNavigation.TenQuyen==role).FirstOrDefault();
            if (qtv != null)
            {
                return true;
            }
            return false;
        }
        public void SetSession(string key,string value)
        {
            _httpContextAccessor.HttpContext.Session.SetString(key, value);
        }
        public string GetSession(string key)
        {
            return _httpContextAccessor.HttpContext.Session.GetString(key);
        }
    }
}
