using System;
using System.Collections.Generic;

namespace TLCNWebApp.Models.Entities
{
    public partial class DanhMuc
    {
        public DanhMuc()
        {
            Sach = new HashSet<Sach>();
        }

        public int Id { get; set; }
        public string TenDanhMuc { get; set; }
        public string MoTa { get; set; }
        public int? TrangThai { get; set; }

        public TrangThaiSuDung TrangThaiNavigation { get; set; }
        public ICollection<Sach> Sach { get; set; }
    }
}
