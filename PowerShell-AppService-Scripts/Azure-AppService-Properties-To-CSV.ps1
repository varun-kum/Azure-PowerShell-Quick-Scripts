Connect-AzAccount
$Subscription= 'SubscriptionID'
$context = Get-AzSubscription -SubscriptionId $Subscription
Set-AzContext $context

Connect-AzureAD

$list =  Get-AzWebApp -ResourceGroupName "<RG_NAME>"
$Output = foreach ($item in $list)
 {
    $app=Get-AzureRmResource -ResourceId $item.ResourceId
	$app.Properties.httpsOnly=$true
	$app|Set-AzureRmResource -Force
 }
$Output |  Export-Csv -Path C:\AppServiceProperties.csv -NoTypeInformation