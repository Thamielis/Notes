Today’s script will not be directly connected with Microsoft stuff, but it will show you how to get cryptocurrencies price using PowerShell.

Cryptocurrencies every year become more popular and in my humble opinion will enter the mainstream very soon.  
I thought it can be very handfull for cryptotraders who are interesting in PowerShell to have function which will get cryptocurrencies price.  
Base on this script more experienced scripters can build script which will trade for them 🙂

##### How it works?

Function is very simple. It connects to [coinmarketcap.com](http://coinmarketcap.com/) API and gather a list of all available cryptocurrencies.  
In next step, script is filtering all cryptos array to search for one provided by the user in the function.  
Example of usage below:

<table><tbody><tr><td><p>1</p></td><td><div><p><code>Get-CryptoPrice</code> <code>-CryptoName</code> <code>Bitcoin</code></p></div></td></tr></tbody></table>

##### Script:

<table><tbody><tr><td><p>1</p><p>2</p><p>3</p><p>4</p><p>5</p><p>6</p><p>7</p><p>8</p><p>9</p><p>10</p><p>11</p><p>12</p><p>13</p><p>14</p><p>15</p><p>16</p><p>17</p><p>18</p><p>19</p><p>20</p><p>21</p><p>22</p><p>23</p><p>24</p><p>25</p><p>26</p><p>27</p><p>28</p><p>29</p><p>30</p><p>31</p></td><td><div><p><code>Function</code> <code>Get-CryptoPrice</code> <code>{</code></p><p><code>[</code><code>CmdletBinding</code><code>()]</code></p><p><code>param</code></p><p><code>(</code></p><p><code>[</code><code>Parameter</code><code>(</code><code>Position</code><code>=0, </code><code>Mandatory</code> <code>= </code><code>$true</code><code>, </code><code>HelpMessage</code><code>=</code><code>"Cryptocurrency full name"</code><code>, </code><code>ValueFromPipeline</code> <code>= </code><code>$false</code><code>)]</code></p><p><code>$CryptoName</code></p><p><code>)</code></p><p><code>Try</code></p><p><code>{</code></p><p><code>}</code></p><p><code>Catch</code></p><p><code>{</code></p><p><code>$Exception</code> <code>= </code><code>$_</code><code>.Exception.Message</code></p><p><code>Write-Error</code> <code>"Can not connect to coinmarketcap.com API. Following error occured: $Exception"</code></p><p><code>break</code></p><p><code>}</code></p><p><code>$Crypto</code> <code>= </code><code>$AllCryptosArray</code> <code>| </code><code>Where-Object</code> <code>Name </code><code>-eq</code> <code>$CryptoName</code></p><p><code>If</code><code>(</code><code>$Crypto</code><code>.Count </code><code>-eq</code> <code>0)</code></p><p><code>{</code></p><p><code>Write-Output</code> <code>"There is no $CryptoName coin listed on coinmarketcap.com!"</code></p><p><code>}</code></p><p><code>Else</code></p><p><code>{</code></p><p><code>$Crypto</code> <code>| </code><code>Format-Table</code> <code>-AutoSize</code></p><p><code>}</code></p><p><code>}</code></p></div></td></tr></tbody></table>

##### Result:

[![](Get%20cryptocurrencies%20price%20using%20PowerShell%20-%20Powershellbros.com/Cryptocurrencies_price.png)](https://i0.wp.com/www.powershellbros.com/wp-content/uploads/2018/01/Cryptocurrencies_price.png)

I hope it will be usefull for some of you 😉  
Enjoy!