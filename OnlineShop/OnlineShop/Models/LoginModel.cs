using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace OnlineShop.Models
{
    public class LoginModel
    {
        [Key]
        [Display(Name ="Tên đăng nhập")]
        [Required(ErrorMessage ="Tài khoản không được để trống")]
        public string UserName { get; set; }

        [Display(Name="Mật khẩu")]
        [Required(ErrorMessage ="Mật khẩu không được để trống")]
        public string Password { get; set; }
    }
}