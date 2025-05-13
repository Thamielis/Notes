function Get-eMailStatus {
    [CmdletBinding()]
    param (
        [Parameter()]
        [String] $Country,
        $AllEmployees
    )

    $InSageCountry = $AllEmployees | Where-Object { $null -ne $_.Sage -and $_.Sage.Country -eq $Country } | Sort-Object Name

    $InAD = $AllEmployees | Where-Object { $null -ne $_.AD } | Sort-Object Name
    $InADCountry = $InAD | Where-Object { $_.Sage.Country -eq $Country }

    $MissingInAD = $AllEmployees | Where-Object { $null -eq $_.AD } | Sort-Object Name
    $MissingInADCountry = $MissingInAD | Where-Object { $_.Sage.Country -eq $Country }

    $CountryEmployees = $AllEmployees | Where-Object { $_.Sage.Country -eq $Country } | Sort-Object Name
    $NoeMailAD = $InADCountry | Where-Object { $null -eq $_.AD.mail }

    $NoeMailorNotInAD = @()
    $NoeMailorNotInAD += $MissingInADCountry
    $NoeMailorNotInAD += $NoeMailAD
    
    $ADSageDiff = $InADCountry | ForEach-Object {
        if ($_.Sage.eMail -ne '' -and $null -ne $_.AD.mail) {
            if ($_.AD.mail.ToLower() -ne $_.Sage.eMail.ToLower()) {
                $_
            }
        }
    }

    [PSCustomObject]@{
        Employees        = [PSCustomObject]@{
            InSage      = $InSageCountry
            InAD        = $InADCountry
            MissingInAD = $MissingInADCountry
        }
        eMailSage        = $CountryEmployees | Where-Object { $_.Sage.eMail -ne '' }
        NoEmailSage      = $CountryEmployees | Where-Object { $_.Sage.eMail -eq '' }
        eMailAD          = $CountryEmployees | Where-Object { $null -ne $_.AD.mail }
        NoEmailAD        = $NoeMailAD #$CountryEmployees | Where-Object { $null -eq $_.AD.mail }
        NotInAD          = $MissingInADCountry
        NoeMailorNotInAD = $NoeMailorNotInAD
        ADSageDiff       = $ADSageDiff
    }
}
