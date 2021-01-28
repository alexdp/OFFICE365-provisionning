function Enable-Service {
    param($User, $License, $Service)
    If ($License -NotIn $User.Licenses.accountskuid) {
        Write-Output "FATAL : Account $($User.UserPrincipalName) does not have license $License. $Service not enabled";
        return;
    }
    $AccountSKU = Get-MsolAccountSku | where {$_.AccountSkuId -eq $License}
    $AccountSKUServices = $AccountSKU.ServiceStatus.ServicePlan.ServiceName
    $CurrentLicenses = ((($User.licenses | where {$_.AccountSKUID -eq $($AccountSKU.AccountSKUID)}).ServiceStatus | where {$_.ProvisioningStatus -ne "Disabled"}).ServicePlan).ServiceName
    $DisabledPlans = $AccountSKUServices | where {$_ -NotIn $CurrentLicenses -and $_ -ne $Service}
    $LicenseOptions = New-MsolLicenseOptions -AccountSkuId $AccountSku.AccountSkuID -DisabledPlans $DisabledPlans
    IF($User.licenses.accountskuid -contains $($AccountSKU.AccountSKUID)){set-msoluserlicense -UserPrincipalName $User.UserPrincipalName -LicenseOptions $LicenseOptions}
    ELSE{set-msoluserlicense -UserPrincipalName $User.UserPrincipalName -AddLicenses $AccountSku.AccountSkuID -LicenseOptions $LicenseOptions}
    Write-Output "INFO : $Service enabled for $($User.UserPrincipalName)" 
}

function Disable-Service {
    param($User, $License, $Service)
    If ($License -NotIn $User.Licenses.accountskuid) {
        Write-Output "FATAL : Account $($User.UserPrincipalName) does not have license $License. $Service not disabled";
        return;
    }
    $AccountSKU = Get-MsolAccountSku | where {$_.AccountSkuId -eq $License}
    $AccountSKUServices = $AccountSKU.ServiceStatus.ServicePlan.ServiceName
    $CurrentLicenses = ((($User.licenses | where {$_.AccountSKUID -eq $($AccountSKU.AccountSKUID)}).ServiceStatus | where {$_.ProvisioningStatus -ne "Disabled"}).ServicePlan).ServiceName
    $DisabledPlans = $AccountSKUServices | where {$_ -NotIn $CurrentLicenses -or $_ -eq $Service}
    $LicenseOptions = New-MsolLicenseOptions -AccountSkuId $AccountSku.AccountSkuID -DisabledPlans $DisabledPlans
    IF($User.licenses.accountskuid -contains $($AccountSKU.AccountSKUID)){set-msoluserlicense -UserPrincipalName $User.UserPrincipalName -LicenseOptions $LicenseOptions}
    ELSE{set-msoluserlicense -UserPrincipalName $User.UserPrincipalName -AddLicenses $AccountSku.AccountSkuID -LicenseOptions $LicenseOptions}
    Write-Output "INFO : $Service disabled for $($User.UserPrincipalName)"
}
