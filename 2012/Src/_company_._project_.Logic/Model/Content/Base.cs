using System;
using Umbraco.Core.Models;
using Umbraco.Web;

namespace _company_._project_.Logic.Model.Content
{
    public class Base : BaseContentType, IMeta
    {
	using Interfaces;
	using Media;

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

				public string SocialTitle
				{
						get
						{
								return this.GetPropertyValue<string>("socialTitle");
						}
				}

				public string SocialDescription
				{
						get
						{
								return this.GetPropertyValue<string>("socialDescription");
						}
				}

				public Image SocialImage
				{
						get
						{
								var ctn = GetMediaByProperty("teaserImage");
								return ctn != null ? new Image(ctn) : null;
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

				#region IMeta

				string IMeta.MetaTitle { get { return this.MetaTitle; } }
				string IMeta.MetaDescription { get { return this.MetaDescription; } }
				string IMeta.SocialTitle { get { return this.SocialTitle; } }
				string IMeta.SocialDescription { get { return this.SocialDescription; } }
				Image IMeta.SocialImage { get { return this.SocialImage; } }
				bool IMeta.SiteMapExclude { get { return this.SiteMapExclude; } }

				string IMeta.OgType { get { return "og:article"; } }

				#endregion

    }
}
