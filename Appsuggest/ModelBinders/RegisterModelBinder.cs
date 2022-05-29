using Appsuggest.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Appsuggest.ModelBinders
{
    public class DateModelBinder<T> : DefaultModelBinder where T :IHasDate
    {
        public override object BindModel(ControllerContext controllerContext, ModelBindingContext bindingContext)
        {
            var x = (T)base.BindModel(controllerContext, bindingContext);
            HttpRequestBase request = controllerContext.HttpContext.Request;
            int day = Convert.ToInt32(request.Form.Get("dd"));
            int month = Convert.ToInt32(request.Form.Get("mm"));
            int year = Convert.ToInt32(request.Form.Get("yyyy"));
            if (day == 0 || month == 0 || year == 0)
                x.Date = null;
            x.Date=new DateTime(Convert.ToInt32(year), Convert.ToInt32(month),
            Convert.ToInt32(day));
            return x;

        }
        

    }
}