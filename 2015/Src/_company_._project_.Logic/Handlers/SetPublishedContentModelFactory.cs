using System;
using System.Collections.Generic;
using Umbraco.Core;
using Umbraco.Core.Models.PublishedContent;

namespace _company_._project_.Logic.Handlers
{
		public class SetPublishedContentModelFactory : ApplicationEventHandler
		{
				protected override void ApplicationStarting(UmbracoApplicationBase umbracoApplication, ApplicationContext applicationContext)
				{
						IEnumerable<Type> types = PluginManager.Current.ResolveTypes<PublishedContentModel>();
						var factory = new PublishedContentModelFactory(types);
						PublishedContentModelFactoryResolver.Current.SetFactory(factory);
				}
		}
}
