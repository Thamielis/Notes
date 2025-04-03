# Define the parameters for the strategy
$Symbol = "APT-USD"
$quantity = 0.01
$entryPrice = 10000
$stopLoss = 9500
$takeProfit = 11000

# Define the trading endpoint and API key
$endpoint = "https://api.coinbase.com/v2/prices/$symbol/spot"
$apikey = "z4Ci3InNy6cCuQTm"

function Get-CryptoCurrencies {
    param (
        [Parameter()]
        [String] $Symbol = "BTC"
    )

    $Crypto = @{}

    $response = Invoke-WebRequest "https://api.coinbase.com/v2/currencies/crypto"
    $cryptoHash = ConvertFrom-Json $response.Content

    $cryptoHash.data | ForEach-Object {
        $Crypto[$_.Name] = [Ordered]@{
                Symbol    = $_.code
                Color     = $_.color
                sortIndex = $_.sort_index
                AssetID   = $_.asset_id
        }
    }

    return $Crypto
}

# Define a function to retrieve the current price of the symbol
function Get-CurrentPrice {
    [CmdletBinding()]
    param (
        [Parameter()]
        [String[]] $Symbol
    )

    $response = Invoke-WebRequest -Uri $endpoint -Headers @{
        "CB-VERSION"    = "2021-06-19"
        "Authorization" = "Bearer $apikey"
    }
    
    # Convert the response content to a hash table
    $hashTable = ConvertFrom-Json $response.Content
    
    # Access the price in the hash table
    $price = $hashTable.data.amount
    
    return $price
}

# Define a function to execute a trade
function Execute-Trade {
    $action = $args[0]
    $price = $args[1]
    $body = @{
        symbol   = $symbol
        quantity = $quantity
        price    = $price
    }
    $json = ConvertTo-Json $body
    $response = Invoke-WebRequest -Uri $endpoint -Method Post -Body $json -Headers @{
        "Authorization" = "Bearer $apikey"
        "Content-Type"  = "application/json"
    }
    Write-Output "$action trade executed at $price"
}

$curPrice = Get-CurrentPrice -Symbol $Symbol

$cryptoData = Get-CryptoCurrencies
$cryptoData

# Monitor the price and execute trades based on the strategy
while ($true) {
    $currentPrice = Get-CurrentPrice
    if ($currentPrice -lt $stopLoss) {
        Execute-Trade "Sell" $stopLoss
        break
    }
    if ($currentPrice -gt $takeProfit) {
        Execute-Trade "Sell" $takeProfit
        break
    }
    Start-Sleep -Seconds 30
}

