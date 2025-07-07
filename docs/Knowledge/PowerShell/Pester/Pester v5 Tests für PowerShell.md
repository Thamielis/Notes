# Erstellen von Pester v5 Tests für die PowerShell-Modulentwicklung

- [Erstellen von Pester v5 Tests für die PowerShell-Modulentwicklung](#erstellen-von-pester-v5-tests-für-die-powershell-modulentwicklung)
  - [Einführung](#einführung)
  - [Mocks in Pester v5](#mocks-in-pester-v5)
  - [Isolierung des Dateisystems mit TestDrive](#isolierung-des-dateisystems-mit-testdrive)
  - [Datengetriebene Tests mit TestCases](#datengetriebene-tests-mit-testcases)
  - [Code-Coverage-Analyse](#code-coverage-analyse)
  - [Dynamische und bedingte Testlogik](#dynamische-und-bedingte-testlogik)
  - [Integration von Pester in CI/CD-Pipelines](#integration-von-pester-in-cicd-pipelines)
  - [Fortgeschrittene dynamische Testbeispiele für reale Szenarien](#fortgeschrittene-dynamische-testbeispiele-für-reale-szenarien)
    - [Tests für Systemadministrations-Tools](#tests-für-systemadministrations-tools)
    - [Tests für Cloud-Automatisierungsskripte](#tests-für-cloud-automatisierungsskripte)
    - [Tests von REST-API-Wrappern](#tests-von-rest-api-wrappern)
    - [Zusammenfassung](#zusammenfassung)

## Einführung

Pester ist das de-facto Testframework für PowerShell und bietet eine umfassende Sammlung von Werkzeugen, um Unit-Tests für Skripte und Module zu schreiben. Pester v5 brachte wesentliche Verbesserungen (z. B. getrennte Discovery- und Run-Phasen, neues Konfigurationssystem), um Zuverlässigkeit und Flexibilität zu erhöhen. Für die Modulentwicklung ermöglicht Pester, Funktionen isoliert zu validieren, externe Abhängigkeiten zu mocken und sicherzustellen, dass der Code in verschiedenen Szenarien erwartungsgemäß funktioniert. Es nutzt eine behavior-driven Entwicklungssyntax (BDD) mit `Describe`- und `It`-Blöcken und lässt sich nahtlos in CI-Systeme integrieren, um automatisierte Tests auszuführen und Berichte zu erzeugen.

*Beispiel: Pester-Testausgabe, die entdeckte Tests und Ergebnisse zeigt. Pester v5 führt Tests in zwei Phasen (Discovery und Run) aus und gibt eine Zusammenfassung der bestandenen/fehlgeschlagenen/übersprungenen Tests aus.*

---

## Mocks in Pester v5

Mocking ersetzt reale Abhängigkeiten (Funktionen, Cmdlets, externe Tools) durch Platzhalter, sodass Sie die zu testende Einheit isolieren. In Pester v5 kann man **jeden** PowerShell-Befehl mocken und ein alternatives Verhalten festlegen, z. B. um API-Aufrufe zu simulieren oder Dateisystemaktionen zu verhindern.

- **Kommandoverhalten ersetzen**: Mit `Mock` geben Sie ein Skriptblock (`-MockWith`) an, das anstelle des echten Befehls ausgeführt wird. Etwa um `Invoke-RestMethod` einen Dummy-JSON-Response zurückgeben zu lassen, ohne echten HTTP-Call auszführen zu müssen.
- **Bedingte Mocks**: Über `-ParameterFilter` können Sie das Mock-Verhalten je nach übergebenen Parametern anpassen. Beispiel:

```powershell
  Mock Invoke-RestMethod -MockWith {
      param($Uri)
      if ($Uri -like "*San Francisco*") { return @{ temperature = 75; condition = 'Sunny' } }
      elseif ($Uri -like "*New York*")   { return @{ temperature = 60; condition = 'Cloudy' } }
  }
```

- **Aufrufe verifizieren**: Mit `Should -Invoke` (bzw. `Assert-MockCalled`) prüfen Sie, ob ein Mock wie erwartet aufgerufen wurde – z. B. `Should -Invoke -CommandName Remove-Item -Times 1`, um sicherzustellen, dass `Remove-Item` einmal ausgeführt wurde.
- **Mocks innerhalb von Modulen**: Verwenden Sie `Mock -ModuleName 'IhrModul'`, um interne Aufrufe in einem Modul zu ersetzen, oder `InModuleScope`, um auch private Funktionen zu testen, ohne die Modularchitektur zu ändern.

**Mock-Beispiel:**

```powershell
function Remove-Cache { Remove-Item "$env:TEMP\cache.txt" }

Describe 'Remove-Cache' {
    It 'entfernt die Cache-Datei aus TEMP' {
        Mock -CommandName Remove-Item -MockWith {}    # Leerer Mock
        Remove-Cache
        Should -Invoke -CommandName Remove-Item -Times 1 -Exactly
    }
}
```

Hier ersetzt `Mock` `Remove-Item` durch eine No-Op-Implementierung. `Should -Invoke` bestätigt, dass der Aufruf erfolgt ist, ohne dass wirklich Dateien gelöscht werden.

---

## Isolierung des Dateisystems mit TestDrive

Um Dateisystemoperationen gefahrlos zu testen, bietet Pester das **TestDrive:**-PSDrive – ein temporäres, isoliertes Laufwerk unter `%TEMP%`, das nach dem Testlauf automatisch gelöscht wird. Jeder Testdatei bzw. jedem Container wird ein eigener `TestDrive:` zugeordnet, sodass parallele Tests nicht kollidieren.

**Beispiel:**

```powershell
Describe "Add-Footer" {
    BeforeAll {
        $testPath = "TestDrive:\example.txt"
        Set-Content $testPath -Value "Hello`n"
        Add-Footer $testPath "World"
        $result = Get-Content $testPath
    }
    It "fügt die Fußzeile zur Datei hinzu" {
        (-join $result) | Should -Be "Hello`nWorld"
    }
}
```

Alle Dateizugriffe erfolgen in `TestDrive:`, das Pester nach Beendigung löscht – das reale Dateisystem bleibt unberührt.

> **Hinweis:** Für Registry-Tests bietet Pester analog das `TestRegistry:`-Laufwerk, das ebenfalls in einer temporären `HKCU:\Software\Pester\<GUID>`-Hive gemountet und nach den Tests bereinigt wird.

---

## Datengetriebene Tests mit TestCases

Mit Pester v5 können Sie Tests einmal definieren und mehrfach ausführen, indem Sie **TestCases** bzw. `-ForEach` auf `It`, `Context` oder `Describe` anwenden und Arrays von Hashtabellen übergeben. Jede Hashtabelle wird als separater Testfall ausgeführt und injiziert Variablen in den Testblock.

**Beispiel:**

```powershell
Describe "Get-Emoji" {
    It "gibt <Expected> für <Name> zurück" -ForEach @(
        @{ Name = "cactus";   Expected = "" },
        @{ Name = "giraffe";  Expected = "" },
        @{ Name = "pencil";   Expected = "✏️" }
    ) {
        Get-Emoji -Name $Name | Should -Be $Expected
    }
}
```

Pester erzeugt automatisch drei Tests mit den jeweiligen Namen `Name` und `Expected`, ersetzt Platzhalter in der Beschreibung und liefert für jeden Fall ein getrenntes Ergebnis.

Auf `Describe`/`Context` angewendet, lässt sich eine ganze Testgruppe mehrfach mit unterschiedlichen Parametern ausführen. Über `New-PesterContainer -Data @{ ParamName = Value }` können sogar externe Parameter in Testdateien eingespeist werden, um Tests programmgesteuert zu variieren (z. B. für mehrere Module oder Umgebungen).

---

## Code-Coverage-Analyse

Pester v5 kann messen, wie viel Ihres Moduls durch Tests abgedeckt wird. Die Code-Coverage-Funktion instrumentiert den Code während der Ausführung und erstellt Berichte über ausgeführte Zeilen oder Befehle.

**Aktivierung in der Konfiguration:**

```powershell
$config = New-PesterConfiguration
$config.Run.Path               = "."              # Pfad zu den Tests
$config.CodeCoverage.Enabled   = $true            # Coverage einschalten
# Optional: $config.CodeCoverage.Path = "ModuleName.psm1"  # auf bestimmte Dateien beschränken
Invoke-Pester -Configuration $config
```

Pester gibt standardmäßig einen JaCoCo-XML-Coverage-Report (`coverage.xml`) aus, der von CI-Tools (z. B. Azure Pipelines, Codecov) weiterverarbeitet werden kann. Berichte enthalten typischerweise Angaben wie *„Covered 60% / 75%“*, wobei Letzteres ein konfigurierbarer Schwellenwert ist.

*Abbildung: Beispiel eines Code-Coverage-Zusammenfassungsberichts (JaCoCo) für ein PowerShell-Modul. Der Bericht zeigt den Prozentsatz des durch Tests abgedeckten Codes (z. B. 90,66 % der Zeilen abgedeckt), der aus Pester-Coverage-Daten generiert wurde.*

Mit detaillierter Ausgabe (`-Verbose`) listet Pester auch spezifisch die nicht abgedeckten Zeilen/Befehle auf, sodass Sie Lücken leicht identifizieren und schließen können.

---

## Dynamische und bedingte Testlogik

Pester v5 trennt **Discovery** (Testdefinition) und **Run** (Ausführung). Alle dynamischen Entscheidungen, welche Tests definiert oder übersprungen werden, sollten in der Discovery-Phase stattfinden.

- **Bedingtes Überspringen**: Mit dem Parameter `-Skip:<Bedingung>` an `It`, `Context` oder `Describe` können Sie Tests auf Basis von Umgebungsfaktoren überspringen – etwa plattformspezifisch:

```powershell
  Describe "Windows-only Tests" -Skip:($IsLinux) { … }
```

  Voraussetzung und `-Skip`-Bedingungen werden bei Discovery ausgewertet und führen zu sauber markierten übersprungenen Tests.

- **`BeforeDiscovery`**: Block, um Setup-Code explizit in Discovery-Phase auszuführen (z. B. dynamische Test-Generierung).
- **Programmatische Test-Erzeugung**: Schleifen in einem `Describe` definieren Tests dynamisch; da sie in Discovery laufen, stehen alle `It`-Blöcke vor der Ausführung fest. Beispiel:

```powershell
  BeforeDiscovery { $roles = Get-DefaultRoles }
  Describe "Rollenzuordnungen" {
      foreach ($role in $roles) {
          It "Rolle $role hat Berechtigungen" {
              (Get-PermissionsForRole $role) | Should -Not -Be $null
          }
      }
  }
```

Jede Rolle erzeugt dabei einen eigenen `It`-Test. Achten Sie darauf, Variablen korrekt zu kapseln, damit sie in der Run-Phase verfügbar sind.

---

## Integration von Pester in CI/CD-Pipelines

Pester ist weit verbreitet in Tools wie Azure DevOps, GitHub Actions, Jenkins usw. Die Integration umfasst das Ausführen von Tests und das Sammeln von Testergebnissen sowie Code-Coverage für CI-Berichte.

- **Ausgabeformat für Testergebnisse**: Verwenden Sie `-OutputFormat NUnitXml -OutputFile TestResults.xml`, um ein NUnit-XML zu erzeugen, das CI-Systeme (z. B. Azure Pipelines PublishTestResults) direkt einlesen können.
- **Automatische CI-Formatierung**: Pester erkennt Azure DevOps (`TF_BUILD`) und GitHub Actions (`GITHUB_ACTIONS`) und passt Konsolenausgabe an (`CIFormat=Auto`), sodass Fehler im Build-Dashboard hervorgehoben werden.
- **Code-Coverage in CI**: Die JaCoCo-XML (`coverage.xml`) kann mit **PublishCodeCoverageResults** (Format: JaCoCo) in Azure Pipelines veröffentlicht werden, um Coverage-Berichte im UI anzuzeigen. In GitHub Actions lässt sich das Coverage-XML an Dienste wie Codecov übergeben.

**Pipeline-Beispiel (Azure DevOps):**

1. **Pester installieren**: `Install-Module Pester -Scope CurrentUser`
2. **Tests ausführen**: PowerShell-Step mit `Invoke-Pester -OutputFormat NUnitXml -OutputFile $(Build.SourcesDirectory)\TestResults.xml`
3. **Testergebnisse veröffentlichen**: PublishTestResults\@2 mit `testRunner: NUnit`
4. **Coverage veröffentlichen**: PublishCodeCoverageResults (JaCoCo)

Für GitHub Actions analog: PowerShell-Step, danach `actions/upload-artifact` oder einen speziellen Testreporter verwenden. Pester v5 ist selbst in Azure Pipelines entwickelt, was die Effektivität in CI belegt.

---

## Fortgeschrittene dynamische Testbeispiele für reale Szenarien

### Tests für Systemadministrations-Tools

**Problemstellung:** Module, die Dateien, Dienste oder Registry-Einstellungen verwalten, sollen keine echten Änderungen im Test verursachen.

- **TestDrive für Dateien**:

```powershell
  Describe "Backup-Logs" {
      BeforeEach {
          # Dummy-Logdateien im isolierten TestDrive erzeugen
          New-Item -Path "TestDrive:\Logs" -ItemType Directory | Out-Null
          1..3 | ForEach-Object { "Error $_" | Out-File -FilePath "TestDrive:\Logs\log$_.txt" }
      }
      It "erstellt ein ZIP-Archiv der Logs" {
          Backup-Logs -Source "TestDrive:\Logs" -Destination "TestDrive:\LogsBackup.zip"
          "TestDrive:\LogsBackup.zip" | Should -Exist
      }
  }
```

- **TestRegistry für Registry-Änderungen**:

```powershell
  Describe "Set-Config" -Tag "WindowsOnly" {
      BeforeAll {
          # Temporäre Registry-Hive anlegen
          New-Item -Path TestRegistry:\Settings | Out-Null
      }
      It "speichert Konfiguration in HKCU\Software\MyProduct" {
          Mock New-ItemProperty -ParameterFilter { $Path -like "HKCU:\\Software\\MyProduct*" } -MockWith {
              # Umleitung in TestRegistry:
              $redirect = $Path -replace 'HKCU:\\Software\\MyProduct','TestRegistry:\Settings'
              New-ItemProperty -Path $redirect -Name $Name -Value $Value -Force | Out-Null
          }
          Set-Config -Name 'TestSetting' -Value '123'
          (Get-ItemProperty -Path "TestRegistry:\Settings" -Name 'TestSetting').TestSetting | Should -Be '123'
      }
  }
```

- **Mocking von System-Cmdlets** (z. B. `Stop-Service`, `Set-Service`):

```powershell
  Describe "Stop-And-DisableService" {
      It "stoppt und deaktiviert den Dienst" {
          Mock Stop-Service -Verifiable -ParameterFilter { $Name -eq 'MyService' }
          Mock Set-Service  -Verifiable -ParameterFilter { $Name -eq 'MyService' -and $StartupType -eq 'Disabled' }
          Stop-And-DisableService -Name 'MyService'
          Should -InvokeVerifiable
      }
  }
```

So prüfen Sie, dass Ihre Funktion die erwarteten Systemaufrufe ausführt, ohne das System tatsächlich zu verändern.

---

### Tests für Cloud-Automatisierungsskripte

**Problemstellung:** Cloud-Cmdlets (`Az`, AWS Tools) sind teuer und langsam in Tests.

- **Cloud-Cmdlets mocken**: Mocken Sie `New-AzResourceGroup` oder `New-EC2Instance`, um Dummy-Objekte zurückzugeben. Verifizieren Sie mit `Assert-MockCalled`, dass korrekte Parameter verwendet wurden.
- **Datengetriebene Cloud-Tests**: Nutzen Sie `-ForEach`, um Skripte gegen verschiedene Regionen oder Umgebungen zu testen.
- **Integrationstests kennzeichnen**: Taggen Sie echte Cloud-Tests mit `-Tag Integration` und schließen Sie sie standardmäßig aus (`Invoke-Pester -ExcludeTag Integration`) oder überspringen Sie sie mit `-Skip` ohne gültige API-Keys.

**Beispiel Azure Resource Group:**

```powershell
Describe "New-MyResourceGroup" {
    It "erstellt eine Resource Group mit Namen und Tags" {
        Mock New-AzResourceGroup -ParameterFilter { $Name -eq "UnitTestRG" } -MockWith {
            [PSCustomObject]@{ ResourceGroupName = $Name; Location = $Location; Tags = $Tags }
        }
        $rg = New-MyResourceGroup -Name "UnitTestRG" -Region "westus" -Tags @{Owner="Tester"}
        $rg.ResourceGroupName | Should -Be "UnitTestRG"
        $rg.Tags.Owner       | Should -Be "Tester"
        Assert-MockCalled New-AzResourceGroup -ParameterFilter {
            $Name -eq "UnitTestRG" -and $Location -eq "westus" -and $Tags.Owner -eq "Tester"
        } -Times 1
    }
}
```

---

### Tests von REST-API-Wrappern

**Problemstellung:** Module, die `Invoke-RestMethod` verwenden, sollen HTTP-Calls nicht echt ausführen.

- **Mocking von `Invoke-RestMethod`**:

  ```powershell
  It "gibt geparstes Benutzerprofil zurück" {
      Mock Invoke-RestMethod { return @{ name="Alice"; email="alice@example.com" } }
      $profile = Get-UserProfile -UserId 123
      $profile.Name  | Should -Be "Alice"
      $profile.Email | Should -Be "alice@example.com"
  }
  ```

- **Verifizieren des Endpunkts**:

  ```powershell
  Assert-MockCalled Invoke-RestMethod -ParameterFilter {
      $Uri -eq 'https://api.company.com/v1/users/123' -and $Method -eq 'Get'
  } -Times 1
  ```

- **Fehlerantworten simulieren**: Ein Mock kann `throw (New-Object System.Net.WebException "404 NOT FOUND")` verwenden, um API-Fehler zu testen und sicherzustellen, dass Ihr Code diese korrekt behandelt.

- **Datengetriebene API-Tests**:

  ```powershell
  $cases = @(
      @{ Func = { Get-User 42 };  UriPattern = "*users/42";  Response = @{ id=42; name="Bob" };    ResultName = "Bob" },
      @{ Func = { Get-Order 100 };UriPattern = "*orders/100"; Response = @{ orderId=100; status="Pending" }; ResultStatus = "Pending" }
  )
  It "API-Wrapper liefert korrekte Daten" -ForEach $cases {
      Mock Invoke-RestMethod -MockWith {
          param($Uri)
          if ($Uri -like $UriPattern) { return $Response }
      }
      $result = & $Func
      if ($PSItem.ContainsKey('ResultName'))   { $result.Name   | Should -Be $ResultName }
      if ($PSItem.ContainsKey('ResultStatus')) { $result.Status | Should -Be $ResultStatus }
  }
  ```

---

### Zusammenfassung

Mit Pester v5 können Sie PowerShell-Module umfassend testen:

- **Mocks** isolieren externe Abhängigkeiten und erlauben Verifikationen
- **TestDrive/TestRegistry** sandboxen Dateisystem und Registry
- **Datengetriebene Tests** decken viele Szenarien mit geringem Aufwand ab
- **Code Coverage** zeigt ungetestete Logik auf
- **Dynamische und bedingte Tests** passen sich an Umgebung und Daten an
- **CI/CD-Integration** automatisiert Tests und Berichte in Pipelines

Diese Kombination macht Pester v5 zu einem mächtigen Werkzeug für robuste, zuverlässige PowerShell-Modulentwicklung – von Systemadministration über Cloud-Automatisierung bis hin zu REST-API-Wrappern.
