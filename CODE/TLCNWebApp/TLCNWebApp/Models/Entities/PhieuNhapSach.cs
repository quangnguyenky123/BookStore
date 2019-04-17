using System;
using System.Collections.Generic;

namespace TLCNWebApp.Models.Entities
{
    public partial class PhieuNhapSach
    {
        public PhieuNhapSach()
        {
            ChiTietPhieuNhapSach = new HashSet<ChiTietPhieuNhapSach>();
        }

        public string Id { get; set; }
        public int? IdNxb { get; set; }
        public DateTime? NgayNhap { get; set; }

        public NhaXuatBan IdNxbNavigation { get; set; }
        public ICollection<ChiTietPhieuNhapSach> ChiTietPhieuNhapSach { get; set; }
    }
}
