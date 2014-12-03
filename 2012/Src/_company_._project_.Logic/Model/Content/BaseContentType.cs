using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _company_._project_.Logic.Model.Content
{
    using Umbraco.Core.Models;
    using Umbraco.Core.Models.PublishedContent;
    using Umbraco.Web;
    using Umbraco.Web.Security;

    public abstract class BaseContentType : PublishedContentModel
    {
        private MembershipHelper membershipHelper;

        protected BaseContentType(IPublishedContent content)
            : base(content)
        {
        }

        /// <summary>
        /// to match the .Members property found in the SurfaceControllers and the Views
        /// </summary>
        protected MembershipHelper Members
        {
            get
            {
                if (this.membershipHelper == null)
                {
                    this.membershipHelper = new MembershipHelper(UmbracoContext.Current);
                }

                return this.membershipHelper;
            }
        }
    }
}
