using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Appsuggest.Models
{
    public class HomeSearchViewModel
    {
        public string Search { get; set; }
        public int? AppTypeId { get; set; }
        public int? AppPlatformId { get; set; }
        public int? ProviderId { get; set; }
        public List<SelectListItem> AppTypeList { get; set; }
        public List<SelectListItem> AppPlatformList { get; set; }
        public List<SelectListItem> ProviderList { get; set; } 
        public List<App> Apps { get; set; } 
    }
}