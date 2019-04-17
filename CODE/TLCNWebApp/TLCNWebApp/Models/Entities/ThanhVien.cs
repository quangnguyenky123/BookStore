using System;
using System.Collections.Generic;

namespace TLCNWebApp.Models.Entities
{
    public partial class ThanhVien
    {
        public ThanhVien()
        {
            KhachHang = new HashSet<KhachHang>();
        }

        public int Id { get; set; }
        public string TaiKhoan { get; set; }
        public string MatKhau { get; set; }
        public string Ten { get; set; }
        public string DiaChi { get; set; }
        public string Email { get; set; }
        public string SoDienThoai { get; set; }

        public ICollection<KhachHang> KhachHang { get; set; }
    }
}
