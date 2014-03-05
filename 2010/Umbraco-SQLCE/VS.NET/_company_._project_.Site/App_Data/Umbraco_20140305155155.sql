-- Script Date: 05/03/2014 15:51  - ErikEJ.SqlCeScripting version 3.5.2.26
-- Database information:
-- Locale Identifier: 2057
-- Encryption Mode: 
-- Case Sensitive: False
-- Database: D:\Git\vdb.vs-templates\2010\Copy of Umbraco\VS.NET\_company_._project_.Site\App_Data\\Umbraco_20140305155155.sdf
-- ServerVersion: 4.0.8854.1
-- DatabaseSize: 655360
-- Created: 05/03/2014 15:51

-- User Table information:
-- Number of tables: 42
-- cmsContent: 0 row(s)
-- cmsContentType: 3 row(s)
-- cmsContentType2ContentType: 0 row(s)
-- cmsContentTypeAllowedContentType: 3 row(s)
-- cmsContentVersion: 0 row(s)
-- cmsContentXml: 0 row(s)
-- cmsDataType: 24 row(s)
-- cmsDataTypePreValues: 2 row(s)
-- cmsDictionary: 0 row(s)
-- cmsDocument: 0 row(s)
-- cmsDocumentType: 0 row(s)
-- cmsLanguageText: 0 row(s)
-- cmsMacro: 0 row(s)
-- cmsMacroProperty: 0 row(s)
-- cmsMacroPropertyType: 16 row(s)
-- cmsMember: 0 row(s)
-- cmsMember2MemberGroup: 0 row(s)
-- cmsMemberType: 0 row(s)
-- cmsPreviewXml: 0 row(s)
-- cmsPropertyData: 0 row(s)
-- cmsPropertyType: 9 row(s)
-- cmsPropertyTypeGroup: 3 row(s)
-- cmsStylesheet: 0 row(s)
-- cmsStylesheetProperty: 0 row(s)
-- cmsTagRelationship: 0 row(s)
-- cmsTags: 0 row(s)
-- cmsTask: 0 row(s)
-- cmsTaskType: 1 row(s)
-- cmsTemplate: 0 row(s)
-- umbracoDomains: 0 row(s)
-- umbracoLanguage: 1 row(s)
-- umbracoLog: 1 row(s)
-- umbracoNode: 30 row(s)
-- umbracoRelation: 0 row(s)
-- umbracoRelationType: 1 row(s)
-- umbracoServer: 0 row(s)
-- umbracoUser: 1 row(s)
-- umbracoUser2app: 6 row(s)
-- umbracoUser2NodeNotify: 0 row(s)
-- umbracoUser2NodePermission: 0 row(s)
-- umbracoUserLogins: -1 row(s)
-- umbracoUserType: 4 row(s)

CREATE TABLE [cmsContent] (
  [pk] int NOT NULL  IDENTITY (1,1)
, [nodeId] int NOT NULL
, [contentType] int NOT NULL
);
GO
CREATE TABLE [cmsContentType] (
  [pk] int NOT NULL  IDENTITY (535,1)
, [nodeId] int NOT NULL
, [alias] nvarchar(255) NULL
, [icon] nvarchar(255) NULL
, [thumbnail] nvarchar(255) NOT NULL DEFAULT ('folder.png')
, [description] nvarchar(1500) NULL
, [isContainer] bit NOT NULL DEFAULT ('0')
, [allowAtRoot] bit NOT NULL DEFAULT ('0')
);
GO
CREATE TABLE [cmsContentType2ContentType] (
  [parentContentTypeId] int NOT NULL
, [childContentTypeId] int NOT NULL
);
GO
CREATE TABLE [cmsContentTypeAllowedContentType] (
  [Id] int NOT NULL
, [AllowedId] int NOT NULL
, [SortOrder] int NOT NULL DEFAULT ('0')
);
GO
CREATE TABLE [cmsContentVersion] (
  [id] int NOT NULL  IDENTITY (1,1)
, [ContentId] int NOT NULL
, [VersionId] uniqueidentifier NOT NULL
, [VersionDate] datetime NOT NULL DEFAULT (getdate())
, [LanguageLocale] nvarchar(10) NULL
);
GO
CREATE TABLE [cmsContentXml] (
  [nodeId] int NOT NULL
, [xml] ntext NOT NULL
);
GO
CREATE TABLE [cmsDataType] (
  [pk] int NOT NULL  IDENTITY (25,1)
, [nodeId] int NOT NULL
, [controlId] uniqueidentifier NOT NULL
, [dbType] nvarchar(50) NOT NULL
);
GO
CREATE TABLE [cmsDataTypePreValues] (
  [id] int NOT NULL  IDENTITY (5,1)
, [datatypeNodeId] int NOT NULL
, [value] nvarchar(2500) NULL
, [sortorder] int NOT NULL
, [alias] nvarchar(50) NULL
);
GO
CREATE TABLE [cmsDictionary] (
  [pk] int NOT NULL  IDENTITY (1,1)
, [id] uniqueidentifier NOT NULL
, [parent] uniqueidentifier NOT NULL
, [key] nvarchar(1000) NOT NULL
);
GO
CREATE TABLE [cmsDocument] (
  [nodeId] int NOT NULL
, [published] bit NOT NULL
, [documentUser] int NOT NULL
, [versionId] uniqueidentifier NOT NULL
, [text] nvarchar(255) NOT NULL
, [releaseDate] datetime NULL
, [expireDate] datetime NULL
, [updateDate] datetime NOT NULL DEFAULT (getdate())
, [templateId] int NULL
, [alias] nvarchar(255) NULL
, [newest] bit NOT NULL DEFAULT ('0')
);
GO
CREATE TABLE [cmsDocumentType] (
  [contentTypeNodeId] int NOT NULL
, [templateNodeId] int NOT NULL
, [IsDefault] bit NOT NULL DEFAULT ('0')
);
GO
CREATE TABLE [cmsLanguageText] (
  [pk] int NOT NULL  IDENTITY (1,1)
, [languageId] int NOT NULL
, [UniqueId] uniqueidentifier NOT NULL
, [value] nvarchar(1000) NOT NULL
);
GO
CREATE TABLE [cmsMacro] (
  [id] int NOT NULL  IDENTITY (1,1)
, [macroUseInEditor] bit NOT NULL DEFAULT ('0')
, [macroRefreshRate] int NOT NULL DEFAULT ('0')
, [macroAlias] nvarchar(255) NOT NULL
, [macroName] nvarchar(255) NULL
, [macroScriptType] nvarchar(255) NULL
, [macroScriptAssembly] nvarchar(255) NULL
, [macroXSLT] nvarchar(255) NULL
, [macroCacheByPage] bit NOT NULL DEFAULT ('1')
, [macroCachePersonalized] bit NOT NULL DEFAULT ('0')
, [macroDontRender] bit NOT NULL DEFAULT ('0')
, [macroPython] nvarchar(255) NULL
);
GO
CREATE TABLE [cmsMacroProperty] (
  [id] int NOT NULL  IDENTITY (1,1)
, [macroPropertyHidden] bit NOT NULL DEFAULT ('0')
, [macroPropertyType] int NOT NULL
, [macro] int NOT NULL
, [macroPropertySortOrder] int NOT NULL DEFAULT ('0')
, [macroPropertyAlias] nvarchar(50) NOT NULL
, [macroPropertyName] nvarchar(255) NOT NULL
);
GO
CREATE TABLE [cmsMacroPropertyType] (
  [id] int NOT NULL  IDENTITY (26,1)
, [macroPropertyTypeAlias] nvarchar(50) NULL
, [macroPropertyTypeRenderAssembly] nvarchar(255) NULL
, [macroPropertyTypeRenderType] nvarchar(255) NULL
, [macroPropertyTypeBaseType] nvarchar(255) NULL
);
GO
CREATE TABLE [cmsMember] (
  [nodeId] int NOT NULL
, [Email] nvarchar(1000) NOT NULL DEFAULT ('''')
, [LoginName] nvarchar(1000) NOT NULL DEFAULT ('''')
, [Password] nvarchar(1000) NOT NULL DEFAULT ('''')
);
GO
CREATE TABLE [cmsMember2MemberGroup] (
  [Member] int NOT NULL
, [MemberGroup] int NOT NULL
);
GO
CREATE TABLE [cmsMemberType] (
  [pk] int NOT NULL  IDENTITY (1,1)
, [NodeId] int NOT NULL
, [propertytypeId] int NOT NULL
, [memberCanEdit] bit NOT NULL DEFAULT ('0')
, [viewOnProfile] bit NOT NULL DEFAULT ('0')
);
GO
CREATE TABLE [cmsPreviewXml] (
  [nodeId] int NOT NULL
, [versionId] uniqueidentifier NOT NULL
, [timestamp] datetime NOT NULL
, [xml] ntext NOT NULL
);
GO
CREATE TABLE [cmsPropertyData] (
  [id] int NOT NULL  IDENTITY (1,1)
, [contentNodeId] int NOT NULL
, [versionId] uniqueidentifier NULL
, [propertytypeid] int NOT NULL
, [dataInt] int NULL
, [dataDate] datetime NULL
, [dataNvarchar] nvarchar(500) NULL
, [dataNtext] ntext NULL
);
GO
CREATE TABLE [cmsPropertyType] (
  [id] int NOT NULL  IDENTITY (28,1)
, [dataTypeId] int NOT NULL
, [contentTypeId] int NOT NULL
, [propertyTypeGroupId] int NULL
, [Alias] nvarchar(255) NOT NULL
, [Name] nvarchar(255) NULL
, [helpText] nvarchar(1000) NULL
, [sortOrder] int NOT NULL DEFAULT ('0')
, [mandatory] bit NOT NULL DEFAULT ('0')
, [validationRegExp] nvarchar(255) NULL
, [Description] nvarchar(2000) NULL
);
GO
CREATE TABLE [cmsPropertyTypeGroup] (
  [id] int NOT NULL  IDENTITY (6,1)
, [parentGroupId] int NULL
, [contenttypeNodeId] int NOT NULL
, [text] nvarchar(255) NOT NULL
, [sortorder] int NOT NULL
);
GO
CREATE TABLE [cmsStylesheet] (
  [nodeId] int NOT NULL
, [filename] nvarchar(100) NOT NULL
, [content] ntext NULL
);
GO
CREATE TABLE [cmsStylesheetProperty] (
  [nodeId] int NOT NULL
, [stylesheetPropertyEditor] bit NULL
, [stylesheetPropertyAlias] nvarchar(50) NULL
, [stylesheetPropertyValue] nvarchar(400) NULL
);
GO
CREATE TABLE [cmsTagRelationship] (
  [nodeId] int NOT NULL
, [tagId] int NOT NULL
);
GO
CREATE TABLE [cmsTags] (
  [id] int NOT NULL  IDENTITY (1,1)
, [tag] nvarchar(200) NULL
, [ParentId] int NULL
, [group] nvarchar(100) NULL
);
GO
CREATE TABLE [cmsTask] (
  [closed] bit NOT NULL DEFAULT ('0')
, [id] int NOT NULL  IDENTITY (1,1)
, [taskTypeId] int NOT NULL
, [nodeId] int NOT NULL
, [parentUserId] int NOT NULL
, [userId] int NOT NULL
, [DateTime] datetime NOT NULL DEFAULT (getdate())
, [Comment] nvarchar(500) NULL
);
GO
CREATE TABLE [cmsTaskType] (
  [id] int NOT NULL  IDENTITY (1,1)
, [alias] nvarchar(255) NOT NULL
);
GO
CREATE TABLE [cmsTemplate] (
  [pk] int NOT NULL  IDENTITY (1,1)
, [nodeId] int NOT NULL
, [master] int NULL
, [alias] nvarchar(100) NULL
, [design] ntext NOT NULL
);
GO
CREATE TABLE [umbracoDomains] (
  [id] int NOT NULL  IDENTITY (1,1)
, [domainDefaultLanguage] int NULL
, [domainRootStructureID] int NULL
, [domainName] nvarchar(255) NOT NULL
);
GO
CREATE TABLE [umbracoLanguage] (
  [id] int NOT NULL  IDENTITY (2,1)
, [languageISOCode] nvarchar(10) NULL
, [languageCultureName] nvarchar(100) NULL
);
GO
CREATE TABLE [umbracoLog] (
  [id] int NOT NULL  IDENTITY (2,1)
, [userId] int NOT NULL
, [NodeId] int NOT NULL
, [Datestamp] datetime NOT NULL DEFAULT (getdate())
, [logHeader] nvarchar(50) NOT NULL
, [logComment] nvarchar(4000) NULL
);
GO
CREATE TABLE [umbracoNode] (
  [id] int NOT NULL  IDENTITY (1045,1)
, [trashed] bit NOT NULL DEFAULT ('0')
, [parentID] int NOT NULL
, [nodeUser] int NULL
, [level] int NOT NULL
, [path] nvarchar(150) NOT NULL
, [sortOrder] int NOT NULL
, [uniqueID] uniqueidentifier NULL
, [text] nvarchar(255) NULL
, [nodeObjectType] uniqueidentifier NULL
, [createDate] datetime NOT NULL DEFAULT (getdate())
);
GO
CREATE TABLE [umbracoRelation] (
  [id] int NOT NULL  IDENTITY (1,1)
, [parentId] int NOT NULL
, [childId] int NOT NULL
, [relType] int NOT NULL
, [datetime] datetime NOT NULL DEFAULT (getdate())
, [comment] nvarchar(1000) NOT NULL
);
GO
CREATE TABLE [umbracoRelationType] (
  [id] int NOT NULL  IDENTITY (2,1)
, [dual] bit NOT NULL
, [parentObjectType] uniqueidentifier NOT NULL
, [childObjectType] uniqueidentifier NOT NULL
, [name] nvarchar(255) NOT NULL
, [alias] nvarchar(100) NULL
);
GO
CREATE TABLE [umbracoServer] (
  [id] int NOT NULL  IDENTITY (1,1)
, [address] nvarchar(500) NOT NULL
, [computerName] nvarchar(255) NOT NULL
, [registeredDate] datetime NOT NULL DEFAULT (getdate())
, [lastNotifiedDate] datetime NOT NULL DEFAULT (getdate())
, [isActive] bit NOT NULL
);
GO
CREATE TABLE [umbracoUser] (
  [id] int NOT NULL  IDENTITY (1,1)
, [userDisabled] bit NOT NULL DEFAULT ('0')
, [userNoConsole] bit NOT NULL DEFAULT ('0')
, [userType] int NOT NULL
, [startStructureID] int NOT NULL
, [startMediaID] int NULL
, [userName] nvarchar(255) NOT NULL
, [userLogin] nvarchar(125) NOT NULL
, [userPassword] nvarchar(125) NOT NULL
, [userEmail] nvarchar(255) NOT NULL
, [userDefaultPermissions] nvarchar(50) NULL
, [userLanguage] nvarchar(10) NULL
, [defaultToLiveEditing] bit NOT NULL DEFAULT ('0')
);
GO
CREATE TABLE [umbracoUser2app] (
  [user] int NOT NULL
, [app] nvarchar(50) NOT NULL
);
GO
CREATE TABLE [umbracoUser2NodeNotify] (
  [userId] int NOT NULL
, [nodeId] int NOT NULL
, [action] nchar(1) NOT NULL
);
GO
CREATE TABLE [umbracoUser2NodePermission] (
  [userId] int NOT NULL
, [nodeId] int NOT NULL
, [permission] nvarchar(255) NOT NULL
);
GO
CREATE TABLE [umbracoUserLogins] (
  [contextID] uniqueidentifier NOT NULL
, [userID] int NOT NULL
, [timeout] bigint NOT NULL
);
GO
CREATE TABLE [umbracoUserType] (
  [id] int NOT NULL  IDENTITY (5,1)
, [userTypeAlias] nvarchar(50) NULL
, [userTypeName] nvarchar(255) NOT NULL
, [userTypeDefaultPermissions] nvarchar(50) NULL
);
GO
SET IDENTITY_INSERT [cmsContent] OFF;
GO
SET IDENTITY_INSERT [cmsContentType] ON;
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (532,1031,N'Folder',N'folder.gif',N'folder.png',NULL,1,1);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (533,1032,N'Image',N'mediaPhoto.gif',N'mediaPhoto.png',NULL,0,0);
GO
INSERT INTO [cmsContentType] ([pk],[nodeId],[alias],[icon],[thumbnail],[description],[isContainer],[allowAtRoot]) VALUES (534,1033,N'File',N'mediaFile.gif',N'mediaFile.png',NULL,0,0);
GO
SET IDENTITY_INSERT [cmsContentType] OFF;
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (1031,1031,0);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (1031,1032,0);
GO
INSERT INTO [cmsContentTypeAllowedContentType] ([Id],[AllowedId],[SortOrder]) VALUES (1031,1033,0);
GO
SET IDENTITY_INSERT [cmsContentVersion] OFF;
GO
SET IDENTITY_INSERT [cmsDataType] ON;
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[controlId],[dbType]) VALUES (1,-49,'38b352c1-e9f8-4fd8-9324-9a2eab06d97a',N'Integer');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[controlId],[dbType]) VALUES (2,-51,'1413afcb-d19a-4173-8e9a-68288d2a73b8',N'Integer');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[controlId],[dbType]) VALUES (3,-87,'5e9b75ae-face-41c8-b47e-5f4b0fd82f83',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[controlId],[dbType]) VALUES (4,-88,'ec15c1e5-9d90-422a-aa52-4f7622c63bea',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[controlId],[dbType]) VALUES (5,-89,'67db8357-ef57-493e-91ac-936d305e0f2a',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[controlId],[dbType]) VALUES (6,-90,'5032a6e6-69e3-491d-bb28-cd31cd11086c',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[controlId],[dbType]) VALUES (7,-92,'6c738306-4c17-4d88-b9bd-6546f3771597',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[controlId],[dbType]) VALUES (8,-36,'b6fb1622-afa5-4bbf-a3cc-d9672a442222',N'Date');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[controlId],[dbType]) VALUES (9,-37,'f8d60f68-ec59-4974-b43b-c46eb5677985',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[controlId],[dbType]) VALUES (10,-38,'cccd4ae9-f399-4ed2-8038-2e88d19e810c',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[controlId],[dbType]) VALUES (11,-39,'928639ed-9c73-4028-920c-1e55dbb68783',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[controlId],[dbType]) VALUES (12,-40,'a52c7c1c-c330-476e-8605-d63d3b84b6a6',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[controlId],[dbType]) VALUES (13,-41,'23e93522-3200-44e2-9f29-e61a6fcbb79a',N'Date');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[controlId],[dbType]) VALUES (14,-42,'a74ea9c9-8e18-4d2a-8cf6-73c6206c5da6',N'Integer');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[controlId],[dbType]) VALUES (15,-43,'b4471851-82b6-4c75-afa4-39fa9c6a75e9',N'Nvarchar');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[controlId],[dbType]) VALUES (16,1034,'158aa029-24ed-4948-939e-c3da209e5fba',N'Integer');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[controlId],[dbType]) VALUES (17,1035,'ead69342-f06d-4253-83ac-28000225583b',N'Integer');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[controlId],[dbType]) VALUES (18,1036,'39f533e4-0551-4505-a64b-e0425c5ce775',N'Integer');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[controlId],[dbType]) VALUES (19,1038,'60b7dabf-99cd-41eb-b8e9-4d2e669bbde9',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[controlId],[dbType]) VALUES (20,1039,'cdbf0b5d-5cb2-445f-bc12-fcaaec07cf2c',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[controlId],[dbType]) VALUES (21,1040,'71b8ad1a-8dc2-425c-b6b8-faa158075e63',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[controlId],[dbType]) VALUES (22,1041,'4023e540-92f5-11dd-ad8b-0800200c9a66',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[controlId],[dbType]) VALUES (23,1042,'474fcff8-9d2d-11de-abc6-ad7a56d89593',N'Ntext');
GO
INSERT INTO [cmsDataType] ([pk],[nodeId],[controlId],[dbType]) VALUES (24,1043,'7a2d436c-34c2-410f-898f-4a23b3d79f54',N'Ntext');
GO
SET IDENTITY_INSERT [cmsDataType] OFF;
GO
SET IDENTITY_INSERT [cmsDataTypePreValues] ON;
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (3,-87,N',code,undo,redo,cut,copy,mcepasteword,stylepicker,bold,italic,bullist,numlist,outdent,indent,mcelink,unlink,mceinsertanchor,mceimage,umbracomacro,mceinserttable,umbracoembed,mcecharmap,|1|1,2,3,|0|500,400|1049,|true|',0,N'');
GO
INSERT INTO [cmsDataTypePreValues] ([id],[datatypeNodeId],[value],[sortorder],[alias]) VALUES (4,1041,N'default',0,N'group');
GO
SET IDENTITY_INSERT [cmsDataTypePreValues] OFF;
GO
SET IDENTITY_INSERT [cmsDictionary] OFF;
GO
SET IDENTITY_INSERT [cmsLanguageText] OFF;
GO
SET IDENTITY_INSERT [cmsMacro] OFF;
GO
SET IDENTITY_INSERT [cmsMacroProperty] OFF;
GO
SET IDENTITY_INSERT [cmsMacroPropertyType] ON;
GO
INSERT INTO [cmsMacroPropertyType] ([id],[macroPropertyTypeAlias],[macroPropertyTypeRenderAssembly],[macroPropertyTypeRenderType],[macroPropertyTypeBaseType]) VALUES (3,N'mediaCurrent',N'umbraco.macroRenderings',N'media',N'Int32');
GO
INSERT INTO [cmsMacroPropertyType] ([id],[macroPropertyTypeAlias],[macroPropertyTypeRenderAssembly],[macroPropertyTypeRenderType],[macroPropertyTypeBaseType]) VALUES (4,N'contentSubs',N'umbraco.macroRenderings',N'content',N'Int32');
GO
INSERT INTO [cmsMacroPropertyType] ([id],[macroPropertyTypeAlias],[macroPropertyTypeRenderAssembly],[macroPropertyTypeRenderType],[macroPropertyTypeBaseType]) VALUES (5,N'contentRandom',N'umbraco.macroRenderings',N'content',N'Int32');
GO
INSERT INTO [cmsMacroPropertyType] ([id],[macroPropertyTypeAlias],[macroPropertyTypeRenderAssembly],[macroPropertyTypeRenderType],[macroPropertyTypeBaseType]) VALUES (6,N'contentPicker',N'umbraco.macroRenderings',N'content',N'Int32');
GO
INSERT INTO [cmsMacroPropertyType] ([id],[macroPropertyTypeAlias],[macroPropertyTypeRenderAssembly],[macroPropertyTypeRenderType],[macroPropertyTypeBaseType]) VALUES (13,N'number',N'umbraco.macroRenderings',N'numeric',N'Int32');
GO
INSERT INTO [cmsMacroPropertyType] ([id],[macroPropertyTypeAlias],[macroPropertyTypeRenderAssembly],[macroPropertyTypeRenderType],[macroPropertyTypeBaseType]) VALUES (14,N'bool',N'umbraco.macroRenderings',N'yesNo',N'Boolean');
GO
INSERT INTO [cmsMacroPropertyType] ([id],[macroPropertyTypeAlias],[macroPropertyTypeRenderAssembly],[macroPropertyTypeRenderType],[macroPropertyTypeBaseType]) VALUES (16,N'text',N'umbraco.macroRenderings',N'text',N'String');
GO
INSERT INTO [cmsMacroPropertyType] ([id],[macroPropertyTypeAlias],[macroPropertyTypeRenderAssembly],[macroPropertyTypeRenderType],[macroPropertyTypeBaseType]) VALUES (17,N'contentTree',N'umbraco.macroRenderings',N'content',N'Int32');
GO
INSERT INTO [cmsMacroPropertyType] ([id],[macroPropertyTypeAlias],[macroPropertyTypeRenderAssembly],[macroPropertyTypeRenderType],[macroPropertyTypeBaseType]) VALUES (18,N'contentType',N'umbraco.macroRenderings',N'contentTypeSingle',N'Int32');
GO
INSERT INTO [cmsMacroPropertyType] ([id],[macroPropertyTypeAlias],[macroPropertyTypeRenderAssembly],[macroPropertyTypeRenderType],[macroPropertyTypeBaseType]) VALUES (19,N'contentTypeMultiple',N'umbraco.macroRenderings',N'contentTypeMultiple',N'Int32');
GO
INSERT INTO [cmsMacroPropertyType] ([id],[macroPropertyTypeAlias],[macroPropertyTypeRenderAssembly],[macroPropertyTypeRenderType],[macroPropertyTypeBaseType]) VALUES (20,N'contentAll',N'umbraco.macroRenderings',N'content',N'Int32');
GO
INSERT INTO [cmsMacroPropertyType] ([id],[macroPropertyTypeAlias],[macroPropertyTypeRenderAssembly],[macroPropertyTypeRenderType],[macroPropertyTypeBaseType]) VALUES (21,N'tabPicker',N'umbraco.macroRenderings',N'tabPicker',N'String');
GO
INSERT INTO [cmsMacroPropertyType] ([id],[macroPropertyTypeAlias],[macroPropertyTypeRenderAssembly],[macroPropertyTypeRenderType],[macroPropertyTypeBaseType]) VALUES (22,N'tabPickerMultiple',N'umbraco.macroRenderings',N'tabPickerMultiple',N'String');
GO
INSERT INTO [cmsMacroPropertyType] ([id],[macroPropertyTypeAlias],[macroPropertyTypeRenderAssembly],[macroPropertyTypeRenderType],[macroPropertyTypeBaseType]) VALUES (23,N'propertyTypePicker',N'umbraco.macroRenderings',N'propertyTypePicker',N'String');
GO
INSERT INTO [cmsMacroPropertyType] ([id],[macroPropertyTypeAlias],[macroPropertyTypeRenderAssembly],[macroPropertyTypeRenderType],[macroPropertyTypeBaseType]) VALUES (24,N'propertyTypePickerMultiple',N'umbraco.macroRenderings',N'propertyTypePickerMultiple',N'String');
GO
INSERT INTO [cmsMacroPropertyType] ([id],[macroPropertyTypeAlias],[macroPropertyTypeRenderAssembly],[macroPropertyTypeRenderType],[macroPropertyTypeBaseType]) VALUES (25,N'textMultiLine',N'umbraco.macroRenderings',N'textMultiple',N'String');
GO
SET IDENTITY_INSERT [cmsMacroPropertyType] OFF;
GO
SET IDENTITY_INSERT [cmsMemberType] OFF;
GO
SET IDENTITY_INSERT [cmsPropertyData] OFF;
GO
SET IDENTITY_INSERT [cmsPropertyType] ON;
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (6,-90,1032,3,N'umbracoFile',N'Upload image',NULL,0,0,NULL,NULL);
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (7,-92,1032,3,N'umbracoWidth',N'Width',NULL,0,0,NULL,NULL);
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (8,-92,1032,3,N'umbracoHeight',N'Height',NULL,0,0,NULL,NULL);
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (9,-92,1032,3,N'umbracoBytes',N'Size',NULL,0,0,NULL,NULL);
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (10,-92,1032,3,N'umbracoExtension',N'Type',NULL,0,0,NULL,NULL);
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (24,-90,1033,4,N'umbracoFile',N'Upload file',NULL,0,0,NULL,NULL);
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (25,-92,1033,4,N'umbracoExtension',N'Type',NULL,0,0,NULL,NULL);
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (26,-92,1033,4,N'umbracoBytes',N'Size',NULL,0,0,NULL,NULL);
GO
INSERT INTO [cmsPropertyType] ([id],[dataTypeId],[contentTypeId],[propertyTypeGroupId],[Alias],[Name],[helpText],[sortOrder],[mandatory],[validationRegExp],[Description]) VALUES (27,-38,1031,5,N'contents',N'Contents:',NULL,0,0,NULL,NULL);
GO
SET IDENTITY_INSERT [cmsPropertyType] OFF;
GO
SET IDENTITY_INSERT [cmsPropertyTypeGroup] ON;
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[parentGroupId],[contenttypeNodeId],[text],[sortorder]) VALUES (3,NULL,1032,N'Image',1);
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[parentGroupId],[contenttypeNodeId],[text],[sortorder]) VALUES (4,NULL,1033,N'File',1);
GO
INSERT INTO [cmsPropertyTypeGroup] ([id],[parentGroupId],[contenttypeNodeId],[text],[sortorder]) VALUES (5,NULL,1031,N'Contents',1);
GO
SET IDENTITY_INSERT [cmsPropertyTypeGroup] OFF;
GO
SET IDENTITY_INSERT [cmsTags] OFF;
GO
SET IDENTITY_INSERT [cmsTask] OFF;
GO
SET IDENTITY_INSERT [cmsTaskType] ON;
GO
INSERT INTO [cmsTaskType] ([id],[alias]) VALUES (1,N'toTranslate');
GO
SET IDENTITY_INSERT [cmsTaskType] OFF;
GO
SET IDENTITY_INSERT [cmsTemplate] OFF;
GO
SET IDENTITY_INSERT [umbracoDomains] OFF;
GO
SET IDENTITY_INSERT [umbracoLanguage] ON;
GO
INSERT INTO [umbracoLanguage] ([id],[languageISOCode],[languageCultureName]) VALUES (1,N'en-US',N'en-US');
GO
SET IDENTITY_INSERT [umbracoLanguage] OFF;
GO
SET IDENTITY_INSERT [umbracoLog] ON;
GO
INSERT INTO [umbracoLog] ([id],[userId],[NodeId],[Datestamp],[logHeader],[logComment]) VALUES (1,0,-1,{ts '2014-03-05 15:48:39.003'},N'Save',N'Save ContentTypes performed by user');
GO
SET IDENTITY_INSERT [umbracoLog] OFF;
GO
SET IDENTITY_INSERT [umbracoNode] ON;
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-1,0,-1,0,0,N'-1',0,'916724a5-173d-4619-b97e-b9de133dd6f5',N'SYSTEM DATA: umbraco master root','ea7d8624-4cfe-4578-a871-24aa946bf34d',{ts '2014-03-05 15:40:48.727'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-20,0,-1,0,0,N'-1,-20',0,'0f582a79-1e41-4cf0-bfa0-76340651891a',N'Recycle Bin','01bb7ff2-24dc-4c0c-95a2-c24ef72bbac8',{ts '2014-03-05 15:40:48.727'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-21,0,-1,0,0,N'-1,-21',0,'bf7c7cbc-952f-4518-97a2-69e9c7b33842',N'Recycle Bin','cf3d8e34-1c1c-41e9-ae56-878b57b32113',{ts '2014-03-05 15:40:48.727'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-92,0,-1,0,1,N'-1,-92',35,'f0bc4bfb-b499-40d6-ba86-058885a5178c',N'Label','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2014-03-05 15:40:48.727'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-90,0,-1,0,1,N'-1,-90',34,'84c6b441-31df-4ffe-b67e-67d5bc3ae65a',N'Upload','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2014-03-05 15:40:48.727'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-89,0,-1,0,1,N'-1,-89',33,'c6bac0dd-4ab9-45b1-8e30-e4b619ee5da3',N'Textbox multiple','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2014-03-05 15:40:48.727'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-88,0,-1,0,1,N'-1,-88',32,'0cc0eba1-9960-42c9-bf9b-60e150b429ae',N'Textstring','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2014-03-05 15:40:48.727'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-87,0,-1,0,1,N'-1,-87',4,'ca90c950-0aff-4e72-b976-a30b1ac57dad',N'Richtext editor','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2014-03-05 15:40:48.727'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-51,0,-1,0,1,N'-1,-51',2,'2e6d3631-066e-44b8-aec4-96f09099b2b5',N'Numeric','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2014-03-05 15:40:48.727'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-49,0,-1,0,1,N'-1,-49',2,'92897bc6-a5f3-4ffe-ae27-f2e7e33dda49',N'True/false','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2014-03-05 15:40:48.727'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-43,0,-1,0,1,N'-1,-43',2,'fbaf13a8-4036-41f2-93a3-974f678c312a',N'Checkbox list','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2014-03-05 15:40:48.727'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-42,0,-1,0,1,N'-1,-42',2,'0b6a45e7-44ba-430d-9da5-4e46060b9e03',N'Dropdown','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2014-03-05 15:40:48.727'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-41,0,-1,0,1,N'-1,-41',2,'5046194e-4237-453c-a547-15db3a07c4e1',N'Date Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2014-03-05 15:40:48.727'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-40,0,-1,0,1,N'-1,-40',2,'bb5f57c9-ce2b-4bb9-b697-4caca783a805',N'Radiobox','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2014-03-05 15:40:48.727'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-39,0,-1,0,1,N'-1,-39',2,'f38f0ac7-1d27-439c-9f3f-089cd8825a53',N'Dropdown multiple','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2014-03-05 15:40:48.727'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-38,0,-1,0,1,N'-1,-38',2,'fd9f1447-6c61-4a7c-9595-5aa39147d318',N'Folder Browser','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2014-03-05 15:40:48.727'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-37,0,-1,0,1,N'-1,-37',2,'0225af17-b302-49cb-9176-b9f35cab9c17',N'Approved Color','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2014-03-05 15:40:48.727'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (-36,0,-1,0,1,N'-1,-36',2,'e4d66c0f-b935-4200-81f0-025f7256b89a',N'Date Picker with time','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2014-03-05 15:40:48.727'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1031,0,-1,0,1,N'-1,1031',2,'f38bd2d7-65d0-48e6-95dc-87ce06ec2d3d',N'Folder','4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e',{ts '2014-03-05 15:40:48.727'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1032,0,-1,0,1,N'-1,1032',2,'cc07b313-0843-4aa8-bbda-871c8da728c8',N'Image','4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e',{ts '2014-03-05 15:40:48.727'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1033,0,-1,0,1,N'-1,1033',2,'4c52d8ab-54e6-40cd-999c-7a5f24903e4d',N'File','4ea4382b-2f5a-4c2b-9587-ae9b3cf3602e',{ts '2014-03-05 15:40:48.727'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1034,0,-1,0,1,N'-1,1034',2,'a6857c73-d6e9-480c-b6e6-f15f6ad11125',N'Content Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2014-03-05 15:40:48.727'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1035,0,-1,0,1,N'-1,1035',2,'93929b9a-93a2-4e2a-b239-d99334440a59',N'Media Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2014-03-05 15:40:48.743'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1036,0,-1,0,1,N'-1,1036',2,'2b24165f-9782-4aa3-b459-1de4a4d21f60',N'Member Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2014-03-05 15:40:48.743'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1038,0,-1,0,1,N'-1,1038',2,'1251c96c-185c-4e9b-93f4-b48205573cbd',N'Simple Editor','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2014-03-05 15:40:48.743'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1039,0,-1,0,1,N'-1,1039',2,'06f349a9-c949-4b6a-8660-59c10451af42',N'Ultimate Picker','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2014-03-05 15:40:48.743'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1040,0,-1,0,1,N'-1,1040',2,'21e798da-e06e-4eda-a511-ed257f78d4fa',N'Related Links','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2014-03-05 15:40:48.743'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1041,0,-1,0,1,N'-1,1041',2,'b6b73142-b9c1-4bf8-a16d-e1c23320b549',N'Tags','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2014-03-05 15:40:48.743'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1042,0,-1,0,1,N'-1,1042',2,'0a452bd5-83f9-4bc3-8403-1286e13fb77e',N'Macro Container','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2014-03-05 15:40:48.743'});
GO
INSERT INTO [umbracoNode] ([id],[trashed],[parentID],[nodeUser],[level],[path],[sortOrder],[uniqueID],[text],[nodeObjectType],[createDate]) VALUES (1043,0,-1,0,1,N'-1,1043',2,'1df9f033-e6d4-451f-b8d2-e0cbc50a836f',N'Image Cropper','30a2a501-1978-4ddb-a57b-f7efed43ba3c',{ts '2014-03-05 15:40:48.743'});
GO
SET IDENTITY_INSERT [umbracoNode] OFF;
GO
SET IDENTITY_INSERT [umbracoRelation] OFF;
GO
SET IDENTITY_INSERT [umbracoRelationType] ON;
GO
INSERT INTO [umbracoRelationType] ([id],[dual],[parentObjectType],[childObjectType],[name],[alias]) VALUES (1,1,'c66ba18e-eaf3-4cff-8a22-41b16d66a972','c66ba18e-eaf3-4cff-8a22-41b16d66a972',N'Relate Document On Copy',N'relateDocumentOnCopy');
GO
SET IDENTITY_INSERT [umbracoRelationType] OFF;
GO
SET IDENTITY_INSERT [umbracoServer] OFF;
GO
SET IDENTITY_INSERT [umbracoUser] ON;
GO
INSERT INTO [umbracoUser] ([id],[userDisabled],[userNoConsole],[userType],[startStructureID],[startMediaID],[userName],[userLogin],[userPassword],[userEmail],[userDefaultPermissions],[userLanguage],[defaultToLiveEditing]) VALUES (0,0,0,1,-1,-1,N'Laurence Gillian',N'laurence.gillian',N'TYsnxVOZtZdXHKdzxxHOWSsxCiQ=',N'laurence.gillian@towergate.co.uk',NULL,N'en',0);
GO
SET IDENTITY_INSERT [umbracoUser] OFF;
GO
INSERT INTO [umbracoUser2app] ([user],[app]) VALUES (0,N'content');
GO
INSERT INTO [umbracoUser2app] ([user],[app]) VALUES (0,N'developer');
GO
INSERT INTO [umbracoUser2app] ([user],[app]) VALUES (0,N'media');
GO
INSERT INTO [umbracoUser2app] ([user],[app]) VALUES (0,N'member');
GO
INSERT INTO [umbracoUser2app] ([user],[app]) VALUES (0,N'settings');
GO
INSERT INTO [umbracoUser2app] ([user],[app]) VALUES (0,N'users');
GO
INSERT INTO [umbracoUserLogins] ([contextID],[userID],[timeout]) VALUES ('449aa519-fad4-4c48-9d19-d5451d0eedab',0,635296327104910052);
GO
SET IDENTITY_INSERT [umbracoUserType] ON;
GO
INSERT INTO [umbracoUserType] ([id],[userTypeAlias],[userTypeName],[userTypeDefaultPermissions]) VALUES (1,N'admin',N'Administrators',N'CADMOSKTPIURZ:5F');
GO
INSERT INTO [umbracoUserType] ([id],[userTypeAlias],[userTypeName],[userTypeDefaultPermissions]) VALUES (2,N'writer',N'Writer',N'CAH:F');
GO
INSERT INTO [umbracoUserType] ([id],[userTypeAlias],[userTypeName],[userTypeDefaultPermissions]) VALUES (3,N'editor',N'Editors',N'CADMOSKTPUZ:5F');
GO
INSERT INTO [umbracoUserType] ([id],[userTypeAlias],[userTypeName],[userTypeDefaultPermissions]) VALUES (4,N'translator',N'Translator',N'AF');
GO
SET IDENTITY_INSERT [umbracoUserType] OFF;
GO
ALTER TABLE [cmsContent] ADD CONSTRAINT [PK_cmsContent] PRIMARY KEY ([pk]);
GO
ALTER TABLE [cmsContentType] ADD CONSTRAINT [PK_cmsContentType] PRIMARY KEY ([pk]);
GO
ALTER TABLE [cmsContentType2ContentType] ADD CONSTRAINT [PK_cmsContentType2ContentType] PRIMARY KEY ([parentContentTypeId],[childContentTypeId]);
GO
ALTER TABLE [cmsContentTypeAllowedContentType] ADD CONSTRAINT [PK_cmsContentTypeAllowedContentType] PRIMARY KEY ([Id],[AllowedId]);
GO
ALTER TABLE [cmsContentVersion] ADD CONSTRAINT [PK_cmsContentVersion] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsContentXml] ADD CONSTRAINT [PK_cmsContentXml] PRIMARY KEY ([nodeId]);
GO
ALTER TABLE [cmsDataType] ADD CONSTRAINT [PK_cmsDataType] PRIMARY KEY ([pk]);
GO
ALTER TABLE [cmsDataTypePreValues] ADD CONSTRAINT [PK_cmsDataTypePreValues] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsDictionary] ADD CONSTRAINT [PK_cmsDictionary] PRIMARY KEY ([pk]);
GO
ALTER TABLE [cmsDocument] ADD CONSTRAINT [PK_cmsDocument] PRIMARY KEY ([versionId]);
GO
ALTER TABLE [cmsDocumentType] ADD CONSTRAINT [PK_cmsDocumentType] PRIMARY KEY ([contentTypeNodeId],[templateNodeId]);
GO
ALTER TABLE [cmsLanguageText] ADD CONSTRAINT [PK_cmsLanguageText] PRIMARY KEY ([pk]);
GO
ALTER TABLE [cmsMacro] ADD CONSTRAINT [PK_cmsMacro] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsMacroProperty] ADD CONSTRAINT [PK_cmsMacroProperty] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsMacroPropertyType] ADD CONSTRAINT [PK_cmsMacroPropertyType] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsMember] ADD CONSTRAINT [PK_cmsMember] PRIMARY KEY ([nodeId]);
GO
ALTER TABLE [cmsMember2MemberGroup] ADD CONSTRAINT [PK_cmsMember2MemberGroup] PRIMARY KEY ([Member],[MemberGroup]);
GO
ALTER TABLE [cmsMemberType] ADD CONSTRAINT [PK_cmsMemberType] PRIMARY KEY ([pk]);
GO
ALTER TABLE [cmsPreviewXml] ADD CONSTRAINT [PK_cmsPreviewXml] PRIMARY KEY ([nodeId],[versionId]);
GO
ALTER TABLE [cmsPropertyData] ADD CONSTRAINT [PK_cmsPropertyData] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsPropertyType] ADD CONSTRAINT [PK_cmsPropertyType] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsPropertyTypeGroup] ADD CONSTRAINT [PK_cmsPropertyTypeGroup] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsStylesheet] ADD CONSTRAINT [PK_cmsStylesheet] PRIMARY KEY ([nodeId]);
GO
ALTER TABLE [cmsStylesheetProperty] ADD CONSTRAINT [PK_cmsStylesheetProperty] PRIMARY KEY ([nodeId]);
GO
ALTER TABLE [cmsTagRelationship] ADD CONSTRAINT [PK_cmsTagRelationship] PRIMARY KEY ([nodeId],[tagId]);
GO
ALTER TABLE [cmsTags] ADD CONSTRAINT [PK_cmsTags] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsTask] ADD CONSTRAINT [PK_cmsTask] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsTaskType] ADD CONSTRAINT [PK_cmsTaskType] PRIMARY KEY ([id]);
GO
ALTER TABLE [cmsTemplate] ADD CONSTRAINT [PK_cmsTemplate] PRIMARY KEY ([pk]);
GO
ALTER TABLE [umbracoDomains] ADD CONSTRAINT [PK_umbracoDomains] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoLanguage] ADD CONSTRAINT [PK_umbracoLanguage] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoLog] ADD CONSTRAINT [PK_umbracoLog] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoNode] ADD CONSTRAINT [PK_structure] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoRelation] ADD CONSTRAINT [PK_umbracoRelation] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoRelationType] ADD CONSTRAINT [PK_umbracoRelationType] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoServer] ADD CONSTRAINT [PK_umbracoServer] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoUser] ADD CONSTRAINT [PK_user] PRIMARY KEY ([id]);
GO
ALTER TABLE [umbracoUser2app] ADD CONSTRAINT [PK_user2app] PRIMARY KEY ([user],[app]);
GO
ALTER TABLE [umbracoUser2NodeNotify] ADD CONSTRAINT [PK_umbracoUser2NodeNotify] PRIMARY KEY ([userId],[nodeId],[action]);
GO
ALTER TABLE [umbracoUser2NodePermission] ADD CONSTRAINT [PK_umbracoUser2NodePermission] PRIMARY KEY ([userId],[nodeId],[permission]);
GO
ALTER TABLE [umbracoUserType] ADD CONSTRAINT [PK_umbracoUserType] PRIMARY KEY ([id]);
GO
CREATE UNIQUE INDEX [IX_cmsContent] ON [cmsContent] ([nodeId] ASC);
GO
CREATE UNIQUE INDEX [IX_cmsContentType] ON [cmsContentType] ([nodeId] ASC);
GO
CREATE INDEX [IX_cmsContentType_icon] ON [cmsContentType] ([icon] ASC);
GO
CREATE UNIQUE INDEX [IX_cmsContentVersion_VersionId] ON [cmsContentVersion] ([VersionId] ASC);
GO
CREATE UNIQUE INDEX [IX_cmsDataType_nodeId] ON [cmsDataType] ([nodeId] ASC);
GO
CREATE UNIQUE INDEX [IX_cmsDictionary_id] ON [cmsDictionary] ([id] ASC);
GO
CREATE UNIQUE INDEX [IX_cmsDocument] ON [cmsDocument] ([nodeId] ASC,[versionId] ASC);
GO
CREATE INDEX [IX_cmsPropertyData] ON [cmsPropertyData] ([id] ASC);
GO
CREATE INDEX [IX_cmsPropertyData_1] ON [cmsPropertyData] ([contentNodeId] ASC);
GO
CREATE INDEX [IX_cmsPropertyData_2] ON [cmsPropertyData] ([versionId] ASC);
GO
CREATE INDEX [IX_cmsPropertyData_3] ON [cmsPropertyData] ([propertytypeid] ASC);
GO
CREATE INDEX [IX_cmsTaskType_alias] ON [cmsTaskType] ([alias] ASC);
GO
CREATE UNIQUE INDEX [IX_cmsTemplate_nodeId] ON [cmsTemplate] ([nodeId] ASC);
GO
CREATE UNIQUE INDEX [IX_umbracoLanguage_languageISOCode] ON [umbracoLanguage] ([languageISOCode] ASC);
GO
CREATE INDEX [IX_umbracoLog] ON [umbracoLog] ([NodeId] ASC);
GO
CREATE INDEX [IX_umbracoNodeObjectType] ON [umbracoNode] ([nodeObjectType] ASC);
GO
CREATE INDEX [IX_umbracoNodeParentId] ON [umbracoNode] ([parentID] ASC);
GO
CREATE UNIQUE INDEX [IX_computerName] ON [umbracoServer] ([computerName] ASC);
GO
CREATE INDEX [IX_umbracoServer_isActive] ON [umbracoServer] ([isActive] ASC);
GO
CREATE INDEX [IX_umbracoUser_userLogin] ON [umbracoUser] ([userLogin] ASC);
GO
CREATE INDEX [umbracoUserLogins_Index] ON [umbracoUserLogins] ([contextID] ASC);
GO
ALTER TABLE [cmsContent] ADD CONSTRAINT [FK_cmsContent_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsContentType] ADD CONSTRAINT [FK_cmsContentType_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsContentType2ContentType] ADD CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_child] FOREIGN KEY ([childContentTypeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsContentType2ContentType] ADD CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_parent] FOREIGN KEY ([parentContentTypeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsDataType] ADD CONSTRAINT [FK_cmsDataType_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsDocument] ADD CONSTRAINT [FK_cmsDocument_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsDocumentType] ADD CONSTRAINT [FK_cmsDocumentType_umbracoNode_id] FOREIGN KEY ([contentTypeNodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsMacroProperty] ADD CONSTRAINT [FK_cmsMacroProperty_cmsMacro_id] FOREIGN KEY ([macro]) REFERENCES [cmsMacro]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsMacroProperty] ADD CONSTRAINT [FK_cmsMacroProperty_cmsMacroPropertyType_id] FOREIGN KEY ([macroPropertyType]) REFERENCES [cmsMacroPropertyType]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsMember] ADD CONSTRAINT [FK_cmsMember_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsMember2MemberGroup] ADD CONSTRAINT [FK_cmsMember2MemberGroup_cmsMember_nodeId] FOREIGN KEY ([Member]) REFERENCES [cmsMember]([nodeId]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsMember2MemberGroup] ADD CONSTRAINT [FK_cmsMember2MemberGroup_umbracoNode_id] FOREIGN KEY ([MemberGroup]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsMemberType] ADD CONSTRAINT [FK_cmsMemberType_umbracoNode_id] FOREIGN KEY ([NodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsPropertyData] ADD CONSTRAINT [FK_cmsPropertyData_cmsPropertyType_id] FOREIGN KEY ([propertytypeid]) REFERENCES [cmsPropertyType]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsPropertyData] ADD CONSTRAINT [FK_cmsPropertyData_umbracoNode_id] FOREIGN KEY ([contentNodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsPropertyType] ADD CONSTRAINT [FK_cmsPropertyType_cmsPropertyTypeGroup_id] FOREIGN KEY ([propertyTypeGroupId]) REFERENCES [cmsPropertyTypeGroup]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsPropertyTypeGroup] ADD CONSTRAINT [FK_cmsPropertyTypeGroup_cmsPropertyTypeGroup_id] FOREIGN KEY ([parentGroupId]) REFERENCES [cmsPropertyTypeGroup]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsStylesheet] ADD CONSTRAINT [FK_cmsStylesheet_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsTagRelationship] ADD CONSTRAINT [FK_cmsTagRelationship_cmsTags_id] FOREIGN KEY ([tagId]) REFERENCES [cmsTags]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsTagRelationship] ADD CONSTRAINT [FK_cmsTagRelationship_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsTask] ADD CONSTRAINT [FK_cmsTask_cmsTaskType_id] FOREIGN KEY ([taskTypeId]) REFERENCES [cmsTaskType]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsTask] ADD CONSTRAINT [FK_cmsTask_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsTask] ADD CONSTRAINT [FK_cmsTask_umbracoUser] FOREIGN KEY ([parentUserId]) REFERENCES [umbracoUser]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsTask] ADD CONSTRAINT [FK_cmsTask_umbracoUser1] FOREIGN KEY ([userId]) REFERENCES [umbracoUser]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsTemplate] ADD CONSTRAINT [FK_cmsTemplate_cmsTemplate] FOREIGN KEY ([master]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [cmsTemplate] ADD CONSTRAINT [FK_cmsTemplate_umbracoNode] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoDomains] ADD CONSTRAINT [FK_umbracoDomains_umbracoNode_id] FOREIGN KEY ([domainRootStructureID]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoNode] ADD CONSTRAINT [FK_umbracoNode_umbracoNode_id] FOREIGN KEY ([parentID]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoRelation] ADD CONSTRAINT [FK_umbracoRelation_umbracoNode] FOREIGN KEY ([parentId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoRelation] ADD CONSTRAINT [FK_umbracoRelation_umbracoNode1] FOREIGN KEY ([childId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoRelation] ADD CONSTRAINT [FK_umbracoRelation_umbracoRelationType_id] FOREIGN KEY ([relType]) REFERENCES [umbracoRelationType]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUser] ADD CONSTRAINT [FK_umbracoUser_umbracoUserType_id] FOREIGN KEY ([userType]) REFERENCES [umbracoUserType]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUser2app] ADD CONSTRAINT [FK_umbracoUser2app_umbracoUser_id] FOREIGN KEY ([user]) REFERENCES [umbracoUser]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUser2NodeNotify] ADD CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUser2NodeNotify] ADD CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoUser_id] FOREIGN KEY ([userId]) REFERENCES [umbracoUser]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUser2NodePermission] ADD CONSTRAINT [FK_umbracoUser2NodePermission_umbracoNode_id] FOREIGN KEY ([nodeId]) REFERENCES [umbracoNode]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO
ALTER TABLE [umbracoUser2NodePermission] ADD CONSTRAINT [FK_umbracoUser2NodePermission_umbracoUser_id] FOREIGN KEY ([userId]) REFERENCES [umbracoUser]([id]) ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

