$Subscription= '<SubscriptionID Here>'
$context = Get-AzSubscription -SubscriptionId $Subscription
Set-AzContext $context

$sqlcc = new-object ('System.Data.SqlClient.SqlConnection') "Data Source='AzureDB-sqlserver.database.windows.net';Initial Catalog=AzureDB;Persist Security Info=True;User ID='<user>';Password='<Password>'"
$sc = new-object ('Microsoft.SqlServer.Management.Common.ServerConnection') $sqlcc
$srv = new-object ('Microsoft.SqlServer.Management.Smo.Server') $sc
$db = $srv.Databases["AzureDB"]
$tableAzResourceGroup = $db.Tables["AzureResourceGroups"]

# Delete the existing data from table
 Invoke-Sqlcmd -Query "SP_DeleteResources" -ConnectionString "Data Source='AzureDB-sqlserver.database.windows.net';Initial Catalog=AzureDB;Persist Security Info=True;User ID='<user>';Password='<Password>'"


(Get-AzResource | Select-Object ResourceID,ResourceName,Type,Location,ResourceGroupName,Kind) | Write-SqlTableData  -InputObject $tableAzResource
(Get-AzResourceGroup | Select-Object ResourceId,ResourceGroupName,Location,ProvisioningState,ManagedBy) | Write-SqlTableData  -InputObject $tableAzResourceGroup
(Get-AzRoleAssignment -Scope /subscriptions/$Subscription | Select-Object  RoleAssignmentId,Scope,DisplayName,SignInName,RoleDefinitionName,RoleDefinitionId,ObjectId,ObjectType,CanDelegate,Description) | Write-SqlTableData  -InputObject $tableAzRoleAssignment

 

