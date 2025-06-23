function Get-ModuleDependencies {
    [CmdletBinding(DefaultParameterSetName="LoadedFunction")]
    Param (
        [Parameter(
            Mandatory=$False,
            ParameterSetName="LoadedFunction"
        )]
        [string]$NameOfLoadedFunction,

        [Parameter(
            Mandatory=$False,
            ParameterSetName="ScriptFile"    
        )]
        [string]$PathToScriptFile,

        [Parameter(Mandatory=$False)]
        [string[]]$ExplicitlyNeededModules
    )

    if ($NameOfLoadedFunction) {
        $LoadedFunctions = Get-ChildItem Function:\
        if ($LoadedFunctions.Name -notcontains $NameOfLoadedFunction) {
            Write-Error "The function '$NameOfLoadedFunction' is not currently loaded! Halting!"
            $Global:FunctionResult = "1"
            return
        }

        $FunctionOrScriptContent = Invoke-Expression $('${Function:' + $NameOfLoadedFunction + '}.Ast.Extent.Text')
    }

    if ($PathToScriptFile) {
        if (!$(Test-Path $PathToScriptFile)) {
            Write-Error "Unable to find path '$PathToScriptFile'! Halting!"
            $global:FunctionResult = "1"
            return
        }

        $FunctionOrScriptContent = Get-Content $PathToScriptFile
    }

    
    $ExplicitlyDefinedFunctionsInThisFunction = [Management.Automation.Language.Parser]::ParseInput($FunctionOrScriptContent, [ref]$null, [ref]$null).EndBlock.Statements.FindAll(
        [Func[Management.Automation.Language.Ast,bool]]{$args[0] -is [Management.Automation.Language.FunctionDefinitionAst]},
        $false
    ).Name
    

    # All Potential PSModulePaths
    $AllWindowsPSModulePaths = @(
        "C:\Program Files\WindowsPowerShell\Modules"
        "$HOME\Documents\WindowsPowerShell\Modules"
        "$HOME\Documents\PowerShell\Modules"
        "C:\Program Files\PowerShell\Modules"
        "C:\Windows\System32\WindowsPowerShell\v1.0\Modules"
        "C:\Windows\SysWOW64\WindowsPowerShell\v1.0\Modules"
    )

    $AllModuleManifestFileItems = foreach ($ModPath in $AllWindowsPSModulePaths) {
        if (Test-Path $ModPath) {
            Get-ChildItem -Path $ModPath -Recurse -File -Filter "*.psd1"
        }
    }

    $ModInfoFromManifests = foreach ($ManFileItem in $AllModuleManifestFileItems) {
        try {
            $ModManifestData = Import-PowerShellDataFile $ManFileItem.FullName -ErrorAction Stop
        }
        catch {
            continue
        }

        $Functions = $ModManifestData.FunctionsToExport | Where-Object {
            ![System.String]::IsNullOrWhiteSpace($_) -and $_ -ne '*'
        }
        $Cmdlets = $ModManifestData.CmdletsToExport | Where-Object {
            ![System.String]::IsNullOrWhiteSpace($_) -and $_ -ne '*'
        }

        @{
            ModuleName          = $ManFileItem.BaseName
            ManifestFileItem    = $ManFileItem
            ModuleManifestData  = $ModManifestData
            ExportedCommands    = $Functions + $Cmdlets
        }
    }
    $ModInfoFromGetCommand = Get-Command -CommandType Cmdlet,Function,Workflow

    $CurrentlyLoadedModuleNames = $(Get-Module).Name

    [System.Collections.ArrayList]$AutoFunctionsInfo = @()

    foreach ($ModInfoObj in $ModInfoFromManifests) {
        if ($AutoFunctionsInfo.ManifestFileItem -notcontains $ModInfoObj.ManifestFileItem) {
            $PSObj = [pscustomobject]@{
                ModuleName          = $ModInfoObj.ModuleName
                ManifestFileItem    = $ModInfoObj.ManifestFileItem
                ExportedCommands    = $ModInfoObj.ExportedCommands
            }
            
            if ($NameOfLoadedFunction) {
                if ($PSObj.ModuleName -ne $NameOfLoadedFunction -and
                $CurrentlyLoadedModuleNames -notcontains $PSObj.ModuleName
                ) {
                    $null = $AutoFunctionsInfo.Add($PSObj)
                }
            }
            if ($PathToScriptFile) {
                $ScriptFileItem = Get-Item $PathToScriptFile
                if ($PSObj.ModuleName -ne $ScriptFileItem.BaseName -and
                $CurrentlyLoadedModuleNames -notcontains $PSObj.ModuleName
                ) {
                    $null = $AutoFunctionsInfo.Add($PSObj)
                }
            }
        }
    }

    foreach ($ModInfoObj in $ModInfoFromGetCommand) {
        $PSObj = [pscustomobject]@{
            ModuleName          = $ModInfoObj.ModuleName
            ExportedCommands    = $ModInfoObj.Name
        }

        if ($NameOfLoadedFunction) {
            if ($PSObj.ModuleName -ne $NameOfLoadedFunction -and
            $CurrentlyLoadedModuleNames -notcontains $PSObj.ModuleName
            ) {
                $null = $AutoFunctionsInfo.Add($PSObj)
            }
        }
        if ($PathToScriptFile) {
            $ScriptFileItem = Get-Item $PathToScriptFile
            if ($PSObj.ModuleName -ne $ScriptFileItem.BaseName -and
            $CurrentlyLoadedModuleNames -notcontains $PSObj.ModuleName
            ) {
                $null = $AutoFunctionsInfo.Add($PSObj)
            }
        }
    }
    
    $AutoFunctionsInfo = $AutoFunctionsInfo | Where-Object {
        ![string]::IsNullOrWhiteSpace($_) -and
        $null -ne $_.ManifestFileItem
    }

    $FunctionRegex = "([a-zA-Z]|[0-9])+-([a-zA-Z]|[0-9])+"
    $LinesWithFunctions = $($FunctionOrScriptContent -split "`n") -match $FunctionRegex | Where-Object {![bool]$($_ -match "[\s]+#")}
    $FinalFunctionList = $($LinesWithFunctions | Select-String -Pattern $FunctionRegex -AllMatches).Matches.Value | Sort-Object | Get-Unique
    
    [System.Collections.ArrayList]$NeededWinPSModules = @()
    [System.Collections.ArrayList]$NeededPSCoreModules = @()

    foreach ($ModObj in $AutoFunctionsInfo) {
        foreach ($Func in $FinalFunctionList) {
            if ($ModObj.ExportedCommands -contains $Func -or $ExplicitlyNeededModules -contains $ModObj.ModuleName) {
                if ($ModObj.ManifestFileItem.FullName -match "\\WindowsPowerShell\\") {
                    if ($NeededWinPSModules.ManifestFileItem.FullName -notcontains $ModObj.ManifestFileItem.FullName -and
                    $ModObj.ModuleName -notmatch "\.WinModule") {
                        $PSObj = [pscustomobject]@{
                            ModuleName          = $ModObj.ModuleName
                            ManifestFileItem    = $ModObj.ManifestFileItem
                        }
                        $null = $NeededWinPSModules.Add($PSObj)
                    }
                }
                elseif ($ModObj.ManifestFileItem.FullName -match "\\PowerShell\\") {
                    if ($NeededPSCoreModules.ManifestFileItem.FullName -notcontains $ModObj.ManifestFileItem.FullName -and
                    $ModObj.ModuleName -notmatch "\.WinModule") {
                        $PSObj = [pscustomobject]@{
                            ModuleName          = $ModObj.ModuleName
                            ManifestFileItem    = $ModObj.ManifestFileItem
                        }
                        $null = $NeededPSCoreModules.Add($PSObj)
                    }
                }
                elseif ($PSVersionTable.PSEdition -eq "Core") {
                    if ($NeededPSCoreModules.ModuleName -notcontains $ModObj.ModuleName -and
                    $ModObj.ModuleName -notmatch "\.WinModule") {
                        $PSObj = [pscustomobject]@{
                            ModuleName          = $ModObj.ModuleName
                            ManifestFileItem    = $null
                        }
                        $null = $NeededPSCoreModules.Add($PSObj)
                    }
                }
                else {
                    if ($NeededWinPSModules.ModuleName -notcontains $ModObj.ModuleName) {
                        $PSObj = [pscustomobject]@{
                            ModuleName          = $ModObj.ModuleName
                            ManifestFileItem    = $null
                        }
                        $null = $NeededWinPSModules.Add($PSObj)
                    }
                }
            }
        }
    }

    [System.Collections.ArrayList]$WinPSModuleDependencies = @()
    [System.Collections.ArrayList]$PSCoreModuleDependencies = @()
    $($NeededWinPSModules | Where-Object {![string]::IsNullOrWhiteSpace($_.ModuleName)}) | ForEach-Object {
        $null = $WinPSModuleDependencies.Add($_)
    }
    $($NeededPSCoreModules | Where-Object {![string]::IsNullOrWhiteSpace($_.ModuleName)}) | ForEach-Object {
        $null = $PSCoreModuleDependencies.Add($_)
    }

    [pscustomobject]@{
        WinPSModuleDependencies     = $WinPSModuleDependencies
        PSCoreModuleDependencies    = $PSCoreModuleDependencies
    }
}
