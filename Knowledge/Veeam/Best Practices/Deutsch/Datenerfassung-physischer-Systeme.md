
---
created: 2024-08-01T12:52:45 (UTC +02:00)
tags: []
source: https://bp.veeam.com/vbr/1_Assessment/A_Data_gathering/Physical_Systems_Gathering.html
author: 
---

# Physische Systemdatenerfassung | Veeam Backup & Replikations-Best-Practice-Leitfaden

---
## [](https://bp.veeam.com/vbr/1_Assessment/A_Data_gathering/Physical_Systems_Gathering.html#introduction)Einführung

Eine der schwierigeren Aufgaben bei der Dimensionierung einer Veeam Backup- und Wiederherstellungslösung ist das Sammeln von Informationen über physische Hosts. Im Gegensatz zu VMware, bei dem es relativ einfach ist, bekannte Tools wie RvTools zu verwenden, um relevante Informationen aus der Umgebung zu ziehen, gibt es in physischen Umgebungen kein einzelnes kostenloses Tool, mit dem Sie diese Informationen sammeln können.

In diesem Leitfaden führen wir Sie durch Methoden zur Erfassung von Infrastrukturinformationen mit nativen Tools, auf die Sie wahrscheinlich bereits Zugriff haben. Wenn Sie jedoch eine andere Methode zur Erfassung dieser Daten wie ein Inventarisierungstool haben, empfehlen wir Ihnen, stattdessen diese zu verwenden.

### [](https://bp.veeam.com/vbr/1_Assessment/A_Data_gathering/Physical_Systems_Gathering.html#prerequisites)Voraussetzungen

Windows:

-   WinRM auf allen zu bewertenden Hosts aktiviert
-   WinRM-Ports 5985 und 5986 auf den Zielservern geöffnet

Linux:

-   SSH auf jedem zu bewertenden Server aktiviert
-   SSH-Schlüssel in der Datei der vertrauenswürdigen Hosts enthalten, falls ein SSH-Schlüssel erforderlich ist

## [](https://bp.veeam.com/vbr/1_Assessment/A_Data_gathering/Physical_Systems_Gathering.html#windows)Windows

### [](https://bp.veeam.com/vbr/1_Assessment/A_Data_gathering/Physical_Systems_Gathering.html#setting-up-assessment-server)Einrichtung des Bewertungsservers

Bevor Sie mit diesem Leitfaden fortfahren, müssen die folgenden Elemente auf dem Bewertungsserver installiert sein. Installieren Sie Remote-Administrationstools und das Active Directory-Modul für Windows PowerShell.

Windows Server:

![RSAT_Windows](https://bp.veeam.com/vbr/1_Assessment/A_Data_gathering/Media/Enable_RSAT.png)

Windows 10:

WIN+I (Windows-Einstellungen) > Apps > Optionale Features > Fügen Sie die RSAT-Tools hinzu.

### [](https://bp.veeam.com/vbr/1_Assessment/A_Data_gathering/Physical_Systems_Gathering.html#remote-administration)Remote-Administration

Führen Sie auf dem Bewertungsserver Folgendes aus, um die Remote-Administration zu konfigurieren:

```
Enable-PSRemoting -Force
```

### [](https://bp.veeam.com/vbr/1_Assessment/A_Data_gathering/Physical_Systems_Gathering.html#querying-remote-servers)Abfrage von Remote-Servern

Verwenden Sie das folgende PowerShell-Skript, um Informationen von Remote-Servern zu sammeln:

```
$servers = "Server1", "Server2", "Server3"

foreach ($server in $servers) {
    Invoke-Command -ComputerName $server -ScriptBlock {
        Get-WmiObject -Class Win32_ComputerSystem
    }
}
```

## [](https://bp.veeam.com/vbr/1_Assessment/A_Data_gathering/Physical_Systems_Gathering.html#linux)Linux

### [](https://bp.veeam.com/vbr/1_Assessment/A_Data_gathering/Physical_Systems_Gathering.html#ssh-configuration)SSH-Konfiguration

Stellen Sie sicher, dass SSH auf allen zu bewertenden Servern aktiviert ist. Sie können dies überprüfen, indem Sie Folgendes ausführen:

```
sudo systemctl status ssh
```

### [](https://bp.veeam.com/vbr/1_Assessment/A_Data_gathering/Physical_Systems_Gathering.html#collecting-data)Datensammlung

Verwenden Sie das folgende Shell-Skript, um Informationen von Linux-Servern zu sammeln:

```
#!/bin/bash
servers=("Server1" "Server2" "Server3")

for server in "${servers[@]}"; do
    ssh user@$server "uname -a; df -h"
done
```

### [](https://bp.veeam.com/vbr/1_Assessment/A_Data_gathering/Physical_Systems_Gathering.html#setting-up-an-ssh-key)Einrichtung eines SSH-Schlüssels

Um Ihren SSH-Schlüssel lokal einzurichten, benötigen Sie OpenSSH. Wenn Sie Windows 10 oder WS2019 verwenden, können Sie [diese Installationsschritte](https://docs.microsoft.com/de-de/windows-server/administration/openssh/openssh_install_firstuse) befolgen.

Wenn Sie WS2016 oder früher verwenden, können Sie OpenSSH über Git Bash installieren, das von [Git](https://gitforwindows.org/) verfügbar ist.

Unter W10 und W2019 führen Sie Folgendes in PowerShell aus, auf anderen Systemen führen Sie Git Bash aus.

```
ssh-keygen
Generating public/private rsa key pair.
Enter file in which to save the key (/your_home/.ssh/id_rsa):
```

Wenn Sie den Speicherort nicht ändern möchten, klicken Sie auf Weiter.

```
Enter passphrase (empty for no passphrase):
```

Geben Sie bei Bedarf ein Passwort ein, dies erstellt dann die Schlüssel.

Wenn Ihre Linux-Distribution dies unterstützt, können Sie den Schlüssel einfach auf das System kopieren. Dies erfordert, dass der Zielserver durch ein Passwort zugänglich ist.

```
ssh-copy-id -i ~/.ssh/mykey user@host
```

Andernfalls müssen Sie den öffentlichen Schlüssel manuell zur Datei der autorisierten Schlüssel des Zielhosts hinzufügen.

Nach Abschluss finden Sie die resultierende Excel-Datei an dem Speicherort, den Sie im Skript angegeben haben.

## [](https://bp.veeam.com/vbr/1_Assessment/A_Data_gathering/Physical_Systems_Gathering.html#references)Referenzen

-   [Einrichtung von WinRM](https://docs.microsoft.com/de-de/windows/win32/winrm/installation-and-configuration-for-windows-remote-management)
-   [SSH-Remoting mit PowerShell](https://docs.microsoft.com/de-de/powershell/scripting/learn/remoting/ssh-remoting-in-powershell-core?view=powershell-5.1)
-   [New-PSSession: PowerShell](https://docs.microsoft.com/de-de/powershell/module/microsoft.powershell.core/new-pssession?view=powershell-5.1)
-   [Hinzufügen eines AD-Admins zu Windows 10](https://docs.microsoft.com/de-de/powershell/module/addsadministration/?view=win10-ps)
-   [Python](https://www.python.org/)
-   [Paramiko](http://www.paramiko.org/)
-   [Xlsxwriter](https://xlsxwriter.readthedocs.io/#)

___
