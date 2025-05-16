


$header = @"  
<style>
    body{  
        background-color: #ffffff;  
    }  
    h1 {  
        font-family: Verdana, Helvetica, sans-serif;  
        color: black;  
        font-size: 28px;  
    }  
    h2 {  
        font-family: Verdana, Helvetica, sans-serif;  
        color: #000099;  
    }  
    a{  
        font-family: Verdana, Helvetica, sans-serif;  
        color: #000099;  
    }  
    td{  
        font-family: "Verdana", "Helvetica Neue", Helvetica, Arial, sans-sertd;  
        color: rgb(17,1,1);  
    }  
    h4{  
        font-family: "Open Sans", "Helvetica Neue", Helvetica, Arial, sans-serif;  
        color: rgb(17, 1, 1);  
        font-size: small;  
    }  
    iframe{  
        border:none;  
        width:100%;  
        height:100%;  
        display:block;  
    }  
    .marginauto {  
        margin: 10px auto 20px;  
        display: block;  
    }  
    p{  
        font-family: Verdana, Helvetica, sans-serif;  
        color: black;  
    }  
    .center {  
        display: block;  
        margin-left: auto;  
        margin-right: auto;  
        width: 50%;  
    }  
    .styled-table{  
        border-collapse: collapse;  
        margin: 25px 0;  
        font-size: 0.9em;  
        font-family: Verdana, Geneva, Tahoma, sans-serif;  
        min-width: 400px;  
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);  
    }  
    .styled-table thead tr {  
        background-color: #009879;  
        color: #ffffff;  
        text-align: left;  
    }  
    .styled-table th,  
    .styled-table td {  
        padding: 12px 15px;  
    }  
    .styled-table tbody tr {  
        border-bottom: 1px solid #dddddd;  
    }
    
    .styled-table tbody tr:nth-of-type(even) {  
        background-color: #f3f3f3;  
    }
    
    .styled-table tbody tr:last-of-type {  
        border-bottom: 2px solid #009879;  
    }
</style 
"@

function New-Reporter {
    [CmdletBinding()]
    param (
        [Parameter()]
        [String] $ParameterName,
        [Parameter()]
        [String] $location, 
        [Parameter()]
        [String] $length
    )

    $heading = @"
    <br>
    <div>
        <h2>File Name: $File</h2>
        <h3>File Length: $length</h3>
        <h4>File Location: $location</h4>
        <a href='$location'>Click to Open</a>
    </div>
    <br>
"@

    $Global:report += ($heading)
}

function New-Indexer {
    [CmdletBinding()]
    param (
        
    )

    Get-ChildItem $path -File -Recurse -PipelineVariable File | 
        Where-Object { $_.Extension -eq '.html' } |
        ForEach-Object {  
            $stream = try {  
                [IO.FileStream]::new($File.FullName, [IO.FileMode]::Open, [IO.FileAccess]::Read, [IO.FileShare]::Read)  
            }  
            catch {  
                [IO.FileStream]::new($File.FullName, [IO.FileMode]::Open, [IO.FileAccess]::Read, [IO.FileShare]::ReadWrite)  
            }  
            if ($stream) {  
                try {  
                    $location = $File.FullName  
                    $length = $File.Length  
                    New-Reporter $File $location $length  
                }  
                finally {  
                    $stream.Close()  
                }  
            }  
        }  
}

function Invoke-TroubleShootingReport {
    [CmdletBinding()]
    param (
        [Parameter()]
        [String] $Path
    )

    Write-Host "Write Path for the Saved Logs HTML Files (Format: C:\..\)"  
    $Global:path = Read-Host
    
    Write-Host "Write Path for Index Page: "  
    $indexpath = Read-Host
    
    New-Indexer
    
    $outputreport = $indexpath + "Logs_Index.html"
    ConvertTo-Html -Head $header -Body $report -Title LOGS_INDEX | Out-File $outputreport  
}

Invoke-TroubleShootingReport

$Global:report = New-Reporter @()
