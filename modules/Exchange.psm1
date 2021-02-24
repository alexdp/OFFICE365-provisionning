function Enable-Exchange-License {
    param($Account)
    $User = Get-MSOLUser -UserPrincipalName $Account
    
    If ("enseafr:STANDARDWOFFPACK_FACULTY" -In $User.Licenses.accountskuid) {
        Enable-Service -User $User -License "enseafr:STANDARDWOFFPACK_FACULTY" -Service "EXCHANGE_S_STANDARD"
    }
    
    If ("enseafr:STANDARDWOFFPACK_STUDENT" -In $User.Licenses.accountskuid) {
        Enable-Service -User $User -License "enseafr:STANDARDWOFFPACK_STUDENT" -Service "EXCHANGE_S_STANDARD"
    }
}


function Disable-Exchange-License {
    param($Account)
    $User = Get-MSOLUser -UserPrincipalName $Account
    
    If ("enseafr:STANDARDWOFFPACK_FACULTY" -In $User.Licenses.accountskuid) {
        Disable-Service -User $User -License "enseafr:STANDARDWOFFPACK_FACULTY" -Service "EXCHANGE_S_STANDARD"
    }
    
    If ("enseafr:STANDARDWOFFPACK_STUDENT" -In $User.Licenses.accountskuid) {
        Disable-Service -User $User -License "enseafr:STANDARDWOFFPACK_STUDENT" -Service "EXCHANGE_S_STANDARD"
    }
}


function EnableForwardToRenater {
    param($Account)
    
    $Mailbox = Get-Mailbox -Identity $Account

    if ($null -eq $Mailbox) {
        Write-Output "Exchange Online mailbox not found for $Account"
        return
    }

    $UserPrincipalName = $Mailbox.UserPrincipalName
    $UserPrincipalName = $UserPrincipalName.ToLower()
    if (-not $UserPrincipalName.EndsWith("@ensea.fr")) {
        Write-Output "Cannot set forward on an Exchange mailbox for $Account because the user principal name on this account doesn't contain @ensea.fr" 
        return
    }

    $ForwardEmailAlias = $UserPrincipalName.Replace("@ensea.fr", "+onrenater@ensea.fr")
    Set-Mailbox -Identity $Account -ForwardingSmtpAddress $ForwardEmailAlias -DeliverToMailboxAndForward $false
    Write-Output "Exchange Online mailbox for $Account updated with automatic forward to Renater"
}
