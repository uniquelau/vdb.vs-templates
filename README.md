# Readme

This project aims to:

Creates a fresh Visual Studio solution that contains a Web and Logic project.
Give a good starting point for creating your own template, feel free to fork!

In this example we create some scaffolding for strongly typed Models and include
build tasks that ensure that permissions (ACL's) are correctly set when deploying
to Azure. The build tasks also handle the automatic deployment of files required
to run Umbraco. This means that you do not need to include every file within the
Visual Studio project.

## Why

1. Use the same starting point for all your projects
2. Contains sensible gitignore files
3. Automatically handles renaming and GUID replacement

## Security Best Practices

[web.config transform](https://github.com/uniquelau/vdb.vs-templates/blob/master/2015/Src/_company_._project_.Web/Web.Release.config)  
[urlrewrite useful outboundRules](https://github.com/uniquelau/vdb.vs-templates/blob/master/2015/Src/_company_._project_.Web/Config/RewriteOutboundRules.config)  
[urlrewite useful rules](https://github.com/uniquelau/vdb.vs-templates/blob/master/2015/Src/_company_._project_.Web/Config/RewriteRules.config)  

## Prerequisites

Windows  
Visual Studio  
Node.js  
Npm  

## Usage

1. Run `Create Visual Studio Project.bat`
2. Enter directory - `c:\git\`
3. Enter company - `Acne`
4. Enter project - `Site`
5. Enter full project name - `Acne Inc.`

This will create the following: `c:\git\Acne.Site\`

This will contain:

+ `Src\`  
++ `Acne.Site.Logic\` - Business Logic (e.g. POCO's, Helpers, Services)  
++ `Acne.Site.Web\` - Served Website  

6. This is a great time to make a Git Commit.

## Next setup Umbraco!

1. Run the Visual Studio Solution  (should open automagically)  
2. Open the Nuget Package Manager, and set the Project to 'Logic'  
3. Run 

`Install-Package UmbracoCms.Core`  
`Install-Package Our.Umbraco.Ditto`  
`Install-Package Our.Umbraco.Slimsy`
`Install-Package nuPickers`


4. Open the Nuget Package Manager, and set the Project to 'Web'  
5. Run 

`Install-Package UmbracoCms`  
`Install-Package ImageProcessor.Plugins.WebP`
`Install-Package ImageProcessor.Web.PostProcessor`
`Install-Package Our.Umbraco.Slimsy`
`Install-Package Our.Umbraco.StackedContent`
`Install-Package uSync`
`Install-Package uSync.ContentEdition`
`Install-Package uSync.ContentMappers`
`Install-Package nuPickers`
`Install-Package Umbraco.ModelsBuilder.Api`
    

## Upgrades

Firstly see: [Our Umbraco - Upgrades in General](https://our.umbraco.org/documentation/getting-started/setup/upgrading/general)

1. Git Commit
2. Delete the shared build directory `src\bin` to ensure the old binaries are not copied back into your web project
3. In Visual Studio using the Package Manager Console run `Install-Package UmbracoCms.Core` in *Logic* project
4. In Visual Studio using the Package Manager Console run `Install-Package UmbracoCms` in *Web* project
5. Review your conflicts using a good merge tool (SmartGit or BeyondCompare)
6. Stage and Commit files (tip: merge files directory by directory, e.g. first the root, then config, etc)
7. Build solution
8. Git Commit

## Notes

Project uses a common directory for binaries which are used for build.
Package DLL's from any project are copied into this directory.
On a successful build these are then copied into the Web project.
This avoids issues with missing DLL's when rebuilding and deploying the project.

## Known issues

1. Robocopy will fail if `node_modules` if present. Use `rimraf` to remove.

## Features

1. robots.txt - Indexing is automatically disabled when not on production domain.

## Useful Resources

### SSL

[Security Headers Test](https://securityheaders.io/)  
[Qualys SSL Test](https://www.ssllabs.com/ssltest/)  
[TomSSL - Article - How to Fix HTTP Response Header...](https://tomssl.com/2016/06/30/how-to-fix-the-http-response-headers-on-azure-web-apps-to-get-an-a-plus-on-securityheaders-io/)    

