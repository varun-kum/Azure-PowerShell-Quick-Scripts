Connect-AzAccount
$Subscription= '<SubscriptionID>'
$context = Get-AzSubscription -SubscriptionId $Subscription
Set-AzContext $context

Connect-AzureAD

$list = Get-AzResource -ResourceType Microsoft.Web/sites