function Enable-Exchange {
    param($Account)
    $User = Get-MSOLUser -UserPrincipalName $Account
    
    If ("enseafr:STANDARDWOFFPACK_FACULTY" -In $User.Licenses.accountskuid) {
        Enable-Service -User $User -License "enseafr:STANDARDWOFFPACK_FACULTY" -Service "EXCHANGE_S_STANDARD"
    }
    
    If ("enseafr:STANDARDWOFFPACK_STUDENT" -In $User.Licenses.accountskuid) {
        Enable-Service -User $User -License "enseafr:STANDARDWOFFPACK_STUDENT" -Service "EXCHANGE_S_STANDARD"
    }
}


function Disable-Exchange {
    param($Account)
    $User = Get-MSOLUser -UserPrincipalName $Account
    
    If ("enseafr:STANDARDWOFFPACK_FACULTY" -In $User.Licenses.accountskuid) {
        Disable-Service -User $User -License "enseafr:STANDARDWOFFPACK_FACULTY" -Service "EXCHANGE_S_STANDARD"
    }
    
    If ("enseafr:STANDARDWOFFPACK_STUDENT" -In $User.Licenses.accountskuid) {
        Disable-Service -User $User -License "enseafr:STANDARDWOFFPACK_STUDENT" -Service "EXCHANGE_S_STANDARD"
    }
}

