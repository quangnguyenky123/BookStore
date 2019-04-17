using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TLCNWebApp.Models.DTO
{
    public class SachDTO
    {
        
        public int Id { get; set; }
        public string TenSach { get; set; }     
        public int SoLuong { get; set; }
        public int Gia { get; set; }
        public int TrangThai { get; set; }
        public string TenTrangThai { get; set; }
        public string HinhAnh { get; set; }
        public string TenTacGia { get; set; }
        public string TenNhaXuatBan { get; set; }
        public string TenDanhMuc { get; set; }
        public string TomTat { get; set; }
        public int? Tap { get; set; }
        public string strTap { get; set; }
        public int SoLuotMua { get; set; }

    }
}
