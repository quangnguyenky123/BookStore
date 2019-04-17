using System;
using System.Collections.Generic;

namespace TLCNWebApp.Models.Entities
{
    public partial class DonDatHang
    {
        public DonDatHang()
        {
            ChiTietDonDatHang = new HashSet<ChiTietDonDatHang>();
        }

        public string Id { get; set; }
        public string IdKh { get; set; }
        public DateTime? NgayDat { get; set; }
        public DateTime? NgayGiao { get; set; }
        public bool? DaHuy { get; set; }
        public int? TrangThai { get; set; }

        public KhachHang IdKhNavigation { get; set; }
        public TrangThaiGiaoHang TrangThaiNavigation { get; set; }
        public ICollection<ChiTietDonDatHang> ChiTietDonDatHang { get; set; }
        public bool IsConfirm { get; set; }
    }
}
