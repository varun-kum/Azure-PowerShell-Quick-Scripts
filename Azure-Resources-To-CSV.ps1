$Subscription= '<SubscriptionID Here>'
$context = Get-AzSubscription -SubscriptionId $Subscription
Set-AzContext $context

(Get-AzResource | Select-Object ResourceID,ResourceName,Type,Location,ResourceGroupName,Kind) | Export-Csv -Path C:\AzureResources.csv -NoTypeInformation
