Connect-AzAccount
$Subscription= '<SubscriptionID>'
$context = Get-AzSubscription -SubscriptionId $Subscription
Set-AzContext $context

Connect-AzureAD

 Get-AzWebApp -ResourceGroupName "<RG_NAME>" |  Export-Csv -Path "C:\AppServices.csv" -NoTypeInformation