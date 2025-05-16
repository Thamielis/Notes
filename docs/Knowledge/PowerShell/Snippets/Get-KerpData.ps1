

$kerpuri = "http://kerpweb/api/Employee/getAllEmployeeStates"

$filter = "?filter=Mellunig"
$test = "?requireTotalCount=true&sort=%5B%7B%22selector%22%3A%22firstNameAndLastName%22%2C%22desc%22%3Afalse%7D%5D&filter=%5B%5B%22costCenterIsActive%22%2C%22%3D%22%2Ctrue%5D%2C%22and%22%2C%5B%22costCenterAllowEmployeeSearch%22%2C%22%3D%22%2Ctrue%5D%2C%22and%22%2C%5B%22locationIsActive%22%2C%22%3D%22%2Ctrue%5D%5D&_=1675234417718"
$search = "?searchExpr=LastName=Mellunig"
<#
$response = Invoke-RestMethod -Uri "$($kerpuri)$($test)"

$response = Invoke-WebRequest -Uri $kerpuri -Headers @{
    "CB-VERSION"    = "2021-06-19"
    "Authorization" = "Bearer $apikey"
}

$response
#>
$session = New-Object Microsoft.PowerShell.Commands.WebRequestSession
$session.UserAgent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36"
$session.Cookies.Add((New-Object System.Net.Cookie("kerpweb", "29753610.1.1048013392.4200472064", "/", "kerpweb")))

$RequParams = @{
    UseBasicParsing = $True
    Uri             = "$($kerpuri)$($search)"
    WebSession      = $session
    Headers         = @{
        "Accept"           = "application/json, text/javascript, */*; q=0.01"
        "Accept-Encoding"  = "gzip, deflate"
        "Accept-Language"  = "de-DE,de;q=0.9,en-US;q=0.8,en;q=0.7"
        "Language"         = "de"
        "Referer"          = "http://kerpweb/stm/EmployeeView"
        "X-Requested-With" = "XMLHttpRequest"
    }
}

$response = Invoke-WebRequest @RequParams

$response
