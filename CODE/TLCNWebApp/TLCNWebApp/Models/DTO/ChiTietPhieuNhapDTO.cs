using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TLCNWebApp.Models.DTO
{
    public class ChiTietPhieuNhapDTO
    {
        public int Id { get; set; }
        public string IdPhieuNhap { get; set; }
        public string  TenSach { get; set; }
        public string Tap { get; set; }
        public int SoLuong { get; set; }
        public decimal DonGia { get; set; }
    }
}
