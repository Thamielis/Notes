Überblick
---------

> TIPP - Zu diesem Artikel gibt es von mir das passende YouTube-Video: "[Wie kann ich mit PowerShell eine grafische Benutzeroberfläche erstellen?](https://www.youtube.com/watch?v=qd7Avm7rdMU&feature=youtu.be)"

Die PowerShell und ihre Cmdlets werden über Tastatur-Befehle gesteuert und benutzbar gemacht. Dieser Umstand ist aber nicht immer für den Endbenutzer oder z.B. dem Helpdesk praktikabel. **Intuitiver sind grafische Benutzeroberflächen** ([Graphical User Interface](https://de.wikipedia.org/wiki/Grafische_Benutzeroberfl%C3%A4che), kurz GUI). Eine GUI ist ein Windows-Fenster das als **Schnittstelle zwischen Mensch und Computer** vermittelt.

Über [.NET](https://de.wikipedia.org/wiki/.NET) können auf verschiedene Arten GUIs designet und programmiert werden. Hierzu gehören u.a. **Web-Interfaces** via .ASPX, **WinForm** oder **[WPF](https://de.wikipedia.org/wiki/Windows_Presentation_Foundation)** um moderne Fenster für Windows-System zu erzeugen. Diese Technologien setzten jedoch entsprechendes Wissen voraus. Komplexe Werkzeuge wie Visual Studio wollen bedient werden. Letztendlich muss so ein GUI-Programmcode für das Zielsystem in eine .EXE-Datei kompiliert werden.

PowerShell hat vollen Zugriff auf .NET und so können auch **Windows-Fenster (WPF) mit PowerShell-Skripting erzeugt** werden. Eine Windows-GUI-Variante die gut zur PowerShell passt ist WPF. Das Layout kann dabei ähnlich einer HTML-Datei über den XML-Dialekt [**XAML**](https://de.wikipedia.org/wiki/Extensible_Application_Markup_Language) erstellt werden.

Die **kostenlose** Entwicklungsumgebung [Visual Studio Express](https://visualstudio.microsoft.com/de/vs/express/) bietet die Möglichkeit das Layout in einem grafischen [**WYSIWYG-Editor**](https://de.wikipedia.org/wiki/WYSIWYG) zu erstellen. Der eigentliche Programmcode wird später über ein PowerShell-Script gelöst.

> TIPP - In einem GUI-Projekt wird man mit vielen unterschiedlichen Objekten konfrontiert. Daher sollte man beim Analysieren von Objekten sattelfest sein. Zum Thema Objekt-Analyse können Sie meinen Artikel: "[PowerShell-Objekte in 3 Schritten erfolgreich analysieren](https://attilakrick.com/powershell/powershell-objekt-analyse/)" lesen.

\[mla\_gallery link='file' size="medium" category='powershell' tag='gui' mla\_alt\_shortcode=gallery mla\_alt\_ids\_name=include\]

Das folgende Beispiel erlärt schrittweise die Erstellung eine GUI für das Cmdlet `AKPT\Get-EuroExchange` aus meinem PowerShell Module `AKPT`. Dieses Beispiel ist autark lauffähig da der Code für `Get-EuroExchange` unter 5. implementiert wurde. Daher ist ein Installieren und Importieren des Moduls `AKPT` nicht nötig.

Ziel dieses Beispiels ist es die folgende Benutzerinteraktion nicht über die Shell zu realisieren.

```
# Übersicht aller möglichen Wechselkurse:
AKPT\Get-EuroExchange -ListCurrency

# Umrechnung von 100 EUR in JPY:
AKPT\Get-EuroExchange -Currency 'JPY' -Euros 100
```

 ![[images/PowerShell-WPF-GUI-Beispiel-Shell.png]]

Sondern soll die Benutzerinteraktion mit dem Cmdlet über die folgende GUI stattfinden.

 ![[images/PowerShell-WPF-GUI-Beispiel-Window.png]]

1\. Module und Namensräume importieren
--------------------------------------

Zuerst **benötigte Module** importieren die nicht standardmäßig mit PowerShell automatische geladen werden. Dies ist für Dritte hilfreich, um aufzuzeigen welche Module evtl. zuerst installiert werden müssen, um das Script erfolgreich ausführen zu können.

```
using module Microsoft.PowerShell.Management
using module Microsoft.PowerShell.Utility
```

Jetzt werden Namespaces bekannt gemacht die im weiteren Script-Verlauf oft benötigt werden. So bleibt das Script **schlank**, **übersichtlich**, **lesbar** und der Tippaufwand minimal.

```
using namespace System.Management.Automation
using namespace System.PresentationFramework
using namespace System.Windows.Markup
```

2\. Laufzeitverhalten des Scripts festlegen
-------------------------------------------

**Im Fehlerfall** sollte das Script an der auftretenden Exception stoppen. Nach Ablauf des Skriptes sollte die Action-Preference wieder auf ihren ursprünglichen Wert zurückgesetzt werde.

```
$ErrorActionPreferenceBackup = $ErrorActionPreference
$ErrorActionPreference = [ActionPreference]::Stop
```

Um u. a. Tippfehler bei Variablennamen zu vermeiden, muss die Zuweisung vor der ersten Verwendung erfolgen. Siehe auch `Get-Help Set-StrictMode -Online`.

```
Set-StrictMode -Version 'Latest'
```

3\. Assemblies laden
--------------------

Nicht jedes .NET Assembly wird in der PowerShell unmittelbar benötigt. Daher wird nur eine handvoll Assemblies automatische geladen und die restlichen **Assemblies müssen bei Bedarf manuell geladen werden**. Dazu gehört auch der WPF-Teil (`PresentationFramework`\-Assembly) aus .NET:

```
Add-Type -AssemblyName 'PresentationFramework'
```

4\. Funktionen, Cmdlets und Ereignis-Routinen implementieren
------------------------------------------------------------

Da das Cmdlet `Get-EuroExchange` den PowerShell-Anteil des aktuellen Beispiels dar stellt, benötigen wir dieses Cmdlet im `function:`\-Laufwerk. Denkbar wäre auch ein automatischer Aufruf, wenn das Module `AKPT` installiert wäre, in dem sich dieses Cmdlet auch befindet.

```
function Get-EuroExchange {
    [CmdletBinding(DefaultParameterSetName = 'Calculate')]
    param (
        [Parameter(ParameterSetName = "Calculate", Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidateSet('AUD', 'BGN', 'BRL', 'CAD', 'CHF', 'CNY', 'CZK', 'DKK', 'GBP', 'HKD', 'HRK', 'HUF', 'IDR', 'ILS', 'INR', 'ISK', 'JPY', 'KRW', 'MXN', 'MYR', 'NOK', 'NZD', 'PHP', 'PLN', 'RON', 'RUB', 'SEK', 'SGD', 'THB', 'TRY', 'USD', 'ZAR')]
        [Alias("Währung")]
        [string]$Currency,

        [Parameter(ParameterSetName = "Calculate", ValueFromPipelineByPropertyName = $true)]
        [ValidateRange(0.0001, 2147483647)]
        [Alias("Euronen")]
        [decimal]$Euros = 1,

        [Parameter(ParameterSetName = "Overview", Mandatory=$true)]
        [switch]$ListCurrency
    )
    begin {
        [datetime]$StartTime = Get-Date

        #region Update local cache and read it

        # ! Build Cachefile:
        [string]$EuroExchangeCacheFile = Join-Path -Path ([System.IO.Path]::GetTempPath()) -ChildPath 'EcbEuroExchangeCache.xml'

        # ! Exist Cachefile read timestamp:
        [timespan]$ECBCacheDifferenceSpan = New-TimeSpan -Hours 999
        if ((Test-Path -Path $EuroExchangeCacheFile)) {
            'ECB-EuroExchange-Cache-File found!' | Write-Verbose
            [xml]$EuroExchangeContent = Get-Content -Path $EuroExchangeCacheFile
            [datetime]$EuroExchangeTime = $EuroExchangeContent.Envelope.Cube.Cube | Select-Object -ExpandProperty 'time'
            [timespan]$ECBCacheDifferenceSpan = (Get-Date) - $EuroExchangeTime
        }

        # ! Is Cache-Difference-TimeSpan greater 39h than update from ECB:
        if($ECBCacheDifferenceSpan.TotalHours -ge 39) {
            'The ECB-EuroExchange-Cache-File is updated because the file was not found or is older than 39 hours.' | Write-Verbose
            Invoke-WebRequest -Uri "http://www.ecb.europa.eu/stats/eurofxref/eurofxref-daily.xml" | Select-Object -ExpandProperty Content | Set-Content -Path $EuroExchangeCacheFile -Force
        }

        # ! Read Cachefile for the next stapes:
        [xml]$EuroExchangeContent = Get-Content -Path $EuroExchangeCacheFile
        $EuroExchangeCubes = $EuroExchangeContent.Envelope.Cube.Cube.Cube
        "ECB-EuroExchange-Cache-File from $($EuroExchangeContent.Envelope.Cube.Cube | Select-Object -ExpandProperty 'time') read it." | Write-Verbose

        #endregion

        switch ($PSCmdlet.ParameterSetName) {
            'Overview' {
                'Get-EuroExchange works in Overview-Mode.' | Write-Verbose
                $EuroExchangeCubes | ForEach-Object -Process { [PSCustomObject]@{ Currency = $_.currency } } | Sort-Object -Property 'Currency'
            }
            'Calculate' {
                'Get-EuroExchange works in Calculate-Mode.' | Write-Verbose
            }
        }
    }
    process {
        if($PSCmdlet.ParameterSetName -eq 'Calculate') {
            [decimal]$CurrencyRate = $EuroExchangeCubes | Where-Object -Property 'currency' -EQ -Value $Currency | Select-Object -ExpandProperty 'rate'
            [PSCustomObject]@{
                Currency    = $Currency.ToUpper()
                Rate        = $CurrencyRate
                Euros       = $Euros
                SumCurrency = $CurrencyRate * $Euros
            }
        }
    }
    end {
        [timespan]$Duration = (Get-Date) - $StartTime
        "Done in $($Duration.TotalMilliseconds) ms!" | Write-Verbose
    }
}
```

Noch einmal zur Erinnerung würde das Cmdlet ohne GUI wie folgt bedient werden:

```
 # Übersicht aller möglichen Wechselkurse
 Get-EuroExchange -ListCurrency

# Umrechnung von 100 EUR in JPY
Get-EuroExchange -Currency 'JPY' -Euros 100
```

> TIPP - Eine einfache und dennoch wirkungsvolle und nützliche GUI kann auch über `Show-Command` erfolgen.

 ![[images/PowerShell-WPF-GUI-Beispiel-Show-Command.png]]

```
Show-Command -Name 'Get-EuroExchange' -NoCommonParameter -ErrorPopup | Out-GridView -OutputMode Multiple
```

Vor dem Öffnen des WPF-Fensters und vor dem ersten Auslösen eines **WPF-Window-Steuerelement-Events** müssen dessen Routinen deklariert werden. Diese werden im weiteren Verlauf an das Ereignis gebunden wird.

Das Abrufen der aktuellen Rate, die Berechnung für X Euros und die Anzeige dieser Werte übernimmt die folgende Routine. Diese wird jedesmal ausgeführt, wenn sich a) der Euro-Betrag ändert oder b) aus der ComboBox eine andere Währung ausgewählt wurde.

```
function EuroRateCalculate([string]$Currency, [double]$Euros) {
    try {
        # Berechnung:
        $Result = Get-EuroExchange -Currency $Currency -Euros $Euros
        [double]$Rate        = $Result.Rate
        [double]$SumCurrency = $Result.SumCurrency
    }
    catch {
        # NaN im Fehlerfall, z.B. ungültiger Euro-Betrag oder das Ergebnis der Multiplikation (Rate * Euro) ist zu groß.
        [double]$Rate        = [double]::NaN
        [double]$SumCurrency = [double]::NaN
    }
    # Ausgabe:
    $Script:My.RateControl.Text  = "{0:#,##0.0000} {1}" -f $Rate       , $Currency
    $Script:My.SummeControl.Text = "{0:#,##0.0000} {1}" -f $SumCurrency, $Currency
}
```

5\. WPF Fenster (GUI) erzeugen
------------------------------

Nun gilt es endlich das WPF-`Window` zu materialisieren.

> TIPP - Die folgende XAML-WPF-Window-Struktur lässt sich am einfachsten mittels Visual Studio Express in dessen Designer erzeugen und bearbeiten. Wer mit Visual Studio Express nicht so bewandert ist, denn könnte das folgendes Handout helfen. > [Handout zur Visual Studio-Bedienung, um WPF-Fenster zu erstellen](https://attilakrick.com/media/VisualStudio-WPFWindow-Handout.pdf).

```
# Sammel-Objekt als Container für die diversen Unterobjekte die im weiteren Verlauf benötigt werden.
# Ein Synchronized-HashTable ist Thread-Sicher und kann Thread-Übergreifend genutzt werden.
$Script:My = [HashTable]::Synchronized(@{})

# XAML-WPF-Window-Struktur
$Script:My.WindowXaml = @'
<Window
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    Title="€ CALCULATOR"
    Width="336"
    Height="220"
    FontFamily="Consolas"
    FontSize="14"
    WindowStartupLocation="CenterScreen">
    <Viewbox
        Margin="15"
        Stretch="Uniform"
        StretchDirection="Both">
        <Grid>
            <Grid.ColumnDefinitions>
                <ColumnDefinition />
                <ColumnDefinition />
            </Grid.ColumnDefinitions>
            <Grid.RowDefinitions>
                <RowDefinition Height="AUTO" />
                <RowDefinition MinHeight="10" />
                <RowDefinition MinHeight="40" />
                <RowDefinition MinHeight="40" />
                <RowDefinition MinHeight="40" />
            </Grid.RowDefinitions>
            <ComboBox
                x:Name="WährungenControl"
                Grid.Row="0"
                Grid.Column="0"
                VerticalAlignment="Top"
                HorizontalContentAlignment="Center"
                FontSize="20"
                SelectedValue="USD" />
            <TextBlock
                Grid.Row="0"
                Grid.Column="1"
                Margin="10,0,0,0"
                VerticalAlignment="Center">
                Währungssymbol
            </TextBlock>
            <TextBox
                x:Name="RateControl"
                Grid.Row="2"
                Grid.Column="0"
                VerticalAlignment="Center"
                FontWeight="Bold"
                IsReadOnly="True"
                TextAlignment="Right" />
            <TextBlock
                Grid.Row="2"
                Grid.Column="1"
                Margin="10,0,0,0"
                VerticalAlignment="Center"
                FontWeight="Bold">
                Rate
            </TextBlock>
            <TextBox
                x:Name="EurosControl"
                Grid.Row="3"
                Grid.Column="0"
                VerticalAlignment="Center"
                TextAlignment="Right" />
            <TextBlock
                Grid.Row="3"
                Grid.Column="1"
                Margin="10,0,0,0"
                VerticalAlignment="Center">
                € (EUR)
            </TextBlock>
            <TextBox
                x:Name="SummeControl"
                Grid.Row="4"
                Grid.Column="0"
                MinWidth="195"
                VerticalAlignment="Center"
                FontWeight="Bold"
                IsReadOnly="True"
                TextAlignment="Right" />
            <TextBlock
                Grid.Row="4"
                Grid.Column="1"
                Margin="10,0,0,0"
                VerticalAlignment="Center"
                FontWeight="Bold">
                SUMME = Rate * €
            </TextBlock>
        </Grid>
    </Viewbox>
</Window>
'@

# Das Window-Objekt wird über die XAML-Struktur materialisiert:
$Script:My.Window = [XamlReader]::Parse($Script:My.WindowXaml)

# Aus dem Window-Objekt werden die benötigten Steuerelemente über das Attribute X:Name lokalisiert und referenziert:
$Script:My.WährungenControl = $Script:My.Window.FindName('WährungenControl')
$Script:My.RateControl      = $Script:My.Window.FindName('RateControl')
$Script:My.EurosControl     = $Script:My.Window.FindName('EurosControl')
$Script:My.SummeControl     = $Script:My.Window.FindName('SummeControl')

# Die ComboBox erhält ihre Werte die später vom Benutzer ausgewählt werden können:
Get-EuroExchange -ListCurrency | ForEach-Object -Process { $Script:My.WährungenControl.Items.Add($_.Currency) | Out-Null }

# Die ComboBox stößt die Berechnung der Ausgabe (s.o. EuroRateCalculate) an, wenn die Benutzer-Auswahl (SelectionChanged-Event) wechselt:
$Script:My.WährungenControl.Add_SelectionChanged({ EuroRateCalculate -Currency $Script:My.WährungenControl.SelectedItem -Euros $Script:My.EurosControl.Text })

# Das erste Element der ComboBox wird programmatisch ausgewählt:
$Script:My.WährungenControl.SelectedIndex = 0

# Die TextBox stößt die Berechnung der Ausgabe (s.o. EuroRateCalculate) an, wenn der Euro-Text sich ändert (TextChanged):
$Script:My.EurosControl.Add_TextChanged({ EuroRateCalculate -Currency $Script:My.WährungenControl.SelectedItem -Euros $Script:My.EurosControl.Text })

# In der TextBox wird der Default-Wert auf 1 Euro gesetzt:
$Script:My.EurosControl.Text = '1'

# Das WPF-Window wird obenauf angezeigt:
$Script:My.Window.Topmost = $true
$Script:My.Window.ShowDialog() | Out-Null
```

> TIPP - Ermitteln welche Events zur Verfügung stehen:

```
# $Script:My.WährungenControl | Get-Member -MemberType 'Event'
```

> TIPP - Eine Beschreibung des jeweiligen Steuerelements (Methods, Properties, Events, etc.) finden Sie im Internet über den vollständigen TypeName. Zum Beispiel per [Google](https://www.google.de/search?q=System.Windows.Controls.ComboBox) oder direkt in der [Microsoft Dokumentation](https://docs.microsoft.com/de-de/dotnet/api/system.windows.controls.combobox?view=netcore-3.1).

6\. Aufräumen und keine Spuren hinterlassen
-------------------------------------------

```
Remove-Variable -Name 'My' -Force
Remove-Item -Path 'function:\EuroRateCalculate', 'function:\Get-EuroExchange' -Force
Set-StrictMode -Off
$ErrorActionPreference = $ErrorActionPreferenceBackup
Remove-Module -Name 'Microsoft.PowerShell.Management', 'Microsoft.PowerShell.Utility' -Force
```

> TIPP - Egal was Sie vorhaben bleibt im Grunde der Ablauf gleich. Bedenken Sie jedoch das das Wissen über WPF und OOP nicht unerheblich ist und einen großen Teil ausmacht. Daher planen Sie für Ihr erstes Projekt ausreichend Zeit ein. Gerne unterstütze ich ([info@attilakrick.com](mailto:info@attilakrick.com)) Sie dabei.

PowerShell Quiz
---------------

Testen Sie Ihr PowerShell Wissen. Jedes Quiz ist kostenlos, erfolgt anonym, die Auswertung erfolgt im Anschluss und zu Gewinnen gibt es Stolz und Ehre.

*   [PowerShell Quiz zum Thema (Benutzer-)Eingabe](https://attilakrick.com/schlagwort/powershell-benutzer-eingabe/)
*   [PowerShell Quiz zum Thema Daten Ausgabe](https://attilakrick.com/schlagwort/powershell-daten-ausgabe/)
*   [Übersicht aller PowerShell Quizze](https://attilakrick.com/powershell/powershell-wissenstest/)

Epilog
------

Hier noch einmal der gesamte PowerShell-Code ohne viel bla bla zum kopieren.

```
using module Microsoft.PowerShell.Management
using module Microsoft.PowerShell.Utility

using namespace System.Management.Automation
using namespace System.PresentationFramework
using namespace System.Windows.Markup

$ErrorActionPreferenceBackup = $ErrorActionPreference
$ErrorActionPreference = [ActionPreference]::Stop
Set-StrictMode -Version 'Latest'

Add-Type -AssemblyName 'PresentationFramework'

function Get-EuroExchange {
    [CmdletBinding(DefaultParameterSetName = 'Calculate')]
    param (
        [Parameter(ParameterSetName = "Calculate", Mandatory = $true, ValueFromPipeline = $true, ValueFromPipelineByPropertyName = $true)]
        [ValidateSet('AUD', 'BGN', 'BRL', 'CAD', 'CHF', 'CNY', 'CZK', 'DKK', 'GBP', 'HKD', 'HRK', 'HUF', 'IDR', 'ILS', 'INR', 'ISK', 'JPY', 'KRW', 'MXN', 'MYR', 'NOK', 'NZD', 'PHP', 'PLN', 'RON', 'RUB', 'SEK', 'SGD', 'THB', 'TRY', 'USD', 'ZAR')]
        [Alias("Währung")]
        [string]$Currency,

        [Parameter(ParameterSetName = "Calculate", ValueFromPipelineByPropertyName = $true)]
        [ValidateRange(0.0001, 2147483647)]
        [Alias("Euronen")]
        [decimal]$Euros = 1,

        [Parameter(ParameterSetName = "Overview", Mandatory=$true)]
        [switch]$ListCurrency
    )
    begin {
        [datetime]$StartTime = Get-Date

        # ! Build Cachefile:
        [string]$EuroExchangeCacheFile = Join-Path -Path ([System.IO.Path]::GetTempPath()) -ChildPath 'EcbEuroExchangeCache.xml'

        # ! Exist Cachefile read timestamp:
        [timespan]$ECBCacheDifferenceSpan = New-TimeSpan -Hours 999
        if ((Test-Path -Path $EuroExchangeCacheFile)) {
            'ECB-EuroExchange-Cache-File found!' | Write-Verbose
            [xml]$EuroExchangeContent = Get-Content -Path $EuroExchangeCacheFile
            [datetime]$EuroExchangeTime = $EuroExchangeContent.Envelope.Cube.Cube | Select-Object -ExpandProperty 'time'
            [timespan]$ECBCacheDifferenceSpan = (Get-Date) - $EuroExchangeTime
        }

        # ! Is Cache-Difference-TimeSpan greater 39h than update from ECB:
        if($ECBCacheDifferenceSpan.TotalHours -ge 39) {
            'The ECB-EuroExchange-Cache-File is updated because the file was not found or is older than 39 hours.' | Write-Verbose
            Invoke-WebRequest -Uri "http://www.ecb.europa.eu/stats/eurofxref/eurofxref-daily.xml" | Select-Object -ExpandProperty Content | Set-Content -Path $EuroExchangeCacheFile -Force
        }

        # ! Read Cachefile for the next stapes:
        [xml]$EuroExchangeContent = Get-Content -Path $EuroExchangeCacheFile
        $EuroExchangeCubes = $EuroExchangeContent.Envelope.Cube.Cube.Cube
        "ECB-EuroExchange-Cache-File from $($EuroExchangeContent.Envelope.Cube.Cube | Select-Object -ExpandProperty 'time') read it." | Write-Verbose

        switch ($PSCmdlet.ParameterSetName) {
            'Overview' {
                'Get-EuroExchange works in Overview-Mode.' | Write-Verbose
                $EuroExchangeCubes | ForEach-Object -Process { [PSCustomObject]@{ Currency = $_.currency } } | Sort-Object -Property 'Currency'
            }
            'Calculate' {
                'Get-EuroExchange works in Calculate-Mode.' | Write-Verbose
            }
        }
    }
    process {
        if($PSCmdlet.ParameterSetName -eq 'Calculate') {
            [decimal]$CurrencyRate = $EuroExchangeCubes | Where-Object -Property 'currency' -EQ -Value $Currency | Select-Object -ExpandProperty 'rate'
            [PSCustomObject]@{
                Currency    = $Currency.ToUpper()
                Rate        = $CurrencyRate
                Euros       = $Euros
                SumCurrency = $CurrencyRate * $Euros
            }
        }
    }
    end {
        [timespan]$Duration = (Get-Date) - $StartTime
        "Done in $($Duration.TotalMilliseconds) ms!" | Write-Verbose
    }
}

function EuroRateCalculate([string]$Currency, [double]$Euros) {
    try {
        $Result = Get-EuroExchange -Currency $Currency -Euros $Euros
        [double]$Rate        = $Result.Rate
        [double]$SumCurrency = $Result.SumCurrency
    }
    catch {
        [double]$Rate        = [double]::NaN
        [double]$SumCurrency = [double]::NaN
    }
    $Script:My.RateControl.Text  = "{0:#,##0.0000} {1}" -f $Rate       , $Currency
    $Script:My.SummeControl.Text = "{0:#,##0.0000} {1}" -f $SumCurrency, $Currency
}

$Script:My = [HashTable]::Synchronized(@{})
$Script:My.WindowXaml = @'
<Window
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
    Title="€ CALCULATOR"
    Width="336"
    Height="220"
    FontFamily="Consolas"
    FontSize="14"
    WindowStartupLocation="CenterScreen">
    <Viewbox
        Margin="15"
        Stretch="Uniform"
        StretchDirection="Both">
        <Grid>
            <Grid.ColumnDefinitions>
                <ColumnDefinition />
                <ColumnDefinition />
            </Grid.ColumnDefinitions>
            <Grid.RowDefinitions>
                <RowDefinition Height="AUTO" />
                <RowDefinition MinHeight="10" />
                <RowDefinition MinHeight="40" />
                <RowDefinition MinHeight="40" />
                <RowDefinition MinHeight="40" />
            </Grid.RowDefinitions>
            <ComboBox
                x:Name="WährungenControl"
                Grid.Row="0"
                Grid.Column="0"
                VerticalAlignment="Top"
                HorizontalContentAlignment="Center"
                FontSize="20"
                SelectedValue="USD" />
            <TextBlock
                Grid.Row="0"
                Grid.Column="1"
                Margin="10,0,0,0"
                VerticalAlignment="Center">
                Währungssymbol
            </TextBlock>
            <TextBox
                x:Name="RateControl"
                Grid.Row="2"
                Grid.Column="0"
                VerticalAlignment="Center"
                FontWeight="Bold"
                IsReadOnly="True"
                TextAlignment="Right" />
            <TextBlock
                Grid.Row="2"
                Grid.Column="1"
                Margin="10,0,0,0"
                VerticalAlignment="Center"
                FontWeight="Bold">
                Rate
            </TextBlock>
            <TextBox
                x:Name="EurosControl"
                Grid.Row="3"
                Grid.Column="0"
                VerticalAlignment="Center"
                TextAlignment="Right" />
            <TextBlock
                Grid.Row="3"
                Grid.Column="1"
                Margin="10,0,0,0"
                VerticalAlignment="Center">
                € (EUR)
            </TextBlock>
            <TextBox
                x:Name="SummeControl"
                Grid.Row="4"
                Grid.Column="0"
                MinWidth="195"
                VerticalAlignment="Center"
                FontWeight="Bold"
                IsReadOnly="True"
                TextAlignment="Right" />
            <TextBlock
                Grid.Row="4"
                Grid.Column="1"
                Margin="10,0,0,0"
                VerticalAlignment="Center"
                FontWeight="Bold">
                SUMME = Rate * €
            </TextBlock>
        </Grid>
    </Viewbox>
</Window>
'@

$Script:My.Window = [XamlReader]::Parse($Script:My.WindowXaml)

$Script:My.WährungenControl = $Script:My.Window.FindName('WährungenControl')
$Script:My.RateControl      = $Script:My.Window.FindName('RateControl')
$Script:My.EurosControl     = $Script:My.Window.FindName('EurosControl')
$Script:My.SummeControl     = $Script:My.Window.FindName('SummeControl')

Get-EuroExchange -ListCurrency | ForEach-Object -Process { $Script:My.WährungenControl.Items.Add($_.Currency) | Out-Null }
$Script:My.WährungenControl.Add_SelectionChanged({ EuroRateCalculate -Currency $Script:My.WährungenControl.SelectedItem -Euros $Script:My.EurosControl.Text })
$Script:My.WährungenControl.SelectedIndex = 0
$Script:My.EurosControl.Add_TextChanged({ EuroRateCalculate -Currency $Script:My.WährungenControl.SelectedItem -Euros $Script:My.EurosControl.Text })
$Script:My.EurosControl.Text = '1'
$Script:My.Window.Topmost = $true
$Script:My.Window.ShowDialog() | Out-Null

Remove-Variable -Name 'My' -Force
Remove-Item -Path 'function:\EuroRateCalculate', 'function:\Get-EuroExchange' -Force
Set-StrictMode -Off
$ErrorActionPreference = $ErrorActionPreferenceBackup
Remove-Module -Name 'Microsoft.PowerShell.Management', 'Microsoft.PowerShell.Utility' -Force
```

Bitte bewerten Sie diesen Artikel
---------------------------------

\[site\_reviews\_form category="121" assign\_to="65" id="kc7stc4o" hide="title,content,name,email,terms"\]

***