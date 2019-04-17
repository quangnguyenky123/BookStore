using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TLCNWebApp.Models.DTO
{
    public class DonDatHangDTO
    {
        public string Id { get; set; }
        public string IdKh { get; set; }
        public string TenKh { get; set; }
        public string NgayDat { get; set; }
        public string NgayGiao { get; set; }
        public string TrangThai { get; set; }
        public int IdTrangThai { get; set; }
        public decimal TongTien { get; set; }
        public bool IsConfirm { get; set; }
    }
}
