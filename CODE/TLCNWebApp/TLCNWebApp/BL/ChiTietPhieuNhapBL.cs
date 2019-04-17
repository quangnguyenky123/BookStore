using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TLCNWebApp.Models.DTO;
using TLCNWebApp.Models.Entities;

namespace TLCNWebApp.BL
{
    public class ChiTietPhieuNhapBL
    {
        BookStoreContext db = new BookStoreContext();
        SachBL sachBL = new SachBL();
        public List<ChiTietPhieuNhapSach> GetListChiTietPhieuNhapByPNId(string id)
        {
            return db.ChiTietPhieuNhapSach.Where(c => c.IdPhieuNhap.Trim() == id.Trim()).ToList();
        }
        public List<ChiTietPhieuNhapDTO> GetListChiTietPhieuNhapDTOByPNId(string id)
        {
            return ConvertListToListDTO(db.ChiTietPhieuNhapSach.Where(c => c.IdPhieuNhap.Trim() == id.Trim()).ToList()); 
        }
        public List<ChiTietPhieuNhapDTO> ConvertListToListDTO(List<ChiTietPhieuNhapSach> listCTPN)
        {
            List<ChiTietPhieuNhapDTO> listDTO = new List<ChiTietPhieuNhapDTO>();
            foreach(ChiTietPhieuNhapSach item in listCTPN)
            {
                listDTO.Add(ConvertToDTO(item));
            }
            return listDTO;
        }
        public ChiTietPhieuNhapDTO ConvertToDTO(ChiTietPhieuNhapSach item)
        {
            Sach book = sachBL.GetBookById((int)item.IdSach);
            ChiTietPhieuNhapDTO dto = new ChiTietPhieuNhapDTO();
            dto.Id = item.Id;
            dto.TenSach = book.TenSach;
            if(book.Tap==null)
            {
                dto.Tap = "";
            }
            else
            {
                dto.Tap = book.Tap.ToString();
            }
            dto.SoLuong = (int)item.SoLuong;
            dto.DonGia = (decimal)item.DonGia;
            return dto;
        }
    }
}
