using System;
using System.Collections.Generic;

namespace TLCNWebApp.Models.Entities
{
    public partial class TrangThaiSuDung
    {
        public TrangThaiSuDung()
        {
            DanhMuc = new HashSet<DanhMuc>();
            NhaXuatBan = new HashSet<NhaXuatBan>();
            TacGia = new HashSet<TacGia>();
        }

        public int Id { get; set; }
        public string TenTrangThai { get; set; }
        public string MoTa { get; set; }

        public ICollection<DanhMuc> DanhMuc { get; set; }
        public ICollection<NhaXuatBan> NhaXuatBan { get; set; }
        public ICollection<TacGia> TacGia { get; set; }
    }
}
