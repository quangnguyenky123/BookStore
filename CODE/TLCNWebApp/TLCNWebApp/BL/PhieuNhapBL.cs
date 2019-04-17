using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TLCNWebApp.Models.DTO;
using TLCNWebApp.Models.Entities;

namespace TLCNWebApp.BL
{
    public class PhieuNhapBL
    {
        BookStoreContext db;
        SachBL sachBL;
        ChiTietPhieuNhapBL chiTietPhieuNhapBL;

        public PhieuNhapBL()
        {
            db = new BookStoreContext();
            sachBL = new SachBL();
            chiTietPhieuNhapBL = new ChiTietPhieuNhapBL();
        }

        public void CretaCoupon(NhaXuatBan nxb,List<ChiTietPhieuNhapSach> listChiTiet)
        {
            PhieuNhapSach coupon = new PhieuNhapSach();
            coupon.NgayNhap = DateTime.Now.Date;
            string id= "PNS"+nxb.Id+DateTime.Now.ToBinary().ToString();
            coupon.IdNxb = nxb.Id;
            coupon.Id = id;
            db.PhieuNhapSach.Add(coupon);
            db.SaveChanges();
            foreach(ChiTietPhieuNhapSach item in listChiTiet)
            {
                item.IdPhieuNhap = id;
                Sach book=sachBL.GetBookById((int)item.IdSach);
                book.SoLuong += (int)item.SoLuong;
                db.Sach.Update(book);
                db.ChiTietPhieuNhapSach.Add(item);
            }
            db.SaveChanges();
        }
        public List<PhieuNhapDTO> GetListPhieuNhap(string searchString, int pageIndex, int pageSize)
        {
            if(searchString==null || searchString=="")
            {
                return ConvertListToListDTO(db.PhieuNhapSach
               .OrderByDescending(c => c.NgayNhap)              
               .Skip(pageSize * pageIndex - pageSize)
               .Take(pageSize)
               .ToList());
            }
            else
            {
                return ConvertListToListDTO(db.PhieuNhapSach
                .OrderByDescending(c => c.NgayNhap)
                .Where(c => c.Id.Contains(searchString.Trim()))
                .Skip(pageSize * pageIndex - pageSize)
                .Take(pageSize)
                .ToList());
            }           
        }
        public List<PhieuNhapDTO> ConvertListToListDTO(List<PhieuNhapSach> listPhieuNhap)
        {
            List<PhieuNhapDTO> listDTO = new List<PhieuNhapDTO>();
            foreach(PhieuNhapSach item in listPhieuNhap)
            {
                listDTO.Add(ConvertPhieuNhapToPhieuNhapDTO(item));
            }
            return listDTO;
        }
        public PhieuNhapDTO ConvertPhieuNhapToPhieuNhapDTO(PhieuNhapSach coupon)
        {
            PhieuNhapDTO dto = new PhieuNhapDTO();
            dto.Id = coupon.Id;
            dto.IdNxb = (int)coupon.IdNxb;
            dto.TenNXB = db.NhaXuatBan.Where(n => n.Id == coupon.IdNxb).FirstOrDefault().TenNxb;
            dto.NgayNhap = coupon.NgayNhap.Value.ToShortDateString();
            dto.TongTien = GetPriceForCoupon(coupon.Id);
            return dto;
        }
        public decimal GetPriceForCoupon(string id)
        {
            decimal total = 0;
            List<ChiTietPhieuNhapSach> list = chiTietPhieuNhapBL.GetListChiTietPhieuNhapByPNId(id);
            foreach(var item in list)
            {
                total += (decimal)(item.DonGia * item.SoLuong);
            }
            return total;
        }
        public int GetTotalRow(string searchString)
        {
            if (searchString == null || searchString == "")
            {
                return db.PhieuNhapSach.Count();
            }
            else
            {
                return db.PhieuNhapSach.Where(c => c.Id.Contains(searchString.Trim())).Count();
            }
                
        }
        public PhieuNhapDTO GetPhieuNhapById(string id)
        {
            return ConvertPhieuNhapToPhieuNhapDTO(db.PhieuNhapSach.Where(p => p.Id.Trim() == id.Trim()).SingleOrDefault());
        }
    }
}
