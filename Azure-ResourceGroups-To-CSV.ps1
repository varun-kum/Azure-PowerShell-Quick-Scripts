$Subscription= '<SubscriptionID Here>'
$context = Get-AzSubscription -SubscriptionId $Subscription
Set-AzContext $context

(Get-AzResourceGroup | Select-Object ResourceId,ResourceGroupName,Location,ProvisioningState,ManagedBy) | Export-Csv -Path C:\AzureResourceGroups.csv -NoTypeInformation

