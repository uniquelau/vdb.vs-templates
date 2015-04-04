using System;
using Umbraco.Core.Models;
using Umbraco.Web;
using _company_._project_.Logic.Model.Content;
using Umbraco.Web.Models;

namespace _company_._project_.Logic.Model.Media
{
		public class Image : BaseContentType
		{

				public Image(IPublishedContent content)
						: base(content)
				{
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
								return this.GetPropertyValue<string>("umbracoFile");
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
								return this.GetCropUrl(imageCropMode: ImageCropMode.Max , width: 1200);
						}
				}

			
		}
}
