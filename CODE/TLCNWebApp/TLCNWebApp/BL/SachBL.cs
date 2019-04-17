using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TLCNWebApp.Models.DTO;
using TLCNWebApp.Models.Entities;

namespace TLCNWebApp.BL
{
    public class SachBL
    {
        BookStoreContext db = new BookStoreContext();
        public List<TrangThaiSach> GetAllStatus()
        {
            List<TrangThaiSach> listTrangThai = db.TrangThaiSach.ToList();
            return listTrangThai;
        }
        public List<DanhMuc>GetAllCategory()
        {
            List<DanhMuc> listDanhMuc = db.DanhMuc.Where(d => d.TrangThai == 1).ToList();
            return listDanhMuc;
        }
        public List<TacGia> GetAllAuthor()
        {
            List<TacGia> listTacGia = db.TacGia.Where(d => d.TrangThai == 1).ToList();
            return listTacGia;
        }
        public List<NhaXuatBan> GetAllPublisher()
        {
            List<NhaXuatBan> listNXB = db.NhaXuatBan.Where(d => d.TrangThai == 1).ToList();
            return listNXB  ;
        }
        public IEnumerable<SachDTO> GetAllBook(string searchString, int page, int pageSize)
        {

            IEnumerable<SachDTO> listSach = new List<SachDTO>();
            if (!string.IsNullOrEmpty(searchString))
            {
                listSach = db.Sach.Where(d => d.TenSach.Contains(searchString)).Skip((page - 1) * pageSize).Take(pageSize).Select(d => new SachDTO
                {
                    Id = d.Id,
                    TenSach = d.TenSach,
                    SoLuong = d.SoLuong,
                    Gia = d.Gia,
                    TenTrangThai=d.TrangThaiNavigation.TenTrangThai,
                    HinhAnh=d.HinhAnh
                });
            }
            else
            {
                listSach = db.Sach.Skip((page - 1) * pageSize).Take(pageSize).Select(d => new SachDTO
                {
                    Id = d.Id,
                    TenSach = d.TenSach,
                    SoLuong = d.SoLuong,
                    Gia = d.Gia,
                    TenTrangThai = d.TrangThaiNavigation.TenTrangThai,
                    HinhAnh = d.HinhAnh
                });
            }
            return listSach;
        }
        public int GetTotalRow(string searchString)
        {
            if (!string.IsNullOrEmpty(searchString))
            {
                return db.Sach.Where(d => d.TenSach.Contains(searchString)).ToList().Count;
            }
            else
            {
                return db.Sach.ToList().Count;
            }
        }
        public int Delete(int id)
        {
            int phieuNhap = db.ChiTietPhieuNhapSach.Where(s => s.IdSach == id).ToList().Count;
            int donDatHang = db.ChiTietDonDatHang.Where(s => s.IdSach == id).ToList().Count;
            var book = db.Sach.Find(id);
            if (phieuNhap == 0&& donDatHang==0)
            {
                db.Sach.Remove(book);
                db.SaveChanges();
                return 1;
            }
            return 0;
        }
        public bool CheckTitle(string title, int? part)
        {
            Sach book = db.Sach.Where(b => b.TenSach.ToUpper().Trim() == title.ToUpper().Trim() && b.Tap==part).FirstOrDefault();
            if(book==null)
            {
                return true;
            }
            return false;
        }
        public bool CheckCategory(string categoryName)
        {
            DanhMuc cate = db.DanhMuc.Where(b => b.TenDanhMuc.ToUpper().Trim() == categoryName.ToUpper().Trim()).FirstOrDefault();
            if (cate != null)
            {
                return true;
            }
            return false;
        }
        public bool CheckAuthor(string authorName)
        {
            TacGia author = db.TacGia.Where(b => b.TenTacGia.ToUpper().Trim() == authorName.ToUpper().Trim()).FirstOrDefault();
            if (author != null)
            {
                return true;
            }
            return false;
        }
        public bool CheckPublisher(string publisherName)
        {
            NhaXuatBan publ = db.NhaXuatBan.Where(b => b.TenNxb.ToUpper().Trim() == publisherName.ToUpper().Trim()).FirstOrDefault();
            if (publ != null)
            {
                return true;
            }
            return false;
        }
        public DanhMuc SelectCategoryByName(string categoryName)
        {
            return  db.DanhMuc.Where(b => b.TenDanhMuc.ToUpper().Trim() == categoryName.ToUpper().Trim()).FirstOrDefault();           
        }
        public TacGia SelectAuthorByName(string authorName)
        {
            return  db.TacGia.Where(b => b.TenTacGia.ToUpper().Trim() == authorName.ToUpper().Trim()).FirstOrDefault();        
        }
        public NhaXuatBan SelectPublisherByName(string publisherName)
        {
            return db.NhaXuatBan.Where(b => b.TenNxb.ToUpper().Trim() == publisherName.ToUpper().Trim()).FirstOrDefault();
        }
        
        public void Create(Sach newBook)
        {
            db.Sach.Add(newBook);
            db.SaveChanges();
         
        }
        public SachDTO GetBookDTOById(int id)
        {                
            return ConvertToDTO(db.Sach.Where(s=>s.Id==id).FirstOrDefault());
        }
        public List<Sach>GetBookByPublisher(string tenNXB)
        {
            return db.Sach.Where(b => b.IdNxbNavigation.TenNxb.ToUpper().Trim() == tenNXB.ToUpper().Trim()).ToList();
        }
        public Sach GetBookById(int id)
        {
            return db.Sach.Where(s => s.Id == id).SingleOrDefault();
        }
        public List<Sach>GetListNewBook()
        {
            return db.Sach
                .Where(s => s.TrangThai == 1 &&s.IdDanhMucNavigation.TrangThai==1 &&s.IdNxbNavigation.TrangThai==1&&s.IdTacGiaNavigation.TrangThai==1)
                .OrderByDescending(s => s.Id)
                .Take(12)
                .ToList();
        }
        public List<Sach> Search(string searchString)
        {
            return db.Sach
                .Where(s => s.TrangThai == 1 && s.IdDanhMucNavigation.TrangThai == 1 && s.IdNxbNavigation.TrangThai == 1 && s.IdTacGiaNavigation.TrangThai == 1 && s.TenSach.Contains(searchString.Trim()))
                .OrderByDescending(s => s.Id)
                .ToList();
        }
        public List<Sach> GetListHotBook()
        {
            return db.Sach
                .Where(s => s.TrangThai == 1 && s.IdDanhMucNavigation.TrangThai == 1 && s.IdNxbNavigation.TrangThai == 1 && s.IdTacGiaNavigation.TrangThai == 1)
                .OrderByDescending(s => s.SoLuotMua)
                .Take(12)
                .ToList();
        }
        public List<Sach> GetAllSellingBook()
        {
            return db.Sach
                .Where(s => s.TrangThai == 1 && s.IdDanhMucNavigation.TrangThai == 1 && s.IdNxbNavigation.TrangThai == 1 && s.IdTacGiaNavigation.TrangThai == 1)
                .OrderByDescending(s => s.Id)
                .ToList();
        }
        public List<Sach> GetListSellingSoonBook()
        {
            return db.Sach
                .Where(s => s.TrangThai == 3 && s.IdDanhMucNavigation.TrangThai == 1 && s.IdNxbNavigation.TrangThai == 1 && s.IdTacGiaNavigation.TrangThai == 1)
                .OrderByDescending(s => s.Id)
                .ToList();
        }
        public List<Sach> GetListBookByCategory(int cateId)
        {
            return db.Sach
                .Where(s => s.IdDanhMuc == cateId && s.IdDanhMucNavigation.TrangThai == 1 && s.IdNxbNavigation.TrangThai == 1 && s.IdTacGiaNavigation.TrangThai == 1)
                .OrderByDescending(s => s.Id)
                .ToList();
        }
        public int GetTotalRowSearch(string searchString)
        {
            return Search(searchString).Count();
        }
        public int GetTotalRowNewBook()
        {
            return GetListNewBook().Count();
        }
        public int GetTotalRowAllSellingBook()
        {
            return GetAllSellingBook().Count();
        }
        public int GetTotalRowBookByCategory(int cateId)
        {
            return GetListBookByCategory(cateId).Count();
        }
        public int GetTotalRowSellingSoonBook()
        {
            return GetListSellingSoonBook().Count();
        }
        public int GetTotalRowHotBook()
        {
            return GetListHotBook().Count();
        }
        public List<SachDTO>GetListNewBookToDisplay(int pageIndex, int pageSize)
        {
            List<Sach> listSach = GetListNewBook();
            return ConvertListToListDTO(listSach.Skip(pageIndex * pageSize - pageSize).Take(pageSize).ToList());
        }
        public List<SachDTO> SearchToDisplay(int pageIndex, int pageSize,string searchString)
        {
            List<Sach> listSach = Search(searchString);
            return ConvertListToListDTO(listSach.Skip(pageIndex * pageSize - pageSize).Take(pageSize).ToList());
        }
        public List<SachDTO> GetAllSellingBookToDisplay(int pageIndex, int pageSize)
        {
            List<Sach> listSach = GetAllSellingBook();
            return ConvertListToListDTO(listSach.Skip(pageIndex * pageSize - pageSize).Take(pageSize).ToList());
        }
        public List<SachDTO> GetBookByCategoryToDisplay(int pageIndex, int pageSize,int cateId)
        {
            List<Sach> listSach = GetListBookByCategory(cateId);
            return ConvertListToListDTO(listSach.Skip(pageIndex * pageSize - pageSize).Take(pageSize).ToList());
        }
        public List<SachDTO> GetListSellingSoonBookToDisplay(int pageIndex, int pageSize)
        {
            List<Sach> listSach = GetListSellingSoonBook();
            return ConvertListToListDTO(listSach.Skip(pageIndex * pageSize - pageSize).Take(pageSize).ToList());
        }
        public List<SachDTO> GetListHotBookToDisplay(int pageIndex, int pageSize)
        {
            List<Sach> listSach = GetListHotBook();
            return ConvertListToListDTO(listSach.Skip(pageIndex * pageSize - pageSize).Take(pageSize).ToList());
        }
        public List<SachDTO> ConvertListToListDTO(List<Sach> listSach)
        {
            List<SachDTO> listDTO = new List<SachDTO>();
            foreach(Sach item in listSach)
            {
                listDTO.Add(ConvertToDTO(item));
            }
            return listDTO;
        }
        public SachDTO ConvertToDTO(Sach book)
        {
            SachDTO dto = new SachDTO();
            dto.Id = book.Id;
            dto.TenSach = book.TenSach;
            dto.Gia = book.Gia;
            dto.HinhAnh = book.HinhAnh;
            dto.TenDanhMuc = db.DanhMuc.Where(d => d.Id == book.IdDanhMuc).FirstOrDefault().TenDanhMuc;
            dto.SoLuotMua = (int)book.SoLuotMua;
            dto.SoLuong = (int)book.SoLuong;
            dto.TenTrangThai = db.TrangThaiSach.Where(t => t.Id == book.TrangThai).FirstOrDefault().TenTrangThai;
            dto.TenNhaXuatBan = db.NhaXuatBan.Where(n => n.Id == book.IdNxb).FirstOrDefault().TenNxb;
            if(book.Tap==null)
            {
                dto.strTap = "";
            }
            else
            {
                dto.strTap = book.Tap.ToString();
            }
            dto.TenTacGia = db.TacGia.Where(a=>a.Id==book.IdTacGia).SingleOrDefault().TenTacGia;
            dto.TomTat = book.TomTat;
            return dto;
           

        }
        public void UpdateBookWhenCreateOrder(int id,int quantity)
        {
            Sach book = db.Sach.Find(id);
            book.SoLuong -= quantity;
            book.SoLuotMua += quantity;
            db.Sach.Update(book);
            db.SaveChanges();
        }
    }
}
