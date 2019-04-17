using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Net;
using System.Net.Mail;
using Microsoft.AspNetCore.Identity.UI.Services;

namespace TLCNWebApp.BL
{
    public class Email
    {
        public void SendEmail(string email, string subject, string htmlMessage)
        {
            var client = new SmtpClient("smtp.gmail.com", 587)
            {
                UseDefaultCredentials = false,
                Credentials = new NetworkCredential("bookstore.vnn@gmail.com", "123456789a."),
                EnableSsl = true
                
            };
            var mailMessage = new MailMessage
            {
                From = new MailAddress("bookstore.vnn@gmail.com"),
                IsBodyHtml = true
            };
            mailMessage.To.Add(email);
            mailMessage.Subject = subject;
            mailMessage.Body = htmlMessage;
            client.Send(mailMessage);
        }
        public void SendCreateOrderEmail(string orderId, string cusEmail, string cusName)
        {
            string mess = "Xin chào " + cusName + "<br>";
            mess += "Đơn hàng <a href='https://localhost:5001/ViewOrder/MyOrder?id="+ orderId+"'>" + orderId + "</a> đã được đặt thành công!<br>";
            mess += "Cảm ơn bạn đã mua sách tại BookStore.vn";
            string subject = "[BookStore.vn] Thông báo đặt hàng thành công";
            SendEmail(cusEmail, subject, mess);
        }
        public void SendProcessOrderEmail(string orderId, string cusEmail, string cusName, string date)
        {
            string mess = "Xin chào " + cusName + "<br>";
            mess += "Đơn hàng <a href='https://localhost:5001/ViewOrder/MyOrder?id=" + orderId + "'>" + orderId + "</a> đang được giao đến bạn! Dự kiến giao hàng vào ngày " + date + "<br>";
            mess += "Cảm ơn bạn đã mua sách tại BookStore.vn";
            string subject = "[BookStore.vn] Thông báo giao hàng";
            SendEmail(cusEmail, subject, mess);
        }
        public void SendDoneOrderEmail(string orderId, string cusEmail, string cusName)
        {
            string mess = "Xin chào " + cusName + "<br>";
            mess += "Đơn hàng <a href='https://localhost:5001/ViewOrder/MyOrder?id=" + orderId + "'>" + orderId + "</a> đã được giao thành công!<br>";
            mess += "Cảm ơn bạn đã mua sách tại BookStore.vn";
            string subject = "[BookStore.vn] Thông báo giao hàng thành công";
            SendEmail(cusEmail, subject, mess);
        }
    }
}
