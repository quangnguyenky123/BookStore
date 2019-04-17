using System;
using System.Collections.Generic;

namespace TLCNWebApp.Models.Entities
{
    public partial class TrangThaiGiaoHang
    {
        public TrangThaiGiaoHang()
        {
            DonDatHang = new HashSet<DonDatHang>();
        }

        public int Id { get; set; }
        public string TenTrangThai { get; set; }
        public string MoTa { get; set; }

        public ICollection<DonDatHang> DonDatHang { get; set; }
    }
}
