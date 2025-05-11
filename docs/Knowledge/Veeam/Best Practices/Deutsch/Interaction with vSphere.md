https://bp.veeam.com/vbr/Support/S_Vmware/interaction.html

> Best practice from the field for Veeam Backup & Replication

# Interaction with vSphere
## [](https://bp.veeam.com/vbr/Support/S_Vmware/interaction.html#interaction-with-vsphere)Interaktion mit vSphere

Veeam Backup & Replication ist in hohem Maße von der vSphere-Infrastruktur abhängig, die es schützt. Der Erfolg der Implementierung hängt in hohem Maße von der Leistung und Stabilität dieser Umgebung ab. In diesem Abschnitt werden wir diese Interaktionen besprechen und die Punkte auflisten, die für eine erfolgreiche Implementierung berücksichtigt werden sollten.

Obwohl es möglich ist, einen Veeam Backup & Replication-Server direkt mit ESX(i)-Hosts zu verbinden, wird in diesem Abschnitt eine vSphere-Umgebung mit mindestens einem vCenter Server vorausgesetzt und davon ausgegangen, dass der Backup-Server auf der vCenter Server-Ebene integriert ist, da dies in fast allen Anwendungsfällen die Best-Practice-Konfiguration ist.

## [](https://bp.veeam.com/vbr/Support/S_Vmware/interaction.html#vcenter-server)vCenter Server

Veeam Backup & Replication kommuniziert bei vielen Vorgängen mit dem vCenter Server. Aus diesem Grund ist eine schnelle und stabile Kommunikation zwischen Veeam Backup & Replication und dem vCenter Server entscheidend, um eine stabile Backup-Umgebung zu erreichen.

Berücksichtigen Sie einige wichtige Faktoren:

-   Verbindungsprobleme zum vCenter Server sind einer der Hauptgründe für fehlgeschlagene Veeam-Jobs. Ein leistungsstarker vCenter Server mit zuverlässiger Verbindung mildert dieses Problem und bietet ein starkes Rückgrat für eine zuverlässige Backup-Infrastruktur.
-   Der vCenter Server muss zuverlässig und immer verfügbar sein, wenn Sicherungsaufträge ausgeführt werden. Er muss in der Lage sein, Anfragen zu beantworten und Aktionen in angemessener Zeit auszuführen. Wenn die Leistung des vCenter Servers im Normalbetrieb schlecht ist, sollte dies vor der Implementierung von Veeam Backup & Replication korrigiert werden.
-   Bei größeren Umgebungen mit vielen gleichzeitigen Jobs, insbesondere Jobs, die in kurzen Abständen ausgeführt werden, kann die Belastung des vCenter-Servers erheblich sein. Der vCenter-Server muss in der Lage sein, eine erhöhte Transaktionsarbeitslast zu bewältigen, um zufällige Jobfehler aufgrund von Befehlstimeouts zu verhindern.
-   Der Backup-Server muss über eine zuverlässige Netzwerkverbindung zum vCenter Server verfügen. Es wird allgemein empfohlen, den Backup-Server in unmittelbarer logischer Nähe zum vCenter Server zu platzieren, dies ist jedoch nicht immer die beste Bereitstellungsoption. In Fällen, in denen der Backup-Server und der vCenter Server über eine Entfernung hinweg bereitgestellt werden müssen, besteht die einzige wirkliche Anforderung darin, dass diese Verbindung konsistent und zuverlässig ist.
-   Wenn Wartungsarbeiten am vCenter Server durchgeführt werden, sollten alle Veeam Backup & Replication-Jobs im Leerlauf sein und der Veeam Backup Service angehalten werden. Dies gilt auch für das Anwenden von Windows-Updates (bei Verwendung der installierbaren Version von vCenter Server), vCenter Server-Patches und -Upgrades sowie für alle Wartungsarbeiten, die einen Neustart des vCenter-Dienstes oder des Systems erfordern würden.

## [](https://bp.veeam.com/vbr/Support/S_Vmware/interaction.html#impact-of-snapshot-operations)Auswirkungen von Snapshot-Vorgängen

Zum Erstellen von VM-Backups nutzt Veeam Backup & Replication die Snapshot-Funktionalität von VMware vSphere. Das Erstellen und Entfernen von Snapshots in vSphere hat erhebliche Auswirkungen auf die Umgebung, die berücksichtigt werden müssen. In diesem Abschnitt werden verschiedene Faktoren beschrieben, die bei diesem Prozess berücksichtigt werden sollten, und es werden mehrere Techniken vorgestellt, um die Auswirkungen von Snapshot-Vorgängen zu minimieren.

Da Veeam Backup & Replication die Snapshot-Technologie zur Durchführung von Backups nutzt, sollten Sie sicherstellen, dass es möglich ist, Snapshots der Festplatten der virtuellen Maschine zu erstellen, da es bestimmte Konfigurationen gibt, die keine Snapshots unterstützen. Informationen zum Identifizieren von VMs, die keine Snapshots unterstützen, finden Sie im [VMware-KB-Artikel 1025279.](https://kb.vmware.com/s/article/1025279) Sie können sie auch mithilfe der [Veeam ONE VM-Konfigurationsbewertung](https://helpcenter.veeam.com/docs/one/reporter/vm_configuration_assessment.html) automatisch erkennen, bevor Sie Ihr Veeam-Verfügbarkeitsprojekt starten.

### [](https://bp.veeam.com/vbr/Support/S_Vmware/interaction.html#snapshot-creation)Snapshot-Erstellung

Der eigentliche Vorgang des Erstellens eines Snapshots hat im Allgemeinen nur geringe Auswirkungen: Die Snapshot-Datei muss erstellt werden, und die VM wird sehr kurz „betäubt“. Diese „Betäubung“ ist im Allgemeinen kurz genug (normalerweise weniger als 1 Sekunde), sodass sie außer bei den zeitkritischsten Anwendungen selten ein Problem darstellt.

**Hinweis** : Veeam Backup & Replication nutzt für den Backup-Prozess einen Standard-VM-Snapshot. Diese VMware-Snapshots unterliegen einer Beschränkung der einzelnen Dateigröße. Beachten Sie, dass die maximale Dateigröße alle Snapshot-Dateien und die gesamte Datenfestplatte umfasst. Wenn Sie beispielsweise eine alte VMFS-Version 3 haben, beträgt die maximale Dateigröße (einschließlich Snapshots) 2 TB. Ihre Datenfestplatte sollte daher nicht größer als 1,98 TB sein, um weiterhin Snapshots erstellen zu können. Weitere Informationen finden Sie im [VMware-KB-Artikel 1012384](https://kb.vmware.com/s/article/1012384) .

### [](https://bp.veeam.com/vbr/Support/S_Vmware/interaction.html#snapshot-open)Schnappschuss öffnen

Das bloße Öffnen eines Snapshots für eine laufende VM führt zu Leistungseinbußen bei der VM, dem ESX(i)-Host und dem zugrunde liegenden Speicher. Der Host muss die E/A verfolgen, Schreibvorgänge in die Snapshot-Datei aufteilen und die Metadaten der Snapshot-Datei aktualisieren. Dieser Mehraufwand wirkt sich wiederum auf den Gast aus (vor allem durch langsamere E/A).

Dies ist im Allgemeinen bei VMs mit erheblicher Schreiblast am deutlichsten und hat weniger Auswirkungen auf die Leseleistung.

Aus Speichersicht benötigen VMs, die mit einem offenen Snapshot ausgeführt werden, zusätzlichen Speicherplatz zum Speichern der Snapshot-Daten und eine zusätzliche E/A-Last auf dem Datenspeicher. Dies ist im Allgemeinen bei Systemen mit erheblicher E/A-Schreiblast stärker ausgeprägt.

**Hinweis** : Informationen zu vMotion- und Storage vMotion-Prozessen, die mit offenen Snapshots ausgeführt werden, finden Sie im [VMware-KB-Artikel 1035550.](https://kb.vmware.com/s/article/1035550)

### [](https://bp.veeam.com/vbr/Support/S_Vmware/interaction.html#snapshot-removal)Snapshot-Entfernung

Das Entfernen des Snapshots ist der Schritt mit den größten Auswirkungen aus Sicht der Leistung. Die E/A-Last steigt erheblich an, da zusätzliche Lese-/Schreibvorgänge erforderlich sind, um die Snapshot-Blöcke wieder in das ursprüngliche VMDK zu übertragen. Dies führt schließlich zu dem „Stun“ der VM, der erforderlich ist, um die letzten Bits des Snapshots zu übertragen. Der „Stun“ ist normalerweise eine kurze Pause (normalerweise nur ein paar Sekunden oder weniger); die VM reagiert nicht („verlorener Ping“), während die allerletzten Bits der Snapshot-Datei übertragen werden.

VMware vSphere verwendet für ältere Versionen den „Rolling Snapshot“ und ab vSphere 6.0u1 dieselbe Methode wie Storage vMotion, um die Auswirkungen und Dauer der Betäubung zu minimieren. Eine ausführliche Erläuterung der Probleme beim Entfernen von Snapshots finden Sie im [VMware KB-Artikel 1002836](https://kb.vmware.com/s/article/1002836) .

## [](https://bp.veeam.com/vbr/Support/S_Vmware/interaction.html#snapshot-hunter)Schnappschuss-Jäger

Beim Veeam-Support war einer der am häufigsten gemeldeten Supportfälle der verwaiste Snapshot. Verwaiste Snapshots wurden durch VMwares eigene fehlgeschlagene Snapshot-Commit-Vorgänge aufgrund nicht freigegebener VMDK-Dateisperren während VDDK-Vorgängen verursacht. Veeam verwendet die standardmäßige VM-Snapshot-Verarbeitung von VMware für Sicherungs- und Replikationsprozesse. Obwohl Veeam nicht der Ursprung der verwaisten Snapshots war, wird Veeam oft als Grundursache angesehen, da dieses Problem erst entdeckt wurde, als eine Sicherung fehlschlug.

Wenn sie nicht angemessen überwacht werden, können verwaiste VMware-Snapshots viele unerwartete Probleme verursachen. Die häufigsten Probleme sind überfüllte VM-Datenspeicher oder Snapshots, die so groß werden, dass sie nicht mehr übertragen werden können. Dies ist ein bekanntes VMware vSphere-Problem, das im [VMware-KB-Artikel 1007814](https://kb.vmware.com/s/article/1007814) beschrieben wird . Die einzige Möglichkeit, dieses Problem manuell zu beheben, besteht darin, die VM zu klonen und eine neue vollständige VM-Sicherung durchzuführen.

![](https://bp.veeam.com/vbr/Support/S_Vmware/media/interaction-vmw-consolidation-needed.png)

Um den Vorgang zu verstehen, lesen Sie im Hilfecenter den Abschnitt „ [So funktioniert Snapshot Hunter“ .](https://helpcenter.veeam.com/docs/backup/vsphere/snapshot_hunter_hiw.html)

**Hinweis** : Derzeit kann das Standardverhalten von Snapshot Hunter nicht geändert werden. Da Snapshot Hunter die Konsolidierung automatisch bis zu acht Mal wiederholt, ist es für einige VMs, die geplante Ausfallzeiten erfordern, möglicherweise nicht sinnvoll, den Snapshot manuell zu konsolidieren. Solche VMs sollten von Sicherungs- oder Replikationsaufträgen ausgeschlossen werden, bis die verwaisten Snapshots manuell entfernt wurden.

Wenn Sie Veeam Backup & Replication evaluieren, verwenden Sie die in der Veeam Availability Suite enthaltenen [Infrastrukturbewertungsberichte,](https://helpcenter.veeam.com/docs/one/reporter/vmware_infrastructure_assessment.html) um VMs mit Snapshots zu identifizieren, die von der automatischen Snapshot-Konsolidierung betroffen sein können.

---

## [](https://bp.veeam.com/vbr/Support/S_Vmware/interaction.html#references)Verweise

-   [Veeam-Hilfecenter – vSphere-Benutzerhandbuch](https://helpcenter.veeam.com/docs/backup/vsphere/overview.html)
-   [VMware KB-Artikel 1025279](https://kb.vmware.com/s/article/1025279)
-   [Veeam ONE VM-Konfigurationsbewertung](https://helpcenter.veeam.com/docs/one/reporter/vm_configuration_assessment.html)
-   [VMware KB-Artikel 1012384](https://kb.vmware.com/s/article/1012384)
-   [VMware KB-Artikel 1035550](https://kb.vmware.com/s/article/1035550)
-   [VMware KB-Artikel 1002836](https://kb.vmware.com/s/article/1002836)
-   [VMware KB-Artikel 1007814](https://kb.vmware.com/s/article/1007814)
-   [So funktioniert Snapshot Hunter](https://helpcenter.veeam.com/docs/backup/vsphere/snapshot_hunter_hiw.html)
-   [Infrastrukturbewertungsberichte](https://helpcenter.veeam.com/docs/one/reporter/vmware_infrastructure_assessment.html)

---
