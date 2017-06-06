using System.Web;
using Umbraco.Core.Models;
using Umbraco.Web;

namespace _company_._project_.Logic.Model.Content
{

    public class Article : Base
    {
        public Article(IPublishedContent content)
            : base(content)
        {
        }

        #region Content

        public string ContentHeader
        {
            get
            {
                return this.GetPropertyValue<string>("contentHeader");
            }
        }

        public IHtmlString ContentBody
        {
            get { return this.GetPropertyValue<IHtmlString>("contentBody"); }
        }

        #endregion Content
    }
}
