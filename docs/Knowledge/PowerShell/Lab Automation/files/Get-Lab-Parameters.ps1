
function Get-Lab-Parameters {
    Param (
        [String]$jsonConfig = "lab-parameters.json"
    )

    $jsonFilePresent = Test-Path -Path $($PSScriptRoot+"\"+$jsonConfig)
    If ($jsonFilePresent) { 
        $paramJSON = ( Get-Content -Raw $($PSScriptRoot+"\"+$jsonConfig) ) | ConvertFrom-Json 
    }

    $templates = $paramJSON.templates
    $isoGeneration = $paramJSON.isoGeneration
    $vsphereData = $paramJSON.vsphereData
    
}