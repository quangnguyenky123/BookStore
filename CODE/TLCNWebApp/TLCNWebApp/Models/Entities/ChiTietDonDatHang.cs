using System;
using System.Collections.Generic;

namespace TLCNWebApp.Models.Entities
{
    public partial class ChiTietDonDatHang
    {
        public int Id { get; set; }
        public string IdDonDatHang { get; set; }
        public int? IdSach { get; set; }
        public int? SoLuong { get; set; }
        public decimal? DonGia { get; set; }

        public DonDatHang IdDonDatHangNavigation { get; set; }
        public Sach IdSachNavigation { get; set; }
    }
}
