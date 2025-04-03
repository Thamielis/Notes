
---
created: 2024-08-01T12:52:45 (UTC +02:00)
tags: []
source: https://bp.veeam.com/vbr/1_Assessment/A_SLA_Definition/SLA_Definition.html
author: 
---

# SLA-Definition | Veeam Backup & Replication Best Practice Guide

---
## [](https://bp.veeam.com/vbr/1_Assessment/A_SLA_Definition/SLA_Definition.html#sla-definition)SLA-Definition

Ein Service Level Agreement (SLA) definiert die Leistung und Qualität des Dienstes, die der Kunde erwarten kann. Es beschreibt auch die Verantwortlichkeiten des Dienstanbieters und die Abhilfemaßnahmen, falls die SLA-Anforderungen nicht erfüllt werden. Bei der Datensicherung sind zwei wichtige Begriffe zu berücksichtigen: Recovery Point Objective (RPO) und Recovery Time Objective (RTO):

-   **RPO** begrenzt, wie weit in der Zeit zurückgegangen werden soll, und definiert die maximal zulässige Menge an verlorenen Daten, gemessen in der Zeit vom Auftreten eines Fehlers bis zum letzten gültigen Backup.
    
    Beispiel: Für ein Banksystem kann ein Datenverlust von einer Stunde katastrophal sein, da sie Live-Transaktionen ausführen. Auf persönlicher Ebene können Sie RPO auch als den Moment betrachten, in dem Sie ein Dokument, an dem Sie arbeiten, zuletzt gespeichert haben. Im Falle eines Systemabsturzes und des Verlusts Ihres Fortschritts, wie viel Arbeit sind Sie bereit zu verlieren, bevor es Sie beeinträchtigt?
    
-   **RTO** bezieht sich auf die Ausfallzeit und gibt an, wie lange es dauert, bis die normale Betriebsbereitschaft nach einem Vorfall wiederhergestellt ist.

![RTPO](https://bp.veeam.com/vbr/1_Assessment/A_SLA_Definition/Media/RTPO2.png)

### [](https://bp.veeam.com/vbr/1_Assessment/A_SLA_Definition/SLA_Definition.html#define-rto-and-rpo-values-for-your-applications)Definieren Sie RTO- und RPO-Werte für Ihre Anwendungen

Die Wahrheit ist, dass es keine Einheitslösung für einen Business-Continuity-Plan und seine Metriken gibt. Unternehmen unterscheiden sich von einem vertikalen Markt zum anderen, haben unterschiedliche Bedürfnisse und daher unterschiedliche Anforderungen an ihre Wiederherstellungsziele. Eine gängige Praxis besteht jedoch darin, Anwendungen und Dienste in verschiedene Ebenen zu unterteilen und die Werte für die Wiederherstellungszeit und den Wiederherstellungspunkt (RTPO) gemäß den Service Level Agreements (SLAs) festzulegen, zu denen sich die Organisation verpflichtet hat.

Zum Beispiel können Sie ein Drei-Ebenen-Modell verwenden:

-   **Tier-1:** Geschäftskritische Anwendungen, die ein RTPO von weniger als 15 Minuten erfordern
-   **Tier-2:** Geschäftskritische Anwendungen, die eine RTO von zwei Stunden und eine RPO von vier Stunden erfordern
-   **Tier-3:** Nicht kritische Anwendungen, die eine RTO von vier Stunden und eine RPO von 24 Stunden erfordern

Es ist wichtig zu beachten, dass geschäftskritische, geschäftskritische und nicht kritische Anwendungen je nach Branche variieren und jede Organisation diese Ebenen basierend auf ihren Betrieb und Anforderungen definiert.

___
