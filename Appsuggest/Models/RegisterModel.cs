using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using Appsuggest.ModelBinders;
namespace Appsuggest.Models
{
    public class RegisterModel : IHasDate
    {
        [Required]
        [DisplayName("Kullanıcı Şifresi")]
        [DataType(DataType.Password)]
        [MinLength(6, ErrorMessage = "Şifre Bilgisi Minimum 6 karakter olmalıdır")]
        public string Password { get; set; }
        [DisplayName("Mail Adresi")]
        [EmailAddress()]
        [MaxLength(50, ErrorMessage = "Email Bilgisi En Fazla 50 karakter olmalıdır")]
        public string Email { get; set; }
        [DisplayName("Kullanıcı Şifre Tekrarı")]
        [DataType(DataType.Password)]
        [Required]
        [Compare("Password")]
        public string Password2 { get; set; }
        [DisplayName("Ad")]
        [MaxLength(50, ErrorMessage = "Ad En Fazla 50 karakter olmalıdır")]
        public string FirstName { get;  set; }
        [DisplayName("Soyad")]
        [MaxLength(50, ErrorMessage = "Soyad En Fazla 50 karakter olmalıdır")]
        public string LastName { get;  set; }
        [DisplayName("Telefon Numarası")]
        [Phone()]
        [MaxLength(15, ErrorMessage = "Telefon Numarası En Fazla 15 karakter olmalıdır")]
        public string Phone { get;  set; }
       
        
        public int? CityId { get;  set; }
        public DateTime? Date { get;  set; }//birthDate
    }
}