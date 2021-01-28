#Requires -Version 5.0
#Requires -Modules AzureAD, MSOnline, ExchangeOnlineManagement

Import-Module MSOnline
Import-Module ExchangeOnlineManagement
Import-Module .\modules\Authenticate.psm1
Import-Module .\modules\LicenseOption.psm1
Import-Module .\modules\Exchange.psm1




$Account = "violetuml@ensea.fr"

Connect-AzureAD-NoPrompt
Connect-ExchangeOnline-NoPrompt
Disable-Exchange -Account $Account
Set-User $Account -PermanentlyClearPreviousMailboxInfo -Confirm:$false


## New-Msoluser -userPrincipalName $args[2] -displayname $args[3] -firstname $args[4] -lastname $args[5] -password $args[6] -usagelocation "us" -LicenseAssignment $args[7]
