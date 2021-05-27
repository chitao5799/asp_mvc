using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace OnlineShop.Areas.Admin.Models
{
    public class LoginModel
    {
        [Required(ErrorMessage ="Tên user không được để trông")]
        public string userName { set; get; }

        [Required(ErrorMessage = "Mật khẩu không được để trông")]
        public string password { get; set; }

        public bool RememberMe { get; set; }
    }

}