using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace TLCNWebApp.Models.Entities
{
    public partial class BookStoreContext : DbContext
    {
        public BookStoreContext()
        {
        }

        public BookStoreContext(DbContextOptions<BookStoreContext> options)
            : base(options)
        {
        }

        public virtual DbSet<ChiTietDonDatHang> ChiTietDonDatHang { get; set; }
        public virtual DbSet<ChiTietPhieuNhapSach> ChiTietPhieuNhapSach { get; set; }
        public virtual DbSet<DanhMuc> DanhMuc { get; set; }
        public virtual DbSet<DonDatHang> DonDatHang { get; set; }
        public virtual DbSet<KhachHang> KhachHang { get; set; }
        public virtual DbSet<NhaXuatBan> NhaXuatBan { get; set; }
        public virtual DbSet<PhieuNhapSach> PhieuNhapSach { get; set; }
        public virtual DbSet<QuanTriVien> QuanTriVien { get; set; }
        public virtual DbSet<Quyen> Quyen { get; set; }
        public virtual DbSet<Sach> Sach { get; set; }
        public virtual DbSet<TacGia> TacGia { get; set; }
        public virtual DbSet<ThanhVien> ThanhVien { get; set; }
        public virtual DbSet<TrangThaiGiaoHang> TrangThaiGiaoHang { get; set; }
        public virtual DbSet<TrangThaiSach> TrangThaiSach { get; set; }
        public virtual DbSet<TrangThaiSuDung> TrangThaiSuDung { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer("Server=(local);Database=BookStore;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<ChiTietDonDatHang>(entity =>
            {
                entity.HasOne(d => d.IdDonDatHangNavigation)
                    .WithMany(p => p.ChiTietDonDatHang)
                    .HasForeignKey(d => d.IdDonDatHang)
                    .HasConstraintName("FK_ChiTietDonDatHang_DonDatHang");

                entity.HasOne(d => d.IdSachNavigation)
                    .WithMany(p => p.ChiTietDonDatHang)
                    .HasForeignKey(d => d.IdSach)
                    .HasConstraintName("FK_ChiTietDonDatHang_Sach");
            });

            modelBuilder.Entity<ChiTietPhieuNhapSach>(entity =>
            {
                entity.Property(e => e.DonGia).HasColumnType("decimal(18, 0)");

                entity.HasOne(d => d.IdPhieuNhapNavigation)
                    .WithMany(p => p.ChiTietPhieuNhapSach)
                    .HasForeignKey(d => d.IdPhieuNhap)
                    .HasConstraintName("FK_ChiTietPhieuNhapSach_PhieuNhapSach");

                entity.HasOne(d => d.IdSachNavigation)
                    .WithMany(p => p.ChiTietPhieuNhapSach)
                    .HasForeignKey(d => d.IdSach)
                    .HasConstraintName("FK_ChiTietPhieuNhapSach_Sach");
            });

            modelBuilder.Entity<DanhMuc>(entity =>
            {
                entity.Property(e => e.TenDanhMuc)
                    .IsRequired()
                    .HasMaxLength(100);

                entity.HasOne(d => d.TrangThaiNavigation)
                    .WithMany(p => p.DanhMuc)
                    .HasForeignKey(d => d.TrangThai)
                    .HasConstraintName("FK_DanhMuc_TrangThaiSuDung");
            });

            modelBuilder.Entity<DonDatHang>(entity =>
            {
                entity.Property(e => e.IdKh).HasColumnName("IdKH");

                entity.Property(e => e.NgayDat).HasColumnType("date");

                entity.Property(e => e.NgayGiao).HasColumnType("date");

                entity.HasOne(d => d.IdKhNavigation)
                    .WithMany(p => p.DonDatHang)
                    .HasForeignKey(d => d.IdKh)
                    .HasConstraintName("FK_DonDatHang_KhachHang");

                entity.HasOne(d => d.TrangThaiNavigation)
                    .WithMany(p => p.DonDatHang)
                    .HasForeignKey(d => d.TrangThai)
                    .HasConstraintName("FK_DonDatHang_TrangThaiGiaoHang");
            });

            modelBuilder.Entity<KhachHang>(entity =>
            {
                entity.Property(e => e.DiaChi).HasMaxLength(200);

                entity.Property(e => e.Email)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.SoDienThoai)
                    .HasMaxLength(12)
                    .IsUnicode(false);

                entity.Property(e => e.TenKh)
                    .HasColumnName("TenKH")
                    .HasMaxLength(50);

                entity.HasOne(d => d.IdThanhVienNavigation)
                    .WithMany(p => p.KhachHang)
                    .HasForeignKey(d => d.IdThanhVien)
                    .HasConstraintName("FK_KhachHang_ThanhVien");
            });

            modelBuilder.Entity<NhaXuatBan>(entity =>
            {
                entity.Property(e => e.TenNxb)
                    .IsRequired()
                    .HasColumnName("TenNXB")
                    .HasMaxLength(100);

                entity.HasOne(d => d.TrangThaiNavigation)
                    .WithMany(p => p.NhaXuatBan)
                    .HasForeignKey(d => d.TrangThai)
                    .HasConstraintName("FK_NhaXuatBan_TrangThaiSuDung");
            });

            modelBuilder.Entity<PhieuNhapSach>(entity =>
            {
                entity.Property(e => e.IdNxb).HasColumnName("IdNXB");

                entity.Property(e => e.NgayNhap).HasColumnType("datetime");

                entity.HasOne(d => d.IdNxbNavigation)
                    .WithMany(p => p.PhieuNhapSach)
                    .HasForeignKey(d => d.IdNxb)
                    .HasConstraintName("FK_PhieuNhapSach_NhaXuatBan");
            });

            modelBuilder.Entity<QuanTriVien>(entity =>
            {
                entity.Property(e => e.DiaChi).HasMaxLength(200);

                entity.Property(e => e.Email)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.MatKhau)
                    .HasMaxLength(16)
                    .IsUnicode(false);

                entity.Property(e => e.SoDienThoai)
                    .HasMaxLength(12)
                    .IsUnicode(false);

                entity.Property(e => e.TaiKhoan)
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.Property(e => e.Ten).HasMaxLength(50);

                entity.HasOne(d => d.IdQuyenNavigation)
                    .WithMany(p => p.QuanTriVien)
                    .HasForeignKey(d => d.IdQuyen)
                    .HasConstraintName("FK_QuanTriVien_Quyen");
            });

            modelBuilder.Entity<Quyen>(entity =>
            {
                entity.Property(e => e.TenQuyen).HasMaxLength(50);
            });

            modelBuilder.Entity<Sach>(entity =>
            {
                entity.Property(e => e.HinhAnh)
                    .IsRequired()
                    .IsUnicode(false);

                entity.Property(e => e.IdNxb).HasColumnName("IdNXB");

                entity.Property(e => e.NgayThem).HasColumnType("date");

                entity.Property(e => e.TenSach)
                    .IsRequired()
                    .HasMaxLength(100);

                entity.HasOne(d => d.IdDanhMucNavigation)
                    .WithMany(p => p.Sach)
                    .HasForeignKey(d => d.IdDanhMuc)
                    .HasConstraintName("FK_Sach_DanhMuc");

                entity.HasOne(d => d.IdNxbNavigation)
                    .WithMany(p => p.Sach)
                    .HasForeignKey(d => d.IdNxb)
                    .HasConstraintName("FK_Sach_NhaXuatBan");

                entity.HasOne(d => d.IdTacGiaNavigation)
                    .WithMany(p => p.Sach)
                    .HasForeignKey(d => d.IdTacGia)
                    .HasConstraintName("FK_Sach_TacGia");

                entity.HasOne(d => d.TrangThaiNavigation)
                    .WithMany(p => p.Sach)
                    .HasForeignKey(d => d.TrangThai)
                    .HasConstraintName("FK_Sach_TrangThaiSach");
            });

            modelBuilder.Entity<TacGia>(entity =>
            {
                entity.Property(e => e.TenTacGia)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.HasOne(d => d.TrangThaiNavigation)
                    .WithMany(p => p.TacGia)
                    .HasForeignKey(d => d.TrangThai)
                    .HasConstraintName("FK_TacGia_TrangThaiSuDung");
            });

            modelBuilder.Entity<ThanhVien>(entity =>
            {
                entity.Property(e => e.DiaChi).HasMaxLength(200);

                entity.Property(e => e.Email)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.MatKhau)
                    .HasMaxLength(16)
                    .IsUnicode(false);

                entity.Property(e => e.SoDienThoai)
                    .HasMaxLength(12)
                    .IsUnicode(false);

                entity.Property(e => e.TaiKhoan)
                    .HasMaxLength(20)
                    .IsUnicode(false);

                entity.Property(e => e.Ten).HasMaxLength(50);
            });

            modelBuilder.Entity<TrangThaiGiaoHang>(entity =>
            {
                entity.Property(e => e.TenTrangThai)
                    .IsRequired()
                    .HasMaxLength(100);
            });

            modelBuilder.Entity<TrangThaiSach>(entity =>
            {
                entity.Property(e => e.TenTrangThai)
                    .IsRequired()
                    .HasMaxLength(100);
            });

            modelBuilder.Entity<TrangThaiSuDung>(entity =>
            {
                entity.Property(e => e.TenTrangThai)
                    .IsRequired()
                    .HasMaxLength(100);
            });
        }
    }
}
