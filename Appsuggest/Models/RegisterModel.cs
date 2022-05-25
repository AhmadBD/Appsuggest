using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Appsuggest.Models
{
    public class RegisterModel
    {
        [Required]
        [DisplayName("Kullanıcı Şifresi")]
        [DataType(DataType.Password)]
        [MinLength(6, ErrorMessage = "Şifre Bilgisi Minimum 6 karakter olmalıdır")]
        public string Password { get; set; }
        [DisplayName("Mail Adresi")]
        [EmailAddress()]
        [MaxLength(15, ErrorMessage = "Email Bilgisi En Fazla 15 karakter olmalıdır")]
        public string Email { get; set; }
        [DisplayName("Kullanıcı Şifre Tekrarı")]
        [DataType(DataType.Password)]
        [Required]
        [Compare("KullaniciSifre")]
        public string Password2 { get; set; }
    }
}