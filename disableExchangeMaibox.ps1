#Requires -Version 5.0
#Requires -Modules AzureAD, MSOnline, ExchangeOnlineManagement

Remove-Module *

Import-Module MSOnline
Import-Module ExchangeOnlineManagement
Import-Module .\modules\Authenticate.psm1
Import-Module .\modules\LicenseOption.psm1
Import-Module .\modules\Exchange.psm1




$Account0 = "julien.nivet@ensea.fr"
$Account1 = "nils.garcia@ensea.fr"
$Account2 = "ludovic.desraux@ensea.fr"
$Account3 = "fabrice.duval@ensea.fr"
$Account4 = "abdoulwahab.cisse@ensea.fr"

Connect-ExchangeOnline-NoPrompt
EnableForwardToRenater -Account $Account0
EnableForwardToRenater -Account $Account1
EnableForwardToRenater -Account $Account2
EnableForwardToRenater -Account $Account3
EnableForwardToRenater -Account $Account4
Disconnect-ExchangeOnline

## New-Msoluser -userPrincipalName $args[2] -displayname $args[3] -firstname $args[4] -lastname $args[5] -password $args[6] -usagelocation "us" -LicenseAssignment $args[7]
