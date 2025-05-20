# Kostwein

![logo](images/Kostwein_Maschinenbau.png)

## Aufgaben

### Active Directory

#### <span style="color:#ff0000">13.05.2025</span>

- ✅ Automatische Mail überprüfen
- [ ] PC User im AD deaktivieren.
- ✅ AD Gruppen für jeden Standort erstellen
- [ ] In CI-Sign die Zuteilung über diese Gruppen hinzufügen
- [ ] Sync-Sage2AD für die Zuteilung erweitern
- [ ] In ARM die Zuteilung einbinden

#### <span style="color:#ff0000">15.05.2025</span>

- [ ] Mitarbeiter in die AD Gruppe Mitarbeiter_XX entsprechend ihres Standorts korrigieren.

#### <span style="color:#ff0000">16.05.2025</span>

- [ ] Alle User Accounts überprüfen auf LastLogon und ausmisten
- [ ] PC... User löschen/umstellen auf personifiziert
- [ ] Messmaschine (Coord) User mit komplexem Passwort versehen

---

## Projekte

### PowerShell

#### [Sync-Sage2AD](<https://github.com/KOWThamielis/Sync-Sage2AD>)
  >
  > Synchronisation der Sage Daten zu ActiveDirectory
  >> :bangbang: [PSActionPacks](<https://github.com/Thamielis/PSActionPacks>)
  >>
  >> :warning: [Employee Klasse](<https://github.com/Stephanevg/PowerShellClassesSeries2/blob/master/Employee_part5.ps1>)

### Veeam

- [PSVeeamDashboard](<https://github.com/KOWThamielis/KOWVeeamDashboard>)
  > Mit PowerShell erstellte Veeam Dashboards
- [PSVeeamKOW](<https://github.com/Thamielis/PSVeeamKOW>)
  > Veeam Module import und Credentials

### MECM

### [PSTaskSequenceReport](<https://github.com/KOWThamielis/PSTaskSequenceReport)>)

  > 📝 Builds a HTML Report of MECM TaskSequence deployment, with detailed steps and results of each device
  
### [MECM_TS](https://github.com/Thamielis/MECM_TS)

  > 📝 Tasksequenz auslesen und visualisieren

### [DriverPackages](https://github.com/In-Pro-Org/DriverPackages)

  > 📝 MECM for DELL Bios and Driver Package Management

---

### Veeam

  Projektverantwortlicher

---

### MECM

---

### CI-Sign
  >
  > 📝 Signaturen erstellen, verwalten und ändern

#### Standard Mitarbeiter Signaturen
  >
  > Derzeit werden die Signaturen über die OU des entsprechenden Mitarbeiters, zugeteilt.
  > Dadurch, dass es eine geteilte OU Struktur gibt, bekommen Mitarbeiter, welche nicht in der Alten
  > Struktur angelegt sind, keine zugeteilt.
