New-StockTickerTool
-------------------

### Synopsis
Creates a new StockTickerTool instance.

---

### Description

The New-StockTickerTool function initializes a new instance of the StockTickerTool. 
It checks for the presence of the 'financialmodelingprep' environment variable, which should contain your API key. 
If the environment variable is not set, the function throws an error.

---

### Examples
> EXAMPLE 1

```PowerShell
New-StockTickerTool
Initializes the StockTickerTool and registers the necessary tools.
```

---

### Notes
Ensure that the 'financialmodelingprep' environment variable is set to your API key before calling this function. 
You can obtain an API key from: https://intelligence.financialmodelingprep.com/developer/docs

---

### Syntax
```PowerShell
New-StockTickerTool [<CommonParameters>]
```
