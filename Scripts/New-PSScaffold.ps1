#requires -modules PSScaffold

$ModuleParams = @{
    Name          = 'PSToolbox'
    Description   = 'PowerShell Functions for everyday'
    Path          = 'C:\Users\admmellunigm\GitHub'
    Author        = 'Mario Mellunig'
    BuildPipeline = $true
}

New-PSModule @ModuleParams

