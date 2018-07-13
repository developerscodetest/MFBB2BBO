using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MFBDBO.Data
{
    public class Common
    {
        public int IsActive { get; set; }
        public int Status { get; set; }
        public int CreatedBy { get; set; }
        public string CreatedDate { get; set; }
        public int UpdatedBy { get; set; }
        public string UpdatedDate { get; set; }
        public string Message { get; set; }
        public string ErrorMessage { get; set; }
    }
}