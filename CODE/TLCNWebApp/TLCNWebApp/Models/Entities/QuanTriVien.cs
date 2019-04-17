using System;
using System.Collections.Generic;

namespace TLCNWebApp.Models.Entities
{
    public partial class QuanTriVien
    {
        public int Id { get; set; }
        public string TaiKhoan { get; set; }
        public string MatKhau { get; set; }
        public string Ten { get; set; }
        public string DiaChi { get; set; }
        public string Email { get; set; }
        public string SoDienThoai { get; set; }
        public int? IdQuyen { get; set; }
        public bool TrangThai { get; set; }
        public Quyen IdQuyenNavigation { get; set; }
    }
}
