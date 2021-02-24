$username = "xxxx"
$password= convertto-securestring "yyyy" -asplaintext -force

function  Connect-AzureAD-NoPrompt {
    $mycred = new-object -typename System.Management.Automation.PSCredential -argumentlist $username,$password
    $O365Cred = Get-Credential $mycred
    Connect-MsolService -Credential $O365Cred
}

function  Connect-ExchangeOnline-NoPrompt {
    $mycred = new-object -typename System.Management.Automation.PSCredential -argumentlist $username,$password
    $O365Cred = Get-Credential $mycred
    Connect-ExchangeOnline -Credential $O365Cred
}

