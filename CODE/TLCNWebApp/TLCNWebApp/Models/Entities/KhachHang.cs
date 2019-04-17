using System;
using System.Collections.Generic;

namespace TLCNWebApp.Models.Entities
{
    public partial class KhachHang
    {
        public KhachHang()
        {
            DonDatHang = new HashSet<DonDatHang>();
        }

        public string Id { get; set; }
        public string TenKh { get; set; }
        public string DiaChi { get; set; }
        public string Email { get; set; }
        public string SoDienThoai { get; set; }
        public int? IdThanhVien { get; set; }

        public ThanhVien IdThanhVienNavigation { get; set; }
        public ICollection<DonDatHang> DonDatHang { get; set; }
    }
}
