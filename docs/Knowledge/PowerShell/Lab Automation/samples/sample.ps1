#Define the file name we will look for
$jsonConfig = "lab-parameters.json"

#Test for the file being present
$jsonFilePresent = Test-Path -path $($PSScriptRoot+"\"+$jsonConfig)

#Read file into a variable called labJSON
If ($jsonFilePresent) { $labJSON = (Get-Content -Raw $($PSScriptRoot+"\"+$jsonConfig)) | ConvertFrom-Json }

#Assign a subsection of the variable to another variable
$templates = $labJSON.templates

#Operate on a specific value
ping $templates.masterIaas.gateway

#or
ping $labJSON.templates.masterIaas.gateway

#Write some value to the screen (note the parenthesis and extra $ sign)
Write-Host "I found the value $($labJSON.templates.masteriaas.machinename) in your file"
