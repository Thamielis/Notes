---
created: 2025-03-21T11:34:05 (UTC +01:00)
tags: []
source: https://www.jorgedelacruz.es/2018/07/02/veeam-instalar-o-actualizar-el-plugin-de-veeam-para-vcenter-desde-enterprise-manager-novedad-soporte-para-html5/
author: Jorge de la Cruz
---

# Veeam: Installieren oder aktualisieren Sie das Veeam-Plugin für vCenter aus dem Enterprise Manager (Neue Unterstützung für HTML5) – Der Blog von Jorge de la Cruz

---
[![](https://www.jorgedelacruz.es/wp-content/uploads/2018/07/veeam-vsphere-67-banner-694x243.png)](https://www.jorgedelacruz.es/wp-content/uploads/2018/07/veeam-vsphere-67-banner.png)Liebe Freunde, für alle, die Veeam Enterprise Manager verwenden, ist mir klar geworden, dass es ein Plugin für vCenter gibt, das wir nur auf den Stand unserer Veeam-Kopien, Repositorien usw. blicken dürfen. Vor ein paar Jahren hatte Veeam eine vollständige Neugestaltung:

[![](https://www.jorgedelacruz.es/wp-content/uploads/2018/07/veeamplugin.gif)](https://www.jorgedelacruz.es/wp-content/uploads/2018/07/veeamplugin.gif)Mit dem neuen vSphere 6.7, dem HTML5-Client vor GA und der letzten Aktualisierung von [**Veeam mit seiner Version v9.5 U3a**](https://www.jorgedelacruz.es/2018/07/02/veeam-veeam-backup-replication-v9-5-u3a-es-ahora-ga-con-soporte-para-vsphere-6-7-y-mucho-mas/) , wurde ein Plugin gefunden, das von Veeam neu geschrieben wurde, um die Integration mit dem neuen HTML5-Client zu ermöglichen, und das nicht nur Was auch die Integration für VeeamONE betrifft, müssen wir diese später aktualisieren oder installieren.

## Installieren oder aktualisieren Sie unser vCenter-Plugin für Veeam Enterprise Manager

Beachten Sie, dass dieses Plugin nur in vSphere 6.7 funktioniert, da es wahrscheinlich nicht angezeigt werden kann, wenn Sie vSphere 6.5 verwenden. Wir melden uns bei unserem Veeam Enterprise Manager und melden uns an:

[![](https://www.jorgedelacruz.es/wp-content/uploads/2018/07/veeam-vsphere-65-001-694x394.png)](https://www.jorgedelacruz.es/wp-content/uploads/2018/07/veeam-vsphere-65-001.png)Una vez dentro nos iremos hasta Konfiguration:

[![](https://www.jorgedelacruz.es/wp-content/uploads/2018/07/veeam-vsphere-67-002-694x430.png)](https://www.jorgedelacruz.es/wp-content/uploads/2018/07/veeam-vsphere-67-002.png)In dieser Konfiguration können Sie sich auf den vCenters-Abschnitt verlassen, der die neueste Version von vCenter 6.7 sowie die letzte Version von [Veeam Backup & Replication v9.5 U3a](https://www.jorgedelacruz.es/2018/07/02/veeam-veeam-backup-replication-v9-5-u3a-es-ahora-ga-con-soporte-para-vsphere-6-7-y-mucho-mas/) enthält :

[![](https://www.jorgedelacruz.es/wp-content/uploads/2018/07/veeam-vsphere-67-003-694x286.png)](https://www.jorgedelacruz.es/wp-content/uploads/2018/07/veeam-vsphere-67-003.png)Wenn Sie in meinem Fall das Plugin nicht installiert haben, müssen Sie erst einmal auf die Schaltfläche „Installieren“ klicken, um mit der Installation des Plugins zu beginnen:

[![](https://www.jorgedelacruz.es/wp-content/uploads/2018/07/veeam-vsphere-67-004-694x289.png)](https://www.jorgedelacruz.es/wp-content/uploads/2018/07/veeam-vsphere-67-004.png)Nach ein paar weiteren Schritten haben Sie das Plugin installiert und können unseren vSphere Client HTML5 zum Kauf hinzufügen:

[![](https://www.jorgedelacruz.es/wp-content/uploads/2018/07/veeam-vsphere-67-005-694x296.png)](https://www.jorgedelacruz.es/wp-content/uploads/2018/07/veeam-vsphere-67-005.png)

Wenn Sie vor einer neuen Installation ein Upgrade durchführen, müssen Sie sicher sein, dass die Dienste des vSphere Client wieder aktiviert werden, und zwar ab der Konsole VAMI puerto 5480.

### Kleine Fehlerbehebung

Wenn Sie das Plugin nicht auf der neuen HTML5-Schnittstelle finden, klicken Sie auf das folgende Protokoll, wie Root auf Ihrem VCSA-Konto:

Und es gibt den folgenden Fehler:

Versuchen Sie, das Gleiche als Root-Benutzer in Ihrem VCSA-Konto zu erkennen:

Dies ist die Wahrscheinlichkeit, dass Sie das neue Plugin installieren.

## Melden Sie sich beim vSphere Client HTML5 an und konfigurieren Sie das Veeam-Plugin

Wir gehen zu unserem vSphere Client HTML5 und gehen zu Home, oder aus dem Hauptmenü können Sie das neue Plugin perfekt integrieren:

[![](https://www.jorgedelacruz.es/wp-content/uploads/2018/07/veeam-vsphere-67-006-694x431.png)](https://www.jorgedelacruz.es/wp-content/uploads/2018/07/veeam-vsphere-67-006.png)Wenn wir auf das Plugin klicken, müssen wir die Einstellungen für die Konfiguration des Plugins, die Werte für Hostname oder IP, RESTful-API und Zertifikat-Fingerabdruck eingeben. Sie müssen diese dann für den Enterprise Manager konfigurieren, Sie haben die passwortbasierte Authentifizierung markiert und manuell die URL von VeeamONE konfiguriert, und Sie haben versucht, sie zu testen und dann zu speichern:

[![](https://www.jorgedelacruz.es/wp-content/uploads/2018/07/veeam-vsphere-67-007-694x426.png)](https://www.jorgedelacruz.es/wp-content/uploads/2018/07/veeam-vsphere-67-007.png)Wir haben alles konfiguriert, was auf den ersten Blick so ist, dass es sehr elegant ist, seit langem, und dieses Bild kann innerhalb von 24 Stunden von den ausgeführten Arbeiten wieder aufgenommen werden, zusätzlich zu der Anzahl der Backup-Server, Proxy, Repos und Jobs. Außerdem müssen wir uns im Status unserer Backup-Repositories und der VM-Prozesse befinden:

[![](https://www.jorgedelacruz.es/wp-content/uploads/2018/07/veeam-vsphere-67-008-694x394.png)](https://www.jorgedelacruz.es/wp-content/uploads/2018/07/veeam-vsphere-67-008.png)Wenn Sie scrollen, können Sie sich die Entwicklungsstadien von VMs und VMs mit entsprechenden Links und VeeamONE-Berichten genauer ansehen:

[![](https://www.jorgedelacruz.es/wp-content/uploads/2018/07/veeam-vsphere-67-009-694x397.png)](https://www.jorgedelacruz.es/wp-content/uploads/2018/07/veeam-vsphere-67-009.png)Wenn wir klicken, lesen wir die Berichte über die aktuelle Vorgehensweise, um einen Blick auf die Schaltfläche und die native Vorgehensweise in vSphere 6.7 zu werfen, sehr, sehr nützlich:

[![](https://www.jorgedelacruz.es/wp-content/uploads/2018/07/veeam-vsphere-67-010-694x398.png)](https://www.jorgedelacruz.es/wp-content/uploads/2018/07/veeam-vsphere-67-010.png)Dies ist ein Bericht über die VM-Schutzmaßnahmen anhand eines Beispiels, nur einen Klick entfernt:

[![](https://www.jorgedelacruz.es/wp-content/uploads/2018/07/veeam-vsphere-67-013-694x400.png)](https://www.jorgedelacruz.es/wp-content/uploads/2018/07/veeam-vsphere-67-013.png)

## VeeamZIP und QuickBackup, jetzt nativer Browser und vSphere Client HTML5

Abgesehen davon, dass Sie sehr ähnlich und sehr elegant sind, hat Veeam zwei zusätzliche Optionen für alle VMs mit dem vSphere Client HTML5 hinzugefügt, mit der VeeamZIP- und QuickBackup-Option, mit der Sie vom Client aus diese Zusatzoptionen für jede VM auswerfen können:

[![](https://www.jorgedelacruz.es/wp-content/uploads/2018/07/veeam-vsphere-67-011-694x401.png)](https://www.jorgedelacruz.es/wp-content/uploads/2018/07/veeam-vsphere-67-011.png)

## Suchen Sie nach einem VM-Backup, das schnell ausgeführt werden soll

Haben wir uns schon einmal gefragt, ob ein VM-Backup erforderlich ist oder nicht? Nachdem ich den HTML5-Property-vSPhere-Client gelesen habe, möchte ich mich über die neue Eigenschaft freuen, die auf jeder VM verfügbar sein muss, und zwar auf folgende Weise:

[![](https://www.jorgedelacruz.es/wp-content/uploads/2018/07/veeam-vsphere-67-012-694x395.png)](https://www.jorgedelacruz.es/wp-content/uploads/2018/07/veeam-vsphere-67-012.png)Dies sind alle Freunde, die sich die Lizenz für Veeam Enterprise oder Enterprise Plus gesichert haben, mit denen sie Zugriff auf Veeam Enterprise Manager haben, und dieses neue Plugin, das Ihnen einen Ausblick bietet.
