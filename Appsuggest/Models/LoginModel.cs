using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Appsuggest.Models
{
    public class LoginModel
    {
        [Required]
        [DisplayName("Kullanıcı Şifresi")]
        [DataType(DataType.Password)]
        public string Password { get; set; }
        [DisplayName("Mail Adresi")]
        [EmailAddress()]
        public string Email { get; set; }

    }
}