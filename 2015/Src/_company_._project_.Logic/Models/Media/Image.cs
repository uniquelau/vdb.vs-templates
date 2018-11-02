using Newtonsoft.Json;
using Umbraco.Core.Models;
using Umbraco.Web;
using Umbraco.Web.Models;

namespace _company_._project_.Logic.Model.Media
{
    using Model.Content;

    public class Image : BaseContentType
    {

        public Image(IPublishedContent content)
            : base(content)
        {
        }

        internal static bool IsJson(string input)
        {
            input = input.Trim();
            return (input.StartsWith("{") && input.EndsWith("}"))
                || (input.StartsWith("[") && input.EndsWith("]"));
        }

        #region Image

        public string AltText
        {
            get
            {
                return this.GetPropertyValue<string>("altText");
            }
        }

        public string UmbracoFile
        {
            get
            {
                var prop = this.GetPropertyValue<string>("umbracoFile");
                if (IsJson(prop))
                {
                    dynamic d = JsonConvert.DeserializeObject(prop);
                    return d.src;
                }
                return prop;
            }
        }

        public string UmbracoExtension
        {
            get
            {
                return this.GetPropertyValue<string>("umbracoExtension");
            }
        }

        public string UmbracoBytes
        {
            get
            {
                return this.GetPropertyValue<string>("umbracoBytes");
            }
        }

        public string UmbracoWidth
        {
            get
            {
                return this.GetPropertyValue<string>("umbracoWidth");
            }
        }

        public string UmbracoHeight
        {
            get
            {
                return this.GetPropertyValue<string>("umbracoHeight");
            }
        }

        #endregion Image

        public string Url
        {
            get
            {
                return this.GetCropUrl(imageCropMode: ImageCropMode.Max, width: 1200);
            }
        }


    }
}
