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
        [Display(Name = "Ad")]
        public string Name { get; set; }
        [Required]
        [Display(Name = "Açıklama")]
        public string Description { get; set; }
    }
    public class ProviderMetadata
    {
        [Key]
        public int Id { get; set; }
        [Required]
        [StringLength(50)]
        [Display(Name = "Ad")]
        public string Name { get; set; }
        [Url]
        [Display(Name = "Ana sayfa linki")]
        public string HomePageLink { get; set; }
        [Required]
        [Display(Name = "Logo Linki")]
        public string LogoLink { get; set; }
        [Required]
        [Display(Name = "Açıklama")]
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
        [Display(Name = "Ad")]
        public string Name { get; set; }
    }
    public class ImageMetadata
    {
        [Key]
        public int Id { get; set; }
        [Required]
        [Display(Name = "Linki")]
        public string Link { get; set; } 
        [Required]
        [Display(Name = "Uygulama")]
        public string AppId { get; set; }
    } 
    public class StateMetadata
    {
        [Key]
        public int Id { get; set; }
        [Required]
        [StringLength(50)]
        [Display(Name = "Ad")]
        public string Name { get; set; } 
        
    } 
    public class CityMetadata
    {
        [Key]
        public int Id { get; set; }
        [Required]
        [StringLength(50)]
        [Display(Name = "Ad")]
        public string Name { get; set; } 
        [Required]
        [Display(Name = "İl")]
        public string StateId { get; set; }
    }
    public class ConfigMetadata
    {
        [Key]
        [Required]
        [StringLength(50)]
        [Display(Name = "Ad")]
        public int Name { get; set; }
        [Required]
        [StringLength(255)]
        [Display(Name = "Değer")]
        public string Value { get; set; } 
      
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
       
        public bool CityId { get; set; }
        
        public DateTime BirthDate { get; set; }
    }


}