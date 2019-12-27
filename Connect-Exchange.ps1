function Connect-OnPremExchange {
    # https://docs.microsoft.com/en-us/powershell/exchange/exchange-server/connect-to-exchange-servers-using-remote-powershell?view=exchange-ps
    $E2K10Cred = Get-Credential
    $E2K10Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri http://blah.blahblahblah.com/PowerShell/ -Authentication Kerberos -Credential $E2K10Cred
    Import-PSSession $E2K10Session -DisableNameChecking

    # Remove-PSSession $E2K10Session
}

function Connect-ExchangeOnline {
    # https://docs.microsoft.com/en-us/powershell/exchange/exchange-online/connect-to-exchange-online-powershell/connect-to-exchange-online-powershell?view=exchange-ps

    $EOCred = Get-Credential
    $EOSession = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $EOCred -Authentication Basic -AllowRedirection
    Import-PSSession $EOSession -DisableNameChecking
    # Connect to Azure AD for your O365 subscription (Each new PS Session)
    Connect-MsolService -Credential $EOCred
    Connect-AzureAD -Credential $EOCred
    # Connect-AZAccount

    # Remove-PSSession $EOSession
}

Connect-ExchangeOnline

# https://docs.microsoft.com/en-us/office365/enterprise/powershell/connect-to-office-365-powershell
# Install required software (Once per PC)
# https://go.microsoft.com/fwlink/p/?LinkId=286152

# Install older Microsoft Azure Active Directory Module for Windows PowerShell (Once per PC)
# https://docs.microsoft.com/en-us/powershell/azure/active-directory/install-msonlinev1?view=azureadps-1.0
# Install-Module MSOnline

# Install newer Azure Active Directory PowerShell for Graph (Once per PC)
# https://docs.microsoft.com/en-us/powershell/azure/active-directory/install-adv2?view=azureadps-2.0
# Install-Module AzureAD

