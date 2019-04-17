using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TLCNWebApp.Models.DTO;
using TLCNWebApp.Models.Entities;

namespace TLCNWebApp.BL
{
    public class KhachHangBL
    {
        BookStoreContext db=new BookStoreContext();
        public KhachHang GetCustomerById(string id)
        {
            return db.KhachHang.Where(c => c.Id == id).FirstOrDefault();
        }
        public KhachHangDTO GetCustomerByOrderId(string id)
        {
            DonDatHang order = db.DonDatHang.Where(o => o.Id == id).FirstOrDefault();
            return db.KhachHang.Where(c => c.Id == order.IdKh).Select(s => new KhachHangDTO {
                Id = s.Id,
                TenKh = s.TenKh,
                DiaChi = s.DiaChi,
                Email=s.Email,
                SoDienThoai = s.SoDienThoai              
            }).FirstOrDefault();
        }
        public KhachHangDTO GetCustomerByPhone(string phone)
        {
            return db.KhachHang.Where(c => c.SoDienThoai.Trim() == phone.Trim()).Select(s => new KhachHangDTO
            {
                Id = s.Id,
                TenKh = s.TenKh,
                DiaChi = s.DiaChi,
                Email = s.Email,
                SoDienThoai = s.SoDienThoai
            }).FirstOrDefault();
        }
    }
}
