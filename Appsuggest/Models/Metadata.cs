using System;
using System.ComponentModel.DataAnnotations;

namespace Appsuggest.Models
{
    public class AppMetadata
    {

        [Key]
        public int Id { get; set; }
        [Required]
        [StringLength(50)]
        [Display(Name = "Uygulama Adı")]
        public string Name { get; set; }
        [Required]
        [Display(Name = "Bağlantı")]
        public string Link { get; set; }
        [Display(Name = "Logo")]
        public string LogoLink { get; set; }
        [Required]
        [Display(Name = "Hakkında")]
        public string Description { get; set; }
    
        [Display(Name = "Etiketleri")]
        public string Tags { get; set; }
        [Required]
        [Display(Name = "Versiyon")]
        public string Version { get; set; }
        [Display(Name = "Ekleme Tarihi")]
        public System.DateTime CreationDateTime { get; set; }
        [Display(Name = "Düzenleme Tarihi")]
        public System.DateTime UpdateDateTime { get; set; }
        [Required]
        [Display(Name = "Uygulama Türü")]
        public int AppTypeId { get; set; }
        [Required]
        [Display(Name = "Uygulama Üretici")]
        public int ProviderId { get; set; }
        [Required]
        [Display(Name = "Uygulama Platformu")]
        public int AppPlatformId { get; set; }

    }

    public class AppTypeMetadata
    {
        [Key]
        public int Id { get; set; }
        [Required]
        [StringLength(50)]
        public string Name { get; set; }
        [Required]
        public string Description { get; set; }
    }
    public class ProviderMetadata
    {
        [Key]
        public int Id { get; set; }
        [Required]
        [StringLength(50)]
        public string Name { get; set; }
        [Url]
        public string HomePageLink { get; set; }
        [Required]
        public string LogoLink { get; set; }
        [Required]
        public string Description { get; set; }
    }
    public class ReviewMetadata
    {
        public int UserId { get; set; }
        public int AppId { get; set; }
        [Required]
        [Range(1,5)]
        public int Rate { get; set; }
        public string ReviewText { get; set; }
        [Required]
        [StringLength(20)]
        public string AppVersion { get; set; }
        public System.DateTime CreationDateTime { get; set; }
        public System.DateTime UpdateDateTime { get; set; }
    }
    public class AppPlatformMetadata
    {
        [Key]
        public int Id { get; set; }
        [Required]
        [StringLength(50)]
        public string Name { get; set; }
    }
    public class ImageMetadata
    {
        [Key]
        public int Id { get; set; }
        [Required]
        public string Link { get; set; } 
        [Required]
        public string Appid { get; set; }
    }
    public class UserMetadata
    {
        [Key]
        public int Id { get; set; }
        [Required]
        [StringLength(50)]
        public string Email { get; set; }
        [Required]  
        [DataType(DataType.Password)]
        public string Password { get; set; }
        [StringLength(50)]
        public string FirstName { get; set; }
        [StringLength(50)]
        public string LastName { get; set; }
        [StringLength(15)]
        public string Phone { get; set; }
        [Required]
        public bool IsAdmin { get; set; }
    }


}