using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TLCNWebApp.Models.DTO
{
    public class NXBDTO
    {
        public NXBDTO()
        {

        }

        public int Id { get; set; }
        public string TenNxb { get; set; }
        public string MoTa { get; set; }
        public int? TrangThai { get; set; }
        public string TenTrangThai { get; set; }
    }
}
