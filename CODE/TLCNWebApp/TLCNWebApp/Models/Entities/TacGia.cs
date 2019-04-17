using System;
using System.Collections.Generic;

namespace TLCNWebApp.Models.Entities
{
    public partial class TacGia
    {
        public TacGia()
        {
            Sach = new HashSet<Sach>();
        }

        public int Id { get; set; }
        public string TenTacGia { get; set; }
        public string MoTa { get; set; }
        public int? TrangThai { get; set; }

        public TrangThaiSuDung TrangThaiNavigation { get; set; }
        public ICollection<Sach> Sach { get; set; }
    }
}
