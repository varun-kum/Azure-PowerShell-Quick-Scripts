$Subscription= '<SubscriptionID Here>'
$context = Get-AzSubscription -SubscriptionId $Subscription
Set-AzContext $context

$sqlcc = new-object ('System.Data.SqlClient.SqlConnection') "Data Source='AzureDB-sqlserver.database.windows.net';Initial Catalog=AzureDB;Persist Security Info=True;User ID='<user>';Password='<Password>'"
$sc = new-object ('Microsoft.SqlServer.Management.Common.ServerConnection') $sqlcc
$srv = new-object ('Microsoft.SqlServer.Management.Smo.Server') $sc
$db = $srv.Databases["AzureDB"]
$tableAzResource = $db.Tables["AzureResources"]

# Delete the existing data from table
 Invoke-Sqlcmd -Query "Delete from AzureResources" -ConnectionString "Data Source='AzureDB-sqlserver.database.windows.net';Initial Catalog=AzureDB;Persist Security Info=True;User ID='<user>';Password='<Password>'"

(Get-AzResource | Select-Object ResourceID,ResourceName,Type,Location,ResourceGroupName,Kind) | Write-SqlTableData  -InputObject $tableAzResource


