using System.Collections.Generic;
using System.Linq;
using TLCNWebApp.Models.DTO;
using TLCNWebApp.Models.Entities;

namespace TLCNWebApp.BL
{
    public class TacGiaBL
    {
        BookStoreContext db = new BookStoreContext();
        public IEnumerable<TacGiaDTO> GetAlAuthor(string searchString, int page, int pageSize)
        {
            
            IEnumerable<TacGiaDTO> listTacGia = new List<TacGiaDTO>();
            if (!string.IsNullOrEmpty(searchString))
            {
                listTacGia = db.TacGia.Where(d => d.TenTacGia.Contains(searchString)).Skip((page - 1) * pageSize).Take(pageSize).Select(d => new TacGiaDTO
                {
                    Id = d.Id,
                    TenTacGia = d.TenTacGia,
                    MoTa = d.MoTa,
                    TenTrangThai = d.TrangThaiNavigation.TenTrangThai
                });
            }
            else
            {
                listTacGia = db.TacGia.Skip((page - 1) * pageSize).Take(pageSize).Select(d => new TacGiaDTO
                {
                    Id = d.Id,
                    TenTacGia = d.TenTacGia,
                    MoTa = d.MoTa,
                    TenTrangThai = d.TrangThaiNavigation.TenTrangThai
                });
            }
            return listTacGia;
        }
        public int GetTotalRow(string searchString)
        {
            if (!string.IsNullOrEmpty(searchString))
            {
                return db.TacGia.Where(d => d.TenTacGia.Contains(searchString)).ToList().Count;
            }
            else
            {
                return db.TacGia.ToList().Count;
            }
        }
        public int Delete(int id)
        {
            int book = db.Sach.Where(s => s.IdTacGia == id).ToList().Count;
            var author = db.TacGia.Find(id);
            if (book == 0)
            {
                db.TacGia.Remove(author);
                db.SaveChanges();
                return 1;
            }
            return 0;
        }
        public List<TrangThaiSuDung> GetAllStatus()
        {
            List<TrangThaiSuDung> listTrangThai = db.TrangThaiSuDung.ToList();
            return listTrangThai;
        }
        public IQueryable LoadDetail(int id)
        {
            var author = db.TacGia.Where(c => c.Id == id).Select(d => new TacGiaDTO
            {
                Id = d.Id,
                TenTacGia = d.TenTacGia,
                MoTa = d.MoTa,
                TenTrangThai = d.TrangThaiNavigation.TenTrangThai,
                TrangThai = d.TrangThai
            });
            return author;
        }
        public int Update(int id, string tenTacGia, string moTa, int trangThai)
        {
            var author = db.TacGia.Find(id);
            if (author.TenTacGia.Trim().ToUpper() == tenTacGia.Trim().ToUpper())
            {
                author.MoTa = moTa;
                author.TrangThai = trangThai;
                db.SaveChanges();
                return 1;
            }
            else
            {
                TacGia auth = db.TacGia.Where(c => c.TenTacGia.Trim().ToUpper() == tenTacGia.Trim().ToUpper() && c.Id != id).FirstOrDefault();
                if (auth != null)
                {
                    return 0;
                }
                else
                {
                    author.TenTacGia = tenTacGia;
                    author.MoTa = moTa;
                    author.TrangThai = trangThai;
                    db.SaveChanges();
                    return 1;
                }
            }
        }
        public int Create(string tenTacGia, string moTa, int trangThai)
        {

            TacGia auth = db.TacGia.Where(c => c.TenTacGia.Trim().ToUpper() == tenTacGia.Trim().ToUpper()).FirstOrDefault();
            if (auth != null)
            {
                return 0;
            }
            else
            {
                TacGia author = new TacGia();
                author.MoTa = moTa;
                author.TenTacGia = tenTacGia;
                author.TrangThai = trangThai;
                db.TacGia.Add(author);
                db.SaveChanges();
                return 1;
            }
        }
    }
}
