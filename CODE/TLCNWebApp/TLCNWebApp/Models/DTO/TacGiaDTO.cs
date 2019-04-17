using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TLCNWebApp.Models.DTO
{
    public class TacGiaDTO
    {
        public TacGiaDTO()
        {

        }

        public int Id { get; set; }
        public string TenTacGia { get; set; }
        public string MoTa { get; set; }
        public int? TrangThai { get; set; }
        public string TenTrangThai { get; set; }
    }
}
