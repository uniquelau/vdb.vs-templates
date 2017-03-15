# Readme

This project creates a Visual Studio solution, that uses strongly typed Models
and build tasks that ensure that permissions (ACL's) are correctly set when deploying
to Azure. The build tasks also handle the automatic deployment of files required
to run Umbraco. This means that you do not need to include every file within the
Visual Studio project.

## Security Best Practices

[web.config transform](https://github.com/uniquelau/vdb.vs-templates/blob/master/2012/Src/_company_._project_.Web/Web.Release.config)
[urlrewrite useful outboundRules](https://github.com/uniquelau/vdb.vs-templates/blob/master/2012/Src/_company_._project_.Web/Config/RewriteOutboundRules.config)
[urlrewite useful rules](https://github.com/uniquelau/vdb.vs-templates/blob/master/2012/Src/_company_._project_.Web/Config/RewriteRules.config)

## Prerequisites

Windows
Visual Studio

## Usage

1. Run 'Create Visual Studio Project.bat'
2. Enter directory - e.g. c:\git\
3. Enter company - e.g. Acne
4. Enter project - e.g. Site
5. Enter full project name - e.g. Acne Inc.

This will create:

c:\git\Acne.Site\ - Project Folder

Acne.Site
+ Src
+ + Acne.Site.Logic - Business Logic folder, include Umbraco Core CMS Binaries
+ + Acne.Site.Web - Served Website folder


6. Download the latest Umbraco version (the webpage will automatically open)
7. Open the Visual Studio Solution (Acne.Site.sln)
8. Open the Nuget Package Manager, and set the Project to 'Logic'
9. Run 'Install-Package UmbracoCms.Core'
10. The Project will now use the latest Umbraco binaries.
11. Next we copy the Umbraco files you downloaded earlier into the Web project
12. Run and Configure Umbraco :-)

## Upgrades

1. Git Commit
2. Run 'Install-Package UmbracoCms.Core' in 'Logic' project
3. Quit Visual Studio
4. Delete the project bin directory 'src\bin' this is created on each build
4. Download latest version of [Umbraco](https://our.umbraco.org/contribute/releases/)
5. Extract and copy files into 'Web' project
6. Use a good merge tool to handle file merges
7. Stage and Commit files (suggestion: merge files directory by directory, e.g. root, config, etc)
8. Run Visaul Studio project
9. Build solution
10. Git Commit

## Notes

Project uses a common directory for binairies which are used for build.
Package DLL's from any project are copied into this directory.
On a successful build these are then copied into the Web project.
This avoids issues with missing DLL's when deploying the project. 

## Useful Resources

### SSL

[Security Headers Test](https://securityheaders.io/)
[Qualys SSL Test](https://www.ssllabs.com/ssltest/)
[TomSSL - Article - How to Fix HTTP Response Header...](https://tomssl.com/2016/06/30/how-to-fix-the-http-response-headers-on-azure-web-apps-to-get-an-a-plus-on-securityheaders-io/)

