namespace _company_._project_.Logic.Model.Content
{
    using Umbraco.Core.Models;
    using Umbraco.Core.Models.PublishedContent;
    using Umbraco.Web;

    public abstract class BaseContentType : PublishedContentModel
    {
				private UmbracoHelper _umbracoHelper;

				protected BaseContentType(IPublishedContent content)
						: base(content)
				{
						_umbracoHelper = new UmbracoHelper(UmbracoContext.Current);
				}


				protected T GetProperty<T>(string propertyAlias)
				{
						return this.GetPropertyValue<T>(propertyAlias);
				}

				protected bool PropertyExists(string propertyAlias)
				{
						return this.HasProperty(propertyAlias);
				}

				protected IPublishedContent GetMediaByProperty(string propertyAlias)
				{
						var str = this.GetPropertyValue<string>(propertyAlias);

						if (str != null)
						{
								return _umbracoHelper.TypedMedia(str);
						}
						return null;
				}
  
    }
}