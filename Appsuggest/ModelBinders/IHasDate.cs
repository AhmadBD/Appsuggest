using System;

namespace Appsuggest.ModelBinders
{
    public interface IHasDate
    {
        DateTime? Date { get; set; }
    }
}