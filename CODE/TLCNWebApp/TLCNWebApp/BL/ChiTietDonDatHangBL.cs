using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TLCNWebApp.Models.DTO;
using TLCNWebApp.Models.Entities;

namespace TLCNWebApp.BL
{
    public class ChiTietDonDatHangBL
    {
        BookStoreContext db = new BookStoreContext();
        public List<ChiTietDonDatHang> GetList(string id)
        {
            return db.ChiTietDonDatHang.Where(c => c.IdDonDatHang == id).ToList();
        }
        public List<OrderDTO> GetListOrderDetailByOrderId(string id)
        {
            return ConvertListToListDTO(GetList(id));
        }
        public List<OrderDTO> ConvertListToListDTO(List<ChiTietDonDatHang>list)
        {
            List<OrderDTO> listDTO = new List<OrderDTO>();
            foreach(ChiTietDonDatHang item in list)
            {
                listDTO.Add(ConvertToDTO(item));
            }
            return listDTO;
        }
        public OrderDTO ConvertToDTO(ChiTietDonDatHang item)
        {
            OrderDTO dto = new OrderDTO();
            dto.id = item.Id;
            dto.quantity = (int)item.SoLuong;
            dto.price = (decimal)item.DonGia;
            Sach book = db.Sach.Where(s => s.Id == item.IdSach).FirstOrDefault();           
            if (book.Tap == null)
            {
                dto.strTap = "";
            }
            else
            {
                dto.strTap = book.Tap.ToString();
            }
            dto.title = book.TenSach;
            return dto;
        }
    }
}
