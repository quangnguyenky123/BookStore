using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TLCNWebApp.Models.DTO
{
    public class TaiKhoanDTO
    {
        public int Id { get; set; }
        public string TaiKhoan { get; set; }
        public string MatKhau { get; set; }
        public string Ten { get; set; }
        public string DiaChi { get; set; }
        public string Email { get; set; }
        public string SoDienThoai { get; set; }
        public int IdQuyen { get; set; }
        public string TenQuyen { get; set; }
        public int TrangThai { get; set; }
    }
}
