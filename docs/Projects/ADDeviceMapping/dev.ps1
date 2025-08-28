#requires -modules ActiveDirectory

# Requires the ActiveDirectory module
Import-Module ActiveDirectory

Get-ADComputer -LDAPFilter '(managedBy=*)' -Properties Name, ManagedBy #|
#    Select-Object @{n='Computer';e={$_.Name}}, @{n='PrimaryUser';e={(Get-ADUser -Identity $_.ManagedBy).DisplayName}}

# Get-ADComputer -LDAPFilter 'ManagedBy -like "*"' -Properties ManagedBy |
#     Select-Object @{n='Computer';e={$_.Name}},
#                   @{n='PrimaryUser';e={(Get-ADUser -Identity $_.ManagedBy).DisplayName}} |
#     Export-Csv -Path "C:\Reports\DeviceOwners.csv" -NoTypeInformation




# Example: assign user ‘jdoe’ as the owner of computer ‘PC-1001’
Set-ADComputer -Identity "LP588" -ManagedBy "mellunigm" 
Set-ADComputer -Identity "LP1000" -ManagedBy "soldatekf" 
