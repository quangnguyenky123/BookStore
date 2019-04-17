using System;
using System.Collections.Generic;

namespace TLCNWebApp.Models.Entities
{
    public partial class ChiTietPhieuNhapSach
    {
        public int Id { get; set; }
        public string IdPhieuNhap { get; set; }
        public int? IdSach { get; set; }
        public int? SoLuong { get; set; }
        public decimal? DonGia { get; set; }

        public PhieuNhapSach IdPhieuNhapNavigation { get; set; }
        public Sach IdSachNavigation { get; set; }
    }
}
