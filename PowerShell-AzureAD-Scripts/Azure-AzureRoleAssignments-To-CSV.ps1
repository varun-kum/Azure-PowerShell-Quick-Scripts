$Subscription= '<SubscriptionID Here>'
$context = Get-AzSubscription -SubscriptionId $Subscription
Set-AzContext $context

(Get-AzRoleAssignment -Scope /subscriptions/$Subscription | Select-Object  RoleAssignmentId,Scope,DisplayName,SignInName,RoleDefinitionName,RoleDefinitionId,ObjectId,ObjectType,CanDelegate,Description) | Export-Csv -Path C:\AzureRoleAssignments.csv -NoTypeInformation
