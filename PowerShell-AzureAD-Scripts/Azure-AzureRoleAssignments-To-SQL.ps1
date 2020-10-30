$Subscription= '<SubscriptionID Here>'
$context = Get-AzSubscription -SubscriptionId $Subscription
Set-AzContext $context

$sqlcc = new-object ('System.Data.SqlClient.SqlConnection') "Data Source='dev-dashboardpoc-sqlserver.database.windows.net';Initial Catalog=DashboardPOCDB;Persist Security Info=True;User ID='<user>';Password='<password>'"
$sc = new-object ('Microsoft.SqlServer.Management.Common.ServerConnection') $sqlcc
$srv = new-object ('Microsoft.SqlServer.Management.Smo.Server') $sc
$db = $srv.Databases["AzureDB"]
$tableAzRoleAssignment = $db.Tables["AzureRoleAssignments"]

# Delete the existing data from table
 Invoke-Sqlcmd -Query "Delete from AzureRoleAssignments" -ConnectionString "Data Source='AzureDB-sqlserver.database.windows.net';Initial Catalog=AzureDB;Persist Security Info=True;User ID='<user>';Password='<Password>'"

(Get-AzRoleAssignment -Scope /subscriptions/$Subscription | Select-Object  RoleAssignmentId,Scope,DisplayName,SignInName,RoleDefinitionName,RoleDefinitionId,ObjectId,ObjectType,CanDelegate,Description) | Write-SqlTableData  -InputObject $tableAzRoleAssignment
