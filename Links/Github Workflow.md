# PowerShell-Skriptentwicklung mit GitHub verwalten

## 1. Repository auf GitHub erstellen
1. Erstelle ein neues Repository auf [GitHub](https://github.com/).
2. Wähle „Public“ oder „Private“.
3. Füge eine `README.md` und `.gitignore` (PowerShell) hinzu.

## 2. Lokales Git-Repository einrichten
```powershell
git clone https://github.com/DeinBenutzername/DeinRepository.git
cd DeinRepository
```

## 3. PowerShell-Skript erstellen und versionieren
```powershell
git add script.ps1
git commit -m "Initiales Skript hinzugefügt"
git push origin main
```

## 4. Branches für Änderungen nutzen
```powershell
git checkout -b feature-neue-funktion
git add script.ps1
git commit -m "Neue Funktion hinzugefügt"
git push origin feature-neue-funktion
```

## 5. Änderungen rückgängig machen
```powershell
git reset --soft HEAD~1   # Letzten Commit zurücknehmen (nur lokal)
git reset --hard HEAD~1   # Letzten Commit vollständig entfernen
git log --oneline         # Frühere Versionen anzeigen
```

## 6. Übersicht behalten mit Aliases
```powershell
git config --global alias.s "status"
git config --global alias.l "log --oneline --graph --decorate"
git config --global alias.a "add ."
git config --global alias.c "commit -m"
git config --global alias.p "push"
```

## 7. Work-in-Progress (WIP) Commit für Zwischenstände
```powershell
git config --global alias.wip "commit -am 'WIP: Zwischenstand'"
git wip
```

## 8. Temporäre Änderungen mit Git Stash speichern
```powershell
git stash       # Änderungen speichern, ohne zu committen
git stash pop   # Änderungen wiederherstellen
git stash list  # Gespeicherte Stashes anzeigen
```

## 9. GitHub Desktop oder Visual Studio Code nutzen
- **GitHub Desktop**: Vereinfachte Verwaltung von Branches und Commits.
- **VS Code**: Zeigt Änderungen und ermöglicht direktes Committing.

## 10. Code mit TODOs organisieren
```powershell
# TODO: Diese Funktion später optimieren
function AlteFunktion {
    Write-Host "Muss später verbessert werden"
}
```

Zum Anzeigen aller TODOs im Code:
```powershell
Select-String -Path "*.ps1" -Pattern "# TODO"
```

## 11. Wöchentlicher Rückblick für besseren Überblick
Jeden Freitag 5 Minuten nehmen und die letzten Commits anschauen:
```powershell
git log --oneline --graph
```

---

Diese Strategie hilft dir, deine PowerShell-Skripte besser zu verwalten, ohne dass es zu kompliziert wird.
