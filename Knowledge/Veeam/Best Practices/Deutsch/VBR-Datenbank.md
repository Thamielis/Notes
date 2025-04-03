
---
created: 2024-08-01T13:48:42 (UTC +02:00)
tags: []
source: https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_VBR_DB/database.html
author: 
---

# VBR-Datenbank | Veeam Backup & Replikations-Best-Practice-Leitfaden

---
## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_VBR_DB/database.html#veeam-backup--replication-database)Veeam Backup & Replikations-Datenbank

Veeam Backup & Replication speichert alle Informationen über die Backup-Infrastruktur, Job-Einstellungen, Job-Historie, Sitzungen und andere Konfigurationsdaten in einem Datenbankserver, der oft als „Konfigurationsdatenbank“ bezeichnet wird.

Bei der Planung der Veeam Backup & Replication-Bereitstellung müssen Sie den Standort der Konfigurationsdatenbank auswählen. Es kann sich entweder um einen lokalen oder einen Remote-Datenbankserver handeln. Beachten Sie die folgenden Empfehlungen, um sicherzustellen, dass Ihr Veeam-Setup auf die Größe Ihrer Infrastruktur skalierbar ist.

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_VBR_DB/database.html#database-engine)Datenbank-Engine

Ab Veeam Backup & Replication v12 können Sie anstelle von Microsoft SQL Server auch PostgreSQL verwenden. Tatsächlich wird bei der Standardinstallation jetzt PostgreSQL installiert. Diese Entscheidung wurde getroffen, da die Microsoft SQL Express Edition viele Einschränkungen in Bezug auf die Skalierung hatte (z. B. maximale Datenbankgröße von 10 GB). PostgreSQL hat diese Einschränkungen nicht und erfordert auch keine teure Lizenz. Zusätzlich wird die Standardinstallation die Datenbank automatisch für Veeam Backup & Replication optimieren.

Da v12 jedoch die erste Version ist, die PostgreSQL unterstützt, wird weiterhin empfohlen, Microsoft SQL Server zu verwenden, wenn Sie mehr als 5000 VMs sichern. Siehe das folgende Flussdiagramm für die beste Wahl, die zu Ihrer Umgebung passt. Wenn Sie Hochverfügbarkeit implementiert haben, wie im Abschnitt Datenbankplatzierung beschrieben, und keine Lizenzierungsbedenken haben, gibt es keinen zwingenden Grund, auf PostgreSQL zu migrieren. Wenn Sie sich in einer komplexen Umgebung mit mehreren Veeam-Servern befinden...

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_VBR_DB/database.html#placement)Datenbankplatzierung

### [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_VBR_DB/database.html#local-database-server)Lokaler Datenbankserver

Ein lokaler Datenbankserver wird für kleinere bis mittelgroße Umgebungen empfohlen. Die Datenbank wird auf dem gleichen Server wie der Veeam Backup & Replication-Server installiert, was eine einfachere Verwaltung und geringere Latenzzeiten ermöglicht.

### [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_VBR_DB/database.html#remote-database-server)Remote-Datenbankserver

Ein Remote-Datenbankserver wird für größere Umgebungen empfohlen, in denen eine höhere Verfügbarkeit und Skalierbarkeit erforderlich ist. Die Datenbank wird auf einem separaten Server installiert, was eine bessere Ressourcennutzung und Ausfallsicherheit ermöglicht.

## [](https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_VBR_DB/database.html#sql-server-settings)SQL Server-Einstellungen

Wenn Sie PostgreSQL als Ihre Konfigurationsdatenbank-Engine verwenden, sollten Sie den Produktionshost als Staging-Server oder einen anderen Microsoft SQL Server in Betracht ziehen.
Wenn Sie die Explorer umfangreich nutzen, sollten Sie einen vollständigen Microsoft SQL Server auf dem Backup-Server für die geringste Latenz und höchste Leistung in Betracht ziehen.

Veeam Backup & Replication erfordert keine spezifischen Einstellungen<sup id="fnref:sqlrequirements"><a href="https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_VBR_DB/database.html#fn:sqlrequirements">1</a></sup> auf dem SQL Server, um die Fähigkeiten von Veeam Explorer _für SharePoint_ oder _SQL_ zu nutzen.

Sowohl lokale als auch Remote-SQL-Server können für Staging-Zwecke verwendet werden. Die entsprechenden Anforderungen sind auf [Veeam Helpcenter](https://www.veeam.com/documentation-guides-datasheets.html) detailliert beschrieben und können über die folgenden Links gefunden werden:

-   [Veeam Explorer für Microsoft SharePoint](https://helpcenter.veeam.com/docs/backup/explorers/vesp_staging_microsoft_sql_server.html)
-   [Veeam Explorer für Microsoft SQL Server](https://helpcenter.veeam.com/docs/backup/explorers/vesql_configure_staging.html)

**Tipp:**

-   Aktivieren und konfigurieren Sie alle Funktionen, die von Produktionsdatenbanken verwendet werden.
-   Verwenden Sie nach Möglichkeit das höchste Lizenzniveau und die neueste Version sowie das kumulative Update-Level, das in einer VM installiert ist.
-   Die Verwendung einer älteren Version des SQL Servers für die Konfigurationsdatenbank als in einer geschützten VM kann zu Warnungen in den Job-Sitzungsprotokollen führen, wenn solche VMs verarbeitet werden.

Wenn Sie planen, verschlüsselte Datenbanken mit Veeam Explorer _für Microsoft SQL Server_ oder _SharePoint_ wiederherzustellen, benötigen Sie ein gültiges Verschlüsselungszertifikat auf dem Staging-Microsoft-SQL-Server<sup id="fnref:kb2006"><a href="https://bp.veeam.com/vbr/2_Design_Structures/D_Veeam_Components/D_VBR_DB/database.html#fn:kb2006">2</a></sup>.

Befolgen Sie die allgemeinen Empfehlungen von Microsoft für optimale SQL-Leistung, beispielsweise platzieren Sie die SQL `tempdb` auf den schnellsten Festplatten für die beste Leistung.

___

___
