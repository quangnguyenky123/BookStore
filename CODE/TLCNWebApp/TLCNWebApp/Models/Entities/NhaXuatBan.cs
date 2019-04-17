using System;
using System.Collections.Generic;

namespace TLCNWebApp.Models.Entities
{
    public partial class NhaXuatBan
    {
        public NhaXuatBan()
        {
            PhieuNhapSach = new HashSet<PhieuNhapSach>();
            Sach = new HashSet<Sach>();
        }

        public int Id { get; set; }
        public string TenNxb { get; set; }
        public string MoTa { get; set; }
        public int? TrangThai { get; set; }

        public TrangThaiSuDung TrangThaiNavigation { get; set; }
        public ICollection<PhieuNhapSach> PhieuNhapSach { get; set; }
        public ICollection<Sach> Sach { get; set; }
    }
}
