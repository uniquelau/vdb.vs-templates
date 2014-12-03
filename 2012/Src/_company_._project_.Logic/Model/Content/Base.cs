using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Umbraco.Core.Models;
using Umbraco.Web;

namespace _company_._project_.Logic.Model.Content
{
    public class Base : BaseContentType
    {
        public Base(IPublishedContent content) : base(content)
        {
        }

        #region Meta

        public string ShortNavTitle
        {
            get
            {
                var navTitle = this.GetPropertyValue<string>("navTitle");
                return !String.IsNullOrWhiteSpace(navTitle) ? navTitle : Name;
            }
        }

        public string MetaTitle
        {
            get
            {
                var metaTitle = this.GetPropertyValue<string>("metaTitle");
                return !String.IsNullOrWhiteSpace(metaTitle) ? metaTitle : Name;
            }
        }

        public string MetaDescription
        {
            get
            {
                return this.GetPropertyValue<string>("metaDescription");
            }
        }

        public string MetaKeywords
        {
            get
            {
                return this.GetPropertyValue<string>("metaKeywords");
            }
        }

        public bool SiteMapExclude
        {
            get
            {
                return this.GetPropertyValue<bool>("metaSiteMapExclude");
            }
        }


        #endregion
    }
}
