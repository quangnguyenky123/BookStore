using System.Collections.Generic;
using System.Linq;
using TLCNWebApp.Models.DTO;
using TLCNWebApp.Models.Entities;

namespace TLCNWebApp.BL
{
    public class DanhMucBL
    {
        BookStoreContext db = new BookStoreContext();
        public IEnumerable<DanhMucDTO> GetAllCategory(string searchString, int page, int pageSize)
        {
            IEnumerable<DanhMucDTO> listDanhMuc = new List<DanhMucDTO>();
            if (!string.IsNullOrEmpty(searchString))
            {
                listDanhMuc = db.DanhMuc.Where(d => d.TenDanhMuc.Contains(searchString)).Skip((page - 1) * pageSize).Take(pageSize).Select(d => new DanhMucDTO
                {
                    Id = d.Id,
                    TenDanhMuc = d.TenDanhMuc,
                    MoTa = d.MoTa,
                    TenTrangThai = d.TrangThaiNavigation.TenTrangThai
                });
            }
            else
            {
                listDanhMuc = db.DanhMuc.Skip((page - 1) * pageSize).Take(pageSize).Select(d => new DanhMucDTO
                {
                    Id = d.Id,
                    TenDanhMuc = d.TenDanhMuc,
                    MoTa = d.MoTa,
                    TenTrangThai = d.TrangThaiNavigation.TenTrangThai
                });
            }
            return listDanhMuc;
        }
        public int GetTotalRow(string searchString)
        {
            if (!string.IsNullOrEmpty(searchString))
            {
                return db.DanhMuc.Where(d => d.TenDanhMuc.Contains(searchString)).ToList().Count;
            }
            else
            {
                return db.DanhMuc.ToList().Count;
            }
        }
        public int Delete(int id)
        {
            int book = db.Sach.Where(s => s.IdDanhMuc == id).ToList().Count;
            var category = db.DanhMuc.Find(id);
            if (book == 0)
            {
                db.DanhMuc.Remove(category);
                db.SaveChanges();
                return 1;
            }
            return 0;
        }
        public IQueryable LoadDetail(int id)
        {
            var category = db.DanhMuc.Where(c => c.Id == id).Select(d => new DanhMucDTO
            {
                Id = d.Id,
                TenDanhMuc = d.TenDanhMuc,
                MoTa = d.MoTa,
                TenTrangThai = d.TrangThaiNavigation.TenTrangThai,
                TrangThai = d.TrangThai
            });
            return category;
        }
        public List<TrangThaiSuDung> GetAllStatus()
        {
            List<TrangThaiSuDung> listTrangThai = db.TrangThaiSuDung.ToList();
            return listTrangThai;
        }
        public int Update(int id, string tenDanhMuc, string moTa, int trangThai)
        {
            var category = db.DanhMuc.Find(id);
            if (category.TenDanhMuc.Trim().ToUpper() == tenDanhMuc.Trim().ToUpper())
            {
                category.MoTa = moTa;
                category.TrangThai = trangThai;
                db.SaveChanges();
                return 1;
            }
            else
            {
                DanhMuc cate = db.DanhMuc.Where(c => c.TenDanhMuc.Trim().ToUpper() == tenDanhMuc.Trim().ToUpper() && c.Id != id).FirstOrDefault();
                if (cate != null)
                {
                    return 0;
                }
                else
                {
                    category.TenDanhMuc = tenDanhMuc;
                    category.MoTa = moTa;
                    category.TrangThai = trangThai;
                    db.SaveChanges();
                    return 1;
                }
            }
        }
        public int Create(string tenDanhMuc, string moTa, int trangThai)
        {

            DanhMuc cate = db.DanhMuc.Where(c => c.TenDanhMuc.Trim().ToUpper() == tenDanhMuc.Trim().ToUpper()).FirstOrDefault();
            if (cate != null)
            {
                return 0;
            }
            else
            {
                DanhMuc category = new DanhMuc();
                category.MoTa = moTa;
                category.TenDanhMuc = tenDanhMuc;
                category.TrangThai = trangThai;
                db.DanhMuc.Add(category);
                db.SaveChanges();
                return 1;
            }
        }
        public List<DanhMuc> GetAllCategory()
        {
            return db.DanhMuc.ToList();
        }
        public List<DanhMuc> GetCategoryDisplay()
        {
            return db.DanhMuc.Take(10).ToList();
        }
    }
}
