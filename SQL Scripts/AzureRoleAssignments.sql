

CREATE TABLE [dbo].[AzureRoleAssignments](
	[RoleAssignmentId] [nvarchar](max) NULL,
	[Scope] [nvarchar](max) NULL,
	[DisplayName] [nvarchar](500) NULL,
	[SignInName] [nvarchar](500) NULL,
	[RoleDefinitionName] [nvarchar](500) NULL,
	[RoleDefinitionId] [nvarchar](500) NULL,
	[ObjectId] [nvarchar](500) NULL,
	[ObjectType] [nvarchar](100) NULL,
	[CanDelegate] [nvarchar](20) NULL,
	[Description] [nvarchar](500) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


