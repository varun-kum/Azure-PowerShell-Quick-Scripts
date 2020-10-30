CREATE TABLE [dbo].[AzureResources](
	[ResourceID] [nvarchar](max) NULL,
	[ResourceName] [nvarchar](max) NULL,
	[Type] [nvarchar](500) NOT NULL,
	[Location] [nvarchar](50) NULL,
	[ResourceGroupName] [nvarchar](max) NOT NULL,
	[Kind] [nvarchar](500) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


