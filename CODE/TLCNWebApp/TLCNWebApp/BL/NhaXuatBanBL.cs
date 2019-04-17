using System.Collections.Generic;
using System.Linq;
using TLCNWebApp.Models.DTO;
using TLCNWebApp.Models.Entities;

namespace TLCNWebApp.BL
{
    public class NhaXuatBanBL
    {
        BookStoreContext db = new BookStoreContext();
        public IEnumerable<NXBDTO> GetAllPublisher(string searchString, int page, int pageSize)
        {
            IEnumerable<NXBDTO> listNXB = new List<NXBDTO>();
            if (!string.IsNullOrEmpty(searchString))
            {
                listNXB = db.NhaXuatBan
                    .Where(d => d.TenNxb.Contains(searchString))
                    .Skip((page - 1) * pageSize)
                    .Take(pageSize)
                    .Select(d => new NXBDTO
                    {
                        Id = d.Id,
                        TenNxb = d.TenNxb,
                        MoTa = d.MoTa,
                        TenTrangThai = d.TrangThaiNavigation.TenTrangThai
                    });
            }
            else
            {
                listNXB = db.NhaXuatBan
                    .Skip((page - 1) * pageSize)
                    .Take(pageSize)
                    .Select(d => new NXBDTO
                    {
                        Id = d.Id,
                        TenNxb = d.TenNxb,
                        MoTa = d.MoTa,
                        TenTrangThai = d.TrangThaiNavigation.TenTrangThai
                    });
            }
            return listNXB;
        }
        public int GetTotalRow(string searchString)
        {
            if (!string.IsNullOrEmpty(searchString))
            {
                return db.NhaXuatBan.Where(d => d.TenNxb.Contains(searchString)).ToList().Count;
            }
            else
            {
                return db.NhaXuatBan.ToList().Count;
            }
        }
        public int Delete(int id)
        {
            int book = db.Sach.Where(s => s.IdTacGia == id).ToList().Count;
            var publisher = db.NhaXuatBan.Find(id);
            if (book == 0)
            {
                db.NhaXuatBan.Remove(publisher);
                db.SaveChanges();
                return 1;
            }
            return 0;
        }
        public IQueryable LoadDetail(int id)
        {
            var publisher = db.NhaXuatBan.Where(c => c.Id == id).Select(d => new NXBDTO
            {
                Id = d.Id,
                TenNxb = d.TenNxb,
                MoTa = d.MoTa,
                TenTrangThai = d.TrangThaiNavigation.TenTrangThai,
                TrangThai = d.TrangThai
            });
            return publisher;
        }
        public List<TrangThaiSuDung> GetAllStatus()
        {
            List<TrangThaiSuDung> listTrangThai = db.TrangThaiSuDung.ToList();
            return listTrangThai;
        }
        public int Update(int id, string TenNXB, string moTa, int trangThai)
        {
            var publisher = db.NhaXuatBan.Find(id);
            if (publisher.TenNxb.Trim().ToUpper() == TenNXB.Trim().ToUpper())
            {
                publisher.MoTa = moTa;
                publisher.TrangThai = trangThai;
                db.SaveChanges();
                return 1;
            }
            else
            {
                NhaXuatBan publ = db.NhaXuatBan.Where(c => c.TenNxb.Trim().ToUpper() == TenNXB.Trim().ToUpper() && c.Id != id).FirstOrDefault();
                if (publ != null)
                {
                    return 0;
                }
                else
                {
                    publisher.TenNxb = TenNXB;
                    publisher.MoTa = moTa;
                    publisher.TrangThai = trangThai;
                    db.SaveChanges();
                    return 1;
                }
            }
        }
        public int Create(string tenNXB, string moTa, int trangThai)
        {

            NhaXuatBan publ = db.NhaXuatBan.Where(c => c.TenNxb.Trim().ToUpper() == tenNXB.Trim().ToUpper()).FirstOrDefault();
            if (publ != null)
            {
                return 0;
            }
            else
            {
                NhaXuatBan publisher = new NhaXuatBan();
                publisher.MoTa = moTa;
                publisher.TenNxb = tenNXB;
                publisher.TrangThai = trangThai;
                db.NhaXuatBan.Add(publisher);
                db.SaveChanges();
                return 1;
            }
        }
        public List<NhaXuatBan> GetPublisherAvailable()
        {
            return db.NhaXuatBan.Where(p => p.TrangThai == 1).ToList();
        }
        public NhaXuatBan GetPublisherByName(string publisherName)
        {
            return db.NhaXuatBan.Where(p => p.TenNxb.ToUpper().Trim() == publisherName.ToUpper().Trim()).SingleOrDefault();
        }
    }
}
