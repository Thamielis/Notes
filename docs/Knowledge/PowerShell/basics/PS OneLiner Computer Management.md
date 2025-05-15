---
created: 2022-03-11T13:41:19 (UTC +01:00)
tags: []
source: https://www.der-windows-papst.de/2020/10/09/powershell-one-liners/
author: 
---

# Powershell One-Liners - Der Windows Papst - IT Blog Walter

> ## Excerpt
> Powershell One-Liners. Manage your Computers with Powershell One-Liners. Eine große Sammlung an vielen Powershellbefehlen zur Verwaltung von Servern und Workstation

---
# Credential Provider ausschließen
```powershell
Set-ItemProperty -Path ‘HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System’ -Name ‘ExcludedCredentialProviders’ -Value ‘{cb82ea12-9f71-446d-89e1-8d0924e1256e}’ -ea SilentlyContinue
```

# Dem Benutzer erlauben den Anmeldehintergrund zu ändern  
```powershell
Set-ItemProperty -Path ‘HKLM:\\Software\\Policies\\Microsoft\\Windows\\System’ -Name ‘UseOEMBackground’ -Value 1 -ea SilentlyContinue
```

# Immer auf Netzwerk warten bevor man sich anmelden kann  
```powershell
Set-ItemProperty -Path ‘HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon’ -Name ‘SyncForegroundPolicy’ -Value 1 -ea SilentlyContinue
```

# Standard Anmeldedomäne konfigurieren
```powershell
Set-ItemProperty -Path ‘HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System’ -Name ‘DefaultLogonDomain’ -Value ‘dwp.local’ -ea SilentlyContinue
```

# Dem Benutzer keine Kontodetails bei der Anmeldung anzeigen  
```powershell
Set-ItemProperty -Path ‘HKLM:\\Software\\Policies\\Microsoft\\Windows\\System’ -Name ‘BlockUserFromShowingAccountDetailsOnSignin’ -Value 1 -ea SilentlyContinue
```

# Kein Willkommensbildschirm anzeigen  
```powershell
Set-ItemProperty -Path ‘HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer’ -Name ‘NoWelcomeScreen’ -Value 1 -ea SilentlyContinue
```

# Schneller Benutzerwechsel ausblenden  
```powershell
Set-ItemProperty -Path ‘HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System’ -Name ‘HideFastUserSwitching’ -Value 1 -ea SilentlyContinue
```

# Bildcode bei der Anmeldung (Anmeldeoption) verbieten  
```powershell
Set-ItemProperty -Path ‘HKLM:\\Software\\Policies\\Microsoft\\Windows\\System’ -Name ‘BlockDomainPicturePassword’ -Value 1 -ea SilentlyContinue
```

# Kein Windows Startup Sound abspielen  
```powershell
Set-ItemProperty -Path ‘HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System’ -Name ‘DisableStartupSound’ -Value 1 -ea SilentlyContinue
```

# Den PDC kontaktieren, um das falsche eingegebene Kennwort des Benutzer zu überprüfen  
```powershell
Set-ItemProperty -Path ‘HKLM:\\Software\\Policies\\Microsoft\\Netlogon\\Parameters’ -Name ‘AvoidPdcOnWan’ -Value 0 -ea SilentlyContinue
```

# Verlauf der Zwischenablage nicht speichern  
```powershell
Set-ItemProperty -Path ‘HKLM:\\Software\\Policies\\Microsoft\\Windows\\System’ -Name ‘AllowClipboardHistory’ -Value 0 -ea SilentlyContinue
```

# Die Zwischenablage nicht auf anderen Geräten synchronisieren  
```powershell
Set-ItemProperty -Path ‘HKLM:\\Software\\Policies\\Microsoft\\Windows\\System’ -Name ‘AllowCrossDeviceClipboard’ -Value 0 -ea SilentlyContinue
```

# Die Anmelde PIN des Benutzers nach 90 Tagen ändern  
```powershell
Set-ItemProperty -Path ‘HKLM:\\SOFTWARE\\Policies\\Microsoft\\PassportForWork\\PINComplexity’ -Name ‘Expiration’ -Value 90 -ea SilentlyContinue
```

# Die letzten Anmelde-PINS dürfen nicht benutzt werden  
```powershell
Set-ItemProperty -Path ‘HKLM:\\SOFTWARE\\Policies\\Microsoft\\PassportForWork\\PINComplexity’ -Name ‘History’ -Value 10 -ea SilentlyContinue
```

# Maximale Länge der Anmelde-PIN  
```powershell
Set-ItemProperty -Path ‘HKLM:\\SOFTWARE\\Policies\\Microsoft\\PassportForWork\\PINComplexity’ -Name ‘MaximumPINLength’ -Value 20 -ea SilentlyContinue 
```

# Minimale Länge der Anmelde-PIN  
```powershell
Set-ItemProperty -Path ‘HKLM:\\SOFTWARE\\Policies\\Microsoft\\PassportForWork\\PINComplexity’ -Name ‘MinimumPINLength’ -Value 6 -ea SilentlyContinue
```

# Anmelde-PIN muss Ziffern enthalten  
```powershell
Set-ItemProperty -Path ‘HKLM:\\SOFTWARE\\Policies\\Microsoft\\PassportForWork\\PINComplexity’ -Name ‘Digits’ -Value 1 -ea SilentlyContinue
```

# Anmelde-PIN erwartet Kleinbuchstaben  
```powershell
Set-ItemProperty -Path ‘HKLM:\\SOFTWARE\\Policies\\Microsoft\\PassportForWork\\PINComplexity’ -Name ‘LowercaseLetters’ -Value 1 -ea SilentlyContinue
```

# Anmelde-PIN errwartet Großbuchstaben  
```powershell
Set-ItemProperty -Path ‘HKLM:\\SOFTWARE\\Policies\\Microsoft\\PassportForWork\\PINComplexity’ -Name ‘UppercaseLetters’ -Value 1 -ea SilentlyContinue
```

# Die Anmelde-PIN erwartet Sonderzeichen  
```powershell
Set-ItemProperty -Path ‘HKLM:\\SOFTWARE\\Policies\\Microsoft\\PassportForWork\\PINComplexity’ -Name ‘SpecialCharacters’ -Value 1 -ea SilentlyContinue
```

# Festplatte nach 20 Minuten Inaktivität im Batteriemodus abschalten  
```powershell
Set-ItemProperty -Path ‘HKLM:\\Software\\Policies\\Microsoft\\Power\\PowerSettings\\6738E2C4-E8A5-4A42-B16A-E040E769756E’ -Name ‘DCSettingIndex’ -Value 20 -ea SilentlyContinue
```

# Festplatte nach 20 Minuten Inaktivität abschalten  
```powershell
Set-ItemProperty -Path ‘HKLM:\\Software\\Policies\\Microsoft\\Power\\PowerSettings\\6738E2C4-E8A5-4A42-B16A-E040E769756E’ -Name ‘ACSettingIndex’ -Value 60 -ea SilentlyContinue
```

# Notebook bei kritischem Batteriestand in Hibernate versetzen. Value 3 für Shutdown.  
```powershell
Set-ItemProperty -Path ‘HKLM:\\Software\\Policies\\Microsoft\\Power\\PowerSettings\\637EA02F-BBCB-4015-8E2C-A1C7B9C0B546’ -Name ‘DCSettingIndex’ -Value 2 -ea SilentlyContinue
```

# Meldung bei zu kritischer Batterieleistung 20 Minuten verbleibend  
```powershell
Set-ItemProperty -Path ‘HKLM:\\Software\\Policies\\Microsoft\\Power\\PowerSettings\\9A66D8D7-4FF7-4EF9-B5A2-5A326CA2A469’ -Name ‘DCSettingIndex’ -Value 20 -ea SilentlyContinue
```

# Die Leistung des Computers darf gedrosselt werden  
```powershell
Set-ItemProperty -Path ‘HKLM:\\System\\CurrentControlSet\\Control\\Power\\PowerThrottling’ -Name ‘PowerThrottlingOff’ -Value 0 -ea SilentlyContinue
```

# RPC Endpunkt Zuordnung Authentifizierung einschalten  
```powershell
Set-ItemProperty -Path ‘HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Rpc’ -Name ‘EnableAuthEpResolution’ -Value 1 -ea SilentlyContinue
```

# Powershell-Skripte beim Hochfahren des Computers zuerst ausführen  
```powershell
Set-ItemProperty -Path ‘HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System’ -Name ‘RunComputerPSScriptsFirst’ -Value 1 -ea SilentlyContinue
```

# Powershell-Skripte bei der Anmeldung zuerst ausführen  
```powershell
Set-ItemProperty -Path ‘HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System’ -Name ‘RunUserPSScriptsFirst’ -Value 1 -ea SilentlyContinue
```

# Wartezeit definieren bevor die Gruppenrichtlinien abgearbeitet werden  
```powershell
Set-ItemProperty -Path ‘HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System’ -Name ‘MaxGPOScriptWait’ -Value 600 -ea SilentlyContinue
```

# Server Manager nach dem Anmelden nicht staten  
```powershell
Set-ItemProperty -Path ‘HKLM:\\Software\\Policies\\Microsoft\\Windows\\Server\\ServerManager’ -Name ‘DoNotOpenAtLogon’ -Value 1 -ea SilentlyContinue
```

# Hängende Applikationen automatisch beenden  
```powershell
Set-ItemProperty -Path ‘HKLM:\\Software\\Policies\\Microsoft\\Windows\\System’ -Name ‘AllowBlockingAppsAtShutdown’ -Value 1 -ea SilentlyContinue
```

# Applikationen die das Herunterfahren verhindern beenden  
```powershell
Set-ItemProperty -Path ‘HKLM:\\Software\\Policies\\Microsoft\\Windows\\System’ -Name ‘AllowBlockingAppsAtShutdown’ -Value 0 -ea SilentlyContinue
```

# Wiederherstellung des Systems erlauben  
```powershell
Set-ItemProperty -Path ‘HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\SystemRestore’ -Name ‘DisableSR’ -Value 0 -ea SilentlyContinue
```

# SMART schreibt ein Event falls die Festplatte Probleme aufweist  
```powershell
Set-ItemProperty -Path ‘HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\WDI\\{29689E29-2CE9-4751-B4FC-8EFF5066E3FD}’ -Name ‘DfdAlertTextOverride’ -Value ” -ea SilentlyContinue  
Set-ItemProperty -Path ‘HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\WDI\\{29689E29-2CE9-4751-B4FC-8EFF5066E3FD}’ -Name ‘ScenarioExecutionEnabled’ -Value 1 -ea SilentlyContinue  
Set-ItemProperty -Path ‘HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\WDI\\{29689E29-2CE9-4751-B4FC-8EFF5066E3FD}’ -Name ‘EnabledScenarioExecutionLevel’ -Value 2 -ea SilentlyContinue
```

# Die Gruppe der Administratoren erhält Zugriff auf die Roaming-Profile  
```powershell
Set-ItemProperty -Path ‘HKLM:\\Software\\Policies\\Microsoft\\Windows\\System’ -Name ‘AddAdminGroupToRUP’ -Value 1 -ea SilentlyContinue
```

# Benutzerprofile die länger als 120 Tage nicht benutzte wurden werden gelöscht  
```powershell
Set-ItemProperty -Path ‘HKLM:\\Software\\Policies\\Microsoft\\Windows\\System’ -Name ‘CleanupProfiles’ -Value 120 -ea SilentlyContinue
```

# Verhindern das sich Benutzer mit einem temporären Profil anmelden können  
```powershell
Set-ItemProperty -Path ‘HKLM:\\Software\\Policies\\Microsoft\\Windows\\System’ -Name ‘ProfileErrorAction’ -Value 1 -ea SilentlyContinue
```

# Bitlocker Laufwerksverschlüsselungsmethode AES-XTS  
```powershell
Set-ItemProperty -Path ‘HKLM:\\SOFTWARE\\Policies\\Microsoft\\FVE’ -Name ‘EncryptionMethodWithXtsOs’ -Value 7 -ea SilentlyContinue  
Set-ItemProperty -Path ‘HKLM:\\SOFTWARE\\Policies\\Microsoft\\FVE’ -Name ‘EncryptionMethodWithXtsFdv’ -Value 7 -ea SilentlyContinue  
Set-ItemProperty -Path ‘HKLM:\\SOFTWARE\\Policies\\Microsoft\\FVE’ -Name ‘EncryptionMethodWithXtsRdv’ -Value 7 -ea SilentlyContinue
```

# Bitlocker Wiederherstellungsmethode zur Entschlüsselung für einen Benutzer  
```powershell
Set-ItemProperty -Path ‘HKLM:\\SOFTWARE\\Policies\\Microsoft\\FVE’ -Name ‘UseRecoveryPassword’ -Value 1 -ea SilentlyContinue  
Set-ItemProperty -Path ‘HKLM:\\SOFTWARE\\Policies\\Microsoft\\FVE’ -Name ‘UseRecoveryDrive’ -Value 1 -ea SilentlyContinue
```

# Bitlocker erweiterte PIN Abfrage beim Startup  
```powershell
Set-ItemProperty -Path ‘HKLM:\\Software\\Policies\\Microsoft\\FVE’ -Name ‘UseEnhancedPin’ -Value 1 -ea SilentlyContinue
```

# Bitlocker Secure Boot aktivieren  
```powershell
Set-ItemProperty -Path ‘HKLM:\\Software\\Policies\\Microsoft\\FVE’ -Name ‘OSAllowSecureBootForIntegrity’ -Value 1 -ea SilentlyContinue
```

# Bitlocker Wiederherstellungmethode der Systemplatte  
```powershell
Set-ItemProperty -Path ‘HKLM:\\SOFTWARE\\Policies\\Microsoft\\FVE’ -Name ‘OSManageDRA’ -Value 1 -ea SilentlyContinue  
Set-ItemProperty -Path ‘HKLM:\\SOFTWARE\\Policies\\Microsoft\\FVE’ -Name ‘OSRecoveryPassword’ -Value 2 -ea SilentlyContinue  
Set-ItemProperty -Path ‘HKLM:\\SOFTWARE\\Policies\\Microsoft\\FVE’ -Name ‘OSRecoveryKey’ -Value 2 -ea SilentlyContinue  
Set-ItemProperty -Path ‘HKLM:\\SOFTWARE\\Policies\\Microsoft\\FVE’ -Name ‘OSHideRecoveryPage’ -Value 0 -ea SilentlyContinue  
Set-ItemProperty -Path ‘HKLM:\\SOFTWARE\\Policies\\Microsoft\\FVE’ -Name ‘OSActiveDirectoryBackup’ -Value 1 -ea SilentlyContinue  
Set-ItemProperty -Path ‘HKLM:\\SOFTWARE\\Policies\\Microsoft\\FVE’ -Name ‘OSActiveDirectoryInfoToStore’ -Value 1 -ea SilentlyContinue
```

# Bitlocker softwarebasierte Verschlüsselung einsetzen  
```powershell
Set-ItemProperty -Path ‘HKLM:\\SOFTWARE\\Policies\\Microsoft\\FVE’ -Name ‘OSAllowSoftwareEncryptionFailover’ -Value 1 -ea SilentlyContinue  
Set-ItemProperty -Path ‘HKLM:\\SOFTWARE\\Policies\\Microsoft\\FVE’ -Name ‘OSRestrictHardwareEncryptionAlgorithms’ -Value 0 -ea SilentlyContinue  
Set-ItemProperty -Path ‘HKLM:\\SOFTWARE\\Policies\\Microsoft\\FVE’ -Name ‘OSAllowedHardwareEncryptionAlgorithms’ -Value ” -ea SilentlyContinue
```

# Bitlocker Passwortkomplexitiät für Systemplatte aktivieren  
```powershell
Set-ItemProperty -Path ‘HKLM:\\Software\\Policies\\Microsoft\\FVE’ -Name ‘OSPassphraseComplexity’ -Value 2 -ea SilentlyContinue  
Set-ItemProperty -Path ‘HKLM:\\Software\\Policies\\Microsoft\\FVE’ -Name ‘OSPassphraseLength’ -Value 10 -ea SilentlyContinue
```

# Bitlocker Standard-Benutzern das Ändern der PIN untersagen  
```powershell
Set-ItemProperty -Path ‘HKLM:\\Software\\Policies\\Microsoft\\FVE’ -Name ‘DisallowStandardUserPINReset’ -Value 1 -ea SilentlyContinue
```

# Bitlocker Vollverschlüsselung der Systemplatte erzwingen  
```powershell
Set-ItemProperty -Path ‘HKLM:\\SOFTWARE\\Policies\\Microsoft\\FVE’ -Name ‘OSEncryptionType’ -Value 0 -ea SilentlyContinue
```

# Bitlocker starke Cipher XTS-AES-256 zur Verschlüsselung aktiviereb  
```powershell
Set-ItemProperty -Path ‘HKLM:\\SOFTWARE\\Policies\\Microsoft\\FVE’ -Name ‘EncryptionMethodWithXtsOs’ -Value 7 -ea SilentlyContinue  
Set-ItemProperty -Path ‘HKLM:\\SOFTWARE\\Policies\\Microsoft\\FVE’ -Name ‘EncryptionMethodWithXtsFdv’ -Value 7 -ea SilentlyContinue  
Set-ItemProperty -Path ‘HKLM:\\SOFTWARE\\Policies\\Microsoft\\FVE’ -Name ‘EncryptionMethodWithXtsRdv’ -Value 7 -ea SilentlyContinue
```

# Die Benutzung der Kamera erlauben (z.B. Notebook intern)  
```powershell
Set-ItemProperty -Path ‘HKLM:\\software\\Policies\\Microsoft\\Camera’ -Name ‘AllowCamera’ -Value 1 -ea SilentlyContinue
```

# Schaltfläche zur Anzeige (Anmeldeinformation) des eingegebenen Passworts deaktivieren  
```powershell
Set-ItemProperty -Path ‘HKLM:\\Software\\Policies\\Microsoft\\Windows\\CredUI’ -Name ‘DisablePasswordReveal’ -Value 1 -ea SilentlyContinue
```

# Anzeigen aller lokalen Admin-Konten am Anmeldebildschirm  
```powershell
Set-ItemProperty -Path ‘HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\CredUI’ -Name ‘EnumerateAdministrators’ -Value 1 -ea SilentlyContinue
```

# Verhindern das Benutzer Sicherheitsfragen hinterlegen können  
```powershell
Set-ItemProperty -Path ‘HKLM:\\Software\\Policies\\Microsoft\\Windows\\System’ -Name ‘NoLocalPasswordResetQuestions’ -Value 1 -ea SilentlyContinue
```

# Event-Logs für Anwendungen automatisch speichern wenn Speicher voll  
```powershell
Set-ItemProperty -Path ‘HKLM:\\Software\\Policies\\Microsoft\\Windows\\EventLog\\Application’ -Name ‘AutoBackupLogFiles’ -Value -ea SilentlyContinue
```

# Anwendungs-Logs in C:\\Logs speichern  
```powershell
Set-ItemProperty -Path ‘HKLM:\\Software\\Policies\\Microsoft\\Windows\\EventLog\\Application’ -Name ‘File’ -Value ‘C:\\Logs’ -ea SilentlyContinue
```

# Maximale Größe für Anwendungs-Logs 128 MB  
```powershell
Set-ItemProperty -Path ‘HKLM:\\Software\\Policies\\Microsoft\\Windows\\EventLog\\Application’ -Name ‘MaxSize’ -Value 131072 -ea SilentlyContinue
```

# Event-Logs für Sicherheit automatisch speichern wenn Speicher voll  
```powershell
Set-ItemProperty -Path ‘HKLM:\\Software\\Policies\\Microsoft\\Windows\\EventLog\\Security’ -Name ‘AutoBackupLogFiles’ -Value -ea SilentlyContinue
```

# Sicherheit-Logs in C:\\Logs speichern  
```powershell
Set-ItemProperty -Path ‘HKLM:\\Software\\Policies\\Microsoft\\Windows\\EventLog\\Security’ -Name ‘File’ -Value ‘C:\\Logs’ -ea SilentlyContinue
```

# Maximale Größe für Sicherheits-Logs 128 MB  
```powershell
Set-ItemProperty -Path ‘HKLM:\\Software\\Policies\\Microsoft\\Windows\\EventLog\\Security’ -Name ‘MaxSize’ -Value 131072 -ea SilentlyContinue
```

# Wichtige Event werden mit einem Zertifikat verschlüsselt wenn vorhanden  
```powershell
Set-ItemProperty -Path ‘HKLM:\\Software\\Policies\\Microsoft\\Windows\\EventLog\\ProtectedEventLogging’ -Name ‘EnableProtectedEventLogging’ -Value 1 -ea SilentlyContinue  
Set-ItemProperty -Path ‘HKLM:\\Software\\Policies\\Microsoft\\Windows\\EventLog\\ProtectedEventLogging’ -Name ‘EncryptionCertificate’ -Value
```

# Windows Defender Smart Screen aktivieren  
```powershell
Set-ItemProperty -Path ‘HKLM:\\Software\\Policies\\Microsoft\\Windows\\System’ -Name ‘EnableSmartScreen’ -Value 1 -ea SilentlyContinue  
Set-ItemProperty -Path ‘HKLM:\\Software\\Policies\\Microsoft\\Windows\\System’ -Name ‘ShellSmartScreenLevel’ -Value Block -ea SilentlyContinue
```

# Benachrichtung das neue Software installiert wurde deaktivieren  
```powershell
Set-ItemProperty -Path ‘HKLM:\\Software\\Policies\\Microsoft\\Windows\\Explorer’ -Name ‘NoNewAppAlert’ -Value 1 -ea SilentlyContinue
```

# Ruhezustand in den Power-Optionen nicht anzeigen  
```powershell
Set-ItemProperty -Path ‘HKLM:\\Software\\Policies\\Microsoft\\Windows\\Explorer’ -Name ‘ShowHibernateOption’ -Value 0 -ea SilentlyContinue
```

# Die Datenausführungsverhinderung im Windows Explorer abschalten  
```powershell
Set-ItemProperty -Path ‘HKLM:\\Software\\Policies\\Microsoft\\Windows\\Explorer’ -Name ‘NoDataExecutionPrevention’ -Value 1 -ea SilentlyContinue
```

# Dateihistorie im Windows Explorer abschalten  
```powershell
Set-ItemProperty -Path ‘HKLM:\\Software\\Policies\\Microsoft\\Windows\\FileHistory’ -Name ‘Disabled’ -Value 1 -ea SilentlyContinue
```
