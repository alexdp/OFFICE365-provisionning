# OFFICE365-provisionning

This project provides PowerShell to create automatic tasks to administer Microsoft Office 365 accounts.

## Prerequisites

You need to install some PowerShell modules and allow script execution. To do that, open en PowerShell terminal as Administrator and execute :

Install-Module MSOnline
Install-Module ExchangeOnlineManagement

Set-ExecutionPolicy RemoteSigned 

## deleteMailbox

Removes an ExchangeOnline mailbox but keeps the Azure AD account. Please consider that this change takes a few minutes to be effective.

Usage : powershell.exe .\deleteMaibox.ps1 user@yourdomain.com

## TIPS

When you execute a comand such as deleteMailbox, if you encounter an authentication error (Bad username or password), try to execute it with Administrator roles.
