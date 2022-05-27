using System;
using System.ComponentModel.DataAnnotations;

using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Appsuggest.Models
{
    [MetadataType(typeof(AppMetadata))]
    public partial class App
    {
        
        public string ProviderName { get { return Provider.Name; } }
        public string AppTypeName { get { return AppType.Name; } }
        public string AppPlatformName { get { return AppPlatform.Name; } }
    }
    [MetadataType(typeof(AppTypeMetadata))]
    public partial class AppType
    {
    }
    [MetadataType(typeof(ProviderMetadata))]
    public partial class Provider
    {
    }
    [MetadataType(typeof(ReviewMetadata))]
    public partial class Review
    {
    }
    [MetadataType(typeof(AppPlatformMetadata))]
    public partial class AppPlatform
    {
    }
    [MetadataType(typeof(ImageMetadata))]
    public partial class Image
    {
    }
    [MetadataType(typeof(CityMetadata))]
    public partial class City
    {
    }
    [MetadataType(typeof(StateMetadata))]
    public partial class State
    {
    }
    [MetadataType(typeof(UserMetadata))]
    public partial class User
    {
    }

    
}