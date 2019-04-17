using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TLCNWebApp.Models.DTO;
using TLCNWebApp.Models.Entities;

namespace TLCNWebApp.BL
{
    public class DonDatHangBL
    {
        BookStoreContext db = new BookStoreContext();
        SachBL sachBL = new SachBL();
        KhachHangBL khachHangBL = new KhachHangBL();
        Email mail = new Email();

        public void CreateOrder(KhachHang customer, List<OrderDTO> listOrderDetaiDTO)
        {
            List<ChiTietDonDatHang> listOrderDetail = ConvertListOrderDTOtoListOrder(listOrderDetaiDTO);
            string id = CreateId(customer);
            customer.Id = "KH" + id;
            db.KhachHang.Add(customer);
            DonDatHang order = new DonDatHang();
            order.Id = "DDH" + id;
            order.IdKh = customer.Id;
            order.NgayDat = DateTime.Now.Date;
            order.TrangThai = 1;
            order.DaHuy = false;
            order.IsConfirm = false;
            db.DonDatHang.Add(order);
            foreach (ChiTietDonDatHang item in listOrderDetail)
            {
                item.IdDonDatHang = order.Id;
                db.ChiTietDonDatHang.Add(item);
                sachBL.UpdateBookWhenCreateOrder((int)item.IdSach, (int)item.SoLuong);
            }
            db.SaveChanges();
            mail.SendCreateOrderEmail(order.Id, customer.Email, customer.TenKh);
        }
        public string CreateId(KhachHang customer)
        {
            string id = "";
            char[] phone = customer.SoDienThoai.ToCharArray();
            Array.Reverse(phone);
            string phoneRevert = new string(phone);
            string idPhone = phoneRevert.Substring(0, 4);
            id = idPhone + DateTime.Now.ToBinary().ToString();
            return id;
        }
        public List<ChiTietDonDatHang> ConvertListOrderDTOtoListOrder(List<OrderDTO> listOrderDetaiDTO)
        {
            List<ChiTietDonDatHang> listOrderDetail = new List<ChiTietDonDatHang>();
            foreach (OrderDTO item in listOrderDetaiDTO)
            {
                listOrderDetail.Add(ConvertOrderDTOtoOrder(item));

            }
            return listOrderDetail;
        }
        public ChiTietDonDatHang ConvertOrderDTOtoOrder(OrderDTO item)
        {
            ChiTietDonDatHang order = new ChiTietDonDatHang();
            order.SoLuong = item.quantity;
            order.IdSach = item.id;
            order.DonGia = item.price;
            return order;
        }


        public List<DonDatHangDTO> GetListDonDatHang(string searchString, int pageIndex, int pageSize)
        {
            if (searchString == null || searchString == "")
            {
                return ConvertListToListDTO(db.DonDatHang
               .OrderByDescending(c => c.NgayDat)
               .Skip(pageSize * pageIndex - pageSize)
               .Take(pageSize)
               .ToList());
            }
            else
            {
                return ConvertListToListDTO(db.DonDatHang
                .OrderByDescending(c => c.NgayDat)
                .Where(c => c.Id.Contains(searchString.Trim()))
                .Skip(pageSize * pageIndex - pageSize)
                .Take(pageSize)
                .ToList());
            }
        }
        public List<DonDatHangDTO> ConvertListToListDTO(List<DonDatHang> listDonDatHang)
        {
            List<DonDatHangDTO> listDTO = new List<DonDatHangDTO>();
            foreach (DonDatHang item in listDonDatHang)
            {
                listDTO.Add(ConvertDonDatHangToDonDatHangDTO(item));
            }
            return listDTO;
        }
        public DonDatHangDTO ConvertDonDatHangToDonDatHangDTO(DonDatHang item)
        {
            DonDatHangDTO dto = new DonDatHangDTO();
            dto.Id = item.Id;
            dto.TenKh = khachHangBL.GetCustomerById(item.IdKh).TenKh;
            dto.NgayDat = item.NgayDat.Value.ToShortDateString();
            dto.TrangThai = db.TrangThaiGiaoHang.Where(t => t.Id == item.TrangThai).FirstOrDefault().TenTrangThai;
            dto.TongTien = GetPriceForOrder(item.Id);
            dto.IdTrangThai = (int)item.TrangThai;
            dto.IsConfirm = item.IsConfirm;
            if (item.NgayGiao == null)
            {
                dto.NgayGiao = "";
            }
            else
            {
                dto.NgayGiao = String.Format("{0:yyyy-MM-dd}", item.NgayGiao.Value);
            }

            return dto;
        }
        public decimal GetPriceForOrder(string id)
        {
            decimal total = 0;
            List<ChiTietDonDatHang> list = db.ChiTietDonDatHang.Where(c => c.IdDonDatHang == id).ToList();
            foreach (var item in list)
            {
                total += (decimal)(item.DonGia * item.SoLuong);
            }
            return total;
        }
        public int GetTotalRow(string searchString)
        {
            if (searchString == null || searchString == "")
            {
                return db.DonDatHang.Count();
            }
            else
            {
                return db.DonDatHang.Where(c => c.Id.Contains(searchString.Trim())).Count();
            }

        }
        public DonDatHangDTO GetDonDatHangById(string id)
        {
            return ConvertDonDatHangToDonDatHangDTO(db.DonDatHang.Where(p => p.Id.Trim() == id.Trim()).SingleOrDefault());
        }
        public List<TrangThaiGiaoHang> GetAllStatus()
        {
            return db.TrangThaiGiaoHang.ToList();
        }
        public void Update(string id, DateTime date, int status)
        {
            DonDatHang order = db.DonDatHang.Find(id);
            if (order != null)
            {
                order.TrangThai = status;
                order.NgayGiao = date;
            }
            db.DonDatHang.Update(order);
            db.SaveChanges();
            KhachHang cus = db.KhachHang.Where(s => s.Id == order.IdKh).FirstOrDefault();
            if (order.TrangThai == 2)
            {
                mail.SendProcessOrderEmail(order.Id, cus.Email, cus.TenKh, order.NgayGiao.Value.ToShortDateString());
            }
            else
            {
                if (order.TrangThai == 3)
                {
                    mail.SendDoneOrderEmail(order.Id, cus.Email, cus.TenKh);
                }
            }


        }
        public void UpdateOrderStatus(string id)
        {
            DonDatHang order = db.DonDatHang.Find(id.Trim());
            order.IsConfirm = true;
            db.DonDatHang.Update(order);
            db.SaveChanges();
        }
    }
}
