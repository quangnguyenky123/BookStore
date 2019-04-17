using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TLCNWebApp.Models.DTO
{
    public class PhieuNhapDTO
    {
        public PhieuNhapDTO()
        {          
        }

        public string Id { get; set; }
        public int IdNxb { get; set; }
        public string TenNXB { get; set; }
        public decimal TongTien { get; set; }
        public string NgayNhap { get; set; }
    }
}
