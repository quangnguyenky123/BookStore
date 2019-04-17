using System;
using System.Collections.Generic;

namespace TLCNWebApp.Models.Entities
{
    public partial class Quyen
    {
        public Quyen()
        {
            QuanTriVien = new HashSet<QuanTriVien>();
        }

        public int Id { get; set; }
        public string TenQuyen { get; set; }
        public string MoTa { get; set; }

        public ICollection<QuanTriVien> QuanTriVien { get; set; }
    }
}
