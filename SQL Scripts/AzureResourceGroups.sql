
CREATE TABLE [dbo].[AzureResourceGroups](
	[ResourceGroupId] [nvarchar](max) NULL,
	[ResourceGroupName] [nvarchar](max) NULL,
	[Location] [nvarchar](50) NULL,
	[ProvisioningState] [nvarchar](50) NULL,
	[ManagedBy] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


