using System;
using System.Collections.Generic;

namespace TLCNWebApp.Models.Entities
{
    public partial class Sach
    {
        public Sach()
        {
            ChiTietDonDatHang = new HashSet<ChiTietDonDatHang>();
            ChiTietPhieuNhapSach = new HashSet<ChiTietPhieuNhapSach>();
        }

        public int Id { get; set; }
        public string TenSach { get; set; }
        public int? IdTacGia { get; set; }
        public int? IdNxb { get; set; }
        public int? IdDanhMuc { get; set; }
        public int? Tap { get; set; }
        public int SoLuong { get; set; }
        public int Gia { get; set; }
        public string TomTat { get; set; }
        public DateTime NgayThem { get; set; }
        public int? TrangThai { get; set; }
        public string HinhAnh { get; set; }
        public int? SoLuotMua { get; set; }

        public DanhMuc IdDanhMucNavigation { get; set; }
        public NhaXuatBan IdNxbNavigation { get; set; }
        public TacGia IdTacGiaNavigation { get; set; }
        public TrangThaiSach TrangThaiNavigation { get; set; }
        public ICollection<ChiTietDonDatHang> ChiTietDonDatHang { get; set; }
        public ICollection<ChiTietPhieuNhapSach> ChiTietPhieuNhapSach { get; set; }
    }
}
