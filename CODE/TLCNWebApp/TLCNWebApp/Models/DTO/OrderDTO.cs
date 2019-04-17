using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TLCNWebApp.Models.DTO
{
    public class OrderDTO
    {
        public int id { get; set; }
        public string title { get; set; }
        public int quantity { get; set; }
        public decimal price { get; set; }
        public string strTap { get; set; }
    }
}
