using System;
using System.Collections.Generic;

namespace TLCNWebApp.Models.Entities
{
    public partial class TrangThaiSach
    {
        public TrangThaiSach()
        {
            Sach = new HashSet<Sach>();
        }

        public int Id { get; set; }
        public string TenTrangThai { get; set; }
        public string MoTa { get; set; }

        public ICollection<Sach> Sach { get; set; }
    }
}
