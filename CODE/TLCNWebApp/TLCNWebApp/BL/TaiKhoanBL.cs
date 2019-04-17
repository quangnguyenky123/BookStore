using System.Collections.Generic;
using System.Linq;
using TLCNWebApp.Models.DTO;
using TLCNWebApp.Models.Entities;

namespace TLCNWebApp.BL
{
    public class TaiKhoanBL
    {
        BookStoreContext db = new BookStoreContext();
        public List<TaiKhoanDTO> GetListAccount(string searchString, int pageIndex, int pageSize)
        {
            if (searchString == null || searchString == "")
            {
                return ConvertListToListDTO(db.QuanTriVien
               .Skip(pageSize * pageIndex - pageSize)
               .Take(pageSize)
               .ToList());
            }
            else
            {
                return ConvertListToListDTO(db.QuanTriVien
                .Where(c => c.TaiKhoan.Contains(searchString.Trim()))
                .Skip(pageSize * pageIndex - pageSize)
                .Take(pageSize)
                .ToList());
            }
        }
        public List<TaiKhoanDTO> ConvertListToListDTO(List<QuanTriVien> listEntities)
        {
            List<TaiKhoanDTO> listDTO = new List<TaiKhoanDTO>();
            foreach (QuanTriVien item in listEntities)
            {
                listDTO.Add(ConvertEntityToDTO(item));
            }
            return listDTO;
        }
        public TaiKhoanDTO ConvertEntityToDTO(QuanTriVien item)
        {
            TaiKhoanDTO dto = new TaiKhoanDTO();
            dto.Id = item.Id;
            dto.Ten = item.Ten;
            if(item.TrangThai)
            {
                dto.TrangThai = 1;
            }
            else
            {
                dto.TrangThai = 0;
            }         
            dto.TaiKhoan = item.TaiKhoan;
            dto.SoDienThoai = item.SoDienThoai;
            dto.DiaChi = item.DiaChi;
            dto.Email = item.Email;
            dto.IdQuyen = (int)item.IdQuyen;
            dto.MatKhau = item.MatKhau;
            dto.TenQuyen = db.Quyen.Where(q => q.Id == item.IdQuyen).FirstOrDefault().TenQuyen;

            return dto;
        }
        public int GetTotalRow(string searchString)
        {
            if (searchString == null || searchString == "")
            {
                return db.QuanTriVien.Count();
            }
            else
            {
                return db.QuanTriVien.Where(c => c.TaiKhoan.Contains(searchString.Trim())).Count();
            }

        }
        public List<TrangThaiTaiKhoan> GetAllAccountStatus()
        {
            TrangThaiTaiKhoan status1 = new TrangThaiTaiKhoan();
            TrangThaiTaiKhoan status2 = new TrangThaiTaiKhoan();
            status1.TrangThai = 1;
            status1.TenTrangThai = "Enable";
            status2.TrangThai = 0;
            status2.TenTrangThai = "Disable";
            List<TrangThaiTaiKhoan> list = new List<TrangThaiTaiKhoan>();
            list.Add(status1);
            list.Add(status2);
            return list;
        }
        public TaiKhoanDTO getAccountById(int id)
        {
            return ConvertEntityToDTO(db.QuanTriVien.Where(q => q.Id == id).FirstOrDefault());
        }
        public List<QuyenDTO> GetAllRoles()
        {
            return db.Quyen.Select(s => new QuyenDTO {
                Id = s.Id,
                TenQuyen = s.TenQuyen
            }).ToList();
        }
        public void Update(TaiKhoanDTO account)
        {
            QuanTriVien qtv = db.QuanTriVien.Find(account.Id);
            if (qtv != null)
            {
                qtv.IdQuyen = account.IdQuyen;
                qtv.DiaChi = account.DiaChi;
                qtv.Email = account.Email;
                qtv.SoDienThoai = account.SoDienThoai;
                qtv.Ten = account.Ten;
                if (account.TrangThai == 1)
                {
                    qtv.TrangThai = true;
                }
                else
                {
                    qtv.TrangThai = false;
                }
                db.QuanTriVien.Update(qtv);
                db.SaveChanges();
            }
            
        }
        public int Create(TaiKhoanDTO account)
        {
            QuanTriVien qtv = db.QuanTriVien.Where(q => q.TaiKhoan.ToUpper().Trim() == account.TaiKhoan.ToUpper().Trim()).FirstOrDefault();
            if (qtv != null)
            {
                return 0;
            }
            else
            {
                qtv = new QuanTriVien();
                qtv.DiaChi = account.DiaChi;
                qtv.Email = account.Email;
                qtv.IdQuyen = account.IdQuyen;
                qtv.MatKhau = account.MatKhau;
                qtv.SoDienThoai = account.SoDienThoai;
                qtv.TaiKhoan = account.TaiKhoan;
                qtv.Ten = account.Ten;
                if (account.TrangThai == 1)
                {
                    qtv.TrangThai = true;
                }
                else
                {
                    qtv.TrangThai =false;
                }
                db.QuanTriVien.Add(qtv);
                db.SaveChanges();
                return 1;

            }
        }
        public bool LoginIsValid(string userName, string password)
        {
            QuanTriVien qtv = db.QuanTriVien.Where(s => s.TaiKhoan.Trim().ToUpper() == userName.Trim().ToUpper()).FirstOrDefault();
            if (qtv != null)
            {
                if (qtv.MatKhau == password)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
        }
        public string GetRoleByUserName(string userName) {
            QuanTriVien qtv = db.QuanTriVien.Where(s => s.TaiKhoan.Trim().ToUpper() == userName.Trim().ToUpper()).FirstOrDefault();
            return db.Quyen.Where(q => q.Id == qtv.IdQuyen).FirstOrDefault().TenQuyen;
        }
    }
}
