---
created: 2024-08-01T11:40:50 (UTC +02:00)
tags: []
source: https://bp.veeam.com/vbr/
author: 
---

# Willkommen | Veeam Backup & Replication Best Practice Guide

> ## Auszug
> Best Practices aus dem Feld für Veeam Backup & Replication

---
## [](https://bp.veeam.com/vbr/#veeam-backup--replication-best-practices)Veeam Backup & Replication Best Practices

Willkommen zu den Veeam&reg; Backup & Replication&trade; Best Practices.

Dieser Leitfaden soll Best Practices für Veeam Backup & Replication bereitstellen. Er ist nicht als vollständige Dokumentation oder detaillierte Erklärung der Funktionen gedacht. Bitte konsultieren Sie das [Veeam Help Center](https://helpcenter.veeam.com/) für solche Dokumente.

Der Best-Practice-Leitfaden richtet sich an Fachleute, die nach Antworten und Vorschlägen zu verschiedenen Themen suchen. Es kann sich um eine Designidee handeln, die beste Möglichkeit, eine bestimmte Funktion zu nutzen, Fallstricke zu vermeiden usw. Im Allgemeinen wurden diese Informationen von dem Team der Veeam-Lösungsarchitekten entwickelt, gesammelt und aktualisiert, die vor Ort mit Veeam-Benutzern zusammenarbeiten. Sie erklären nicht die Theorie, sondern die Praxis.

Seien Sie sich bewusst, dass eine Best Practice nicht die einzige verfügbare Antwort ist. Sie wird in den meisten Fällen passen, kann aber unter anderen Umständen völlig falsch sein. Stellen Sie sicher, dass Sie die Auswirkungen der empfohlenen Best Practices verstehen, oder fragen Sie jemanden, der dies tut.

Im Zweifelsfall wenden Sie sich an Veeam-Profis in unseren [Foren](https://forums.veeam.com/).

## [](https://bp.veeam.com/vbr/#how-to-use-this-book)Wie man dieses Buch benutzt

Falls Sie ein langjähriger Leser dieses Leitfadens sind, haben Sie möglicherweise bemerkt, dass wir viele Seiten verschoben und eine völlig neue Struktur geschaffen haben. Die Grundidee besteht darin, denselben Arbeitsablauf zu imitieren, dem ein Veeam-Architekt folgt, wenn er eine neue Veeam Backup & Replication-Infrastruktur entwirft:

**1-Bewerten**: Zuerst beginnen Sie damit, die Umgebung zu untersuchen, die Sie schützen müssen. Sie sammeln Daten, fragen nach technischen und geschäftlichen Anforderungen, SLA's, RPO und RTO und allen anderen Informationen, die zur Gestaltung der Lösung benötigt werden;

**2-Entwerfen**: Mit all den gesammelten Informationen beginnen Sie, die Lösung zu entwerfen, indem Sie alle erforderlichen Veeam-Komponenten einbeziehen, jeweils mit ihren Eigenschaften, Stärken und Grenzen, und Sie lernen auch, wie man sie richtig dimensioniert, wobei die Sicherheit immer im Hinterkopf bleibt;

**3-Bauen**: Sobald die Umgebung entworfen wurde, ist es Zeit, sie zu bauen. Ein Architekt kann sie selbst bauen oder die Anweisungen an andere Teams weitergeben, um die Bereitstellung fortzusetzen. Hier finden Sie nützliche Informationen und Tricks wie Konfigurationsoptionen, Registrierungsschlüssel, Hinweise usw.;

**4-Betreiben**: Wenn die Umgebung fertig ist, ist es Zeit, sie zu nutzen! Hier lernen Sie, wie Sie die verschiedenen im Software verfügbaren Jobs richtig konfigurieren und wie Sie Daten wiederherstellen.

**5-Sichern**: Wenn Sie alle anderen Phasen durchlaufen haben, ist es an der Zeit, sicherzustellen, dass Ihr Risiko so gering wie möglich ist. Dieser Abschnitt behandelt grundlegende Sicherheitsprinzipien, die dazu beitragen würden, das Risiko zu verringern und zusätzliches Vertrauen in Ihr Projekt zu geben. Wenn Sie hier angekommen sind, sollten Sie immer wieder von vorne anfangen, um sicherzustellen, dass Sie Ihr Ziel erreicht haben. Wir gehen davon aus, dass Sie von Zeit zu Zeit auf natürliche Weise iterieren und feinabstimmen werden, um Ihr Ziel zu erreichen.

Schließlich gibt es einige zusätzliche Abschnitte zu spezifischen Themen.

Jeder Abschnitt wird auch auf den Hilfsleitfaden für weitere Informationen zur grundlegenden Installation der jeweiligen Komponente verlinken.

Wir hoffen, dass Sie die hier gesammelten Informationen nützlich finden. Danke!

Das Veeam Solutions Architect Team

___
