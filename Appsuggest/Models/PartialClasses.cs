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
    [MetadataType(typeof(UserMetadata))]
    public partial class User
    {
    }

    
}