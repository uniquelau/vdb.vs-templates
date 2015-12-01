namespace _company_._project_.Logic.Model.Interfaces
{
    using Media;

    public interface IMeta
    {
        string ShortNavTitle { get; }

        string MetaTitle { get; }

        string MetaDescription { get; }

        bool SiteMapExclude { get; }

        string SocialTitle { get; }

        string SocialDescription { get; }

        Image SocialImage { get; }

        string OgType { get; }
    }
}
