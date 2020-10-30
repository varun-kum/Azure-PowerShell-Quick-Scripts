$Subscription= '<SubscriptionID Here>'
$context = Get-AzSubscription -SubscriptionId $Subscription
Set-AzContext $context

$list = Get-AzureADGroup -SearchString "<Filter>" 
$Output = foreach ($item in $list)
 {
     Get-AzureADGroupMember -ObjectId $item.ObjectId | Select-Object @{name="ResourceGroupName";expression={$item.DisplayName}}, @{name="ResourceGroupObjectID";expression={$item.ObjectId}},ObjectId,ObjectType,AccountEnabled,Department,DisplayName,Mail,MailNickName
 }
$Output |  Export-Csv -Path D:\AzureADUsersGroups.csv -NoTypeInformation