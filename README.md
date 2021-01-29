# OFFICE365-provisionning

This project provides PowerShell to create automatic tasks to administer Microsoft Office 365 accounts.

## Prerequisites

You need to install some PowerShell modules. To do that, open en PowerShell terminal as Administrator and execute :

Install-Module MSOnline
Install-Module ExchangeOnlineManagement


## deleteMailbox

Removes an ExchangeOnline mailbox but keeps the Azure AD account. Please consider that this change takes a few minutes to be effective.

Usage : powershell.exe .\deleteMaibox.ps1 user@yourdomain.com


