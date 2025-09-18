# Git Befehle

## Übersicht: Unique Git-Commands & Kurzbeschreibung

| Command             | Kurzbeschreibung                                                                                                                                                                                                        |
|---------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `git shortlog`      | Fasst Commits nach Autor\:in zusammen. Mit `-s` nur Zählung; `--all` über alle Refs; `--since=…` Zeitraumfilter.                                                                                                        |
| `git for-each-ref`  | Listet Refs (Branches/Remotes/Tags) mit frei formatierten Feldern (`%(HEAD)`, `%(refname)` …). Ideal für Tools/Parser.                                                                                                  |
| `git rev-parse`     | Gibt Infos über Refs/Repository aus. `--show-toplevel` liefert den Pfad zum Repo-Root (Worktree).                                                                                                                       |
| `git log`           | Commit-Historie. Mit `--format=…` maschinenlesbar, `-n` Limit, `-L a,b:file` Linien-Historie, `--no-walk` nur gegebene Refs, `--stdin` liest Refs von STDIN, `-z` NUL-Trennung, `--numstat/--summary/-M` Stats/Renames. |
| `git merge-base`    | Bestimmt gemeinsamen Vorfahren zweier Commits. Mit `--is-ancestor A B` nur Test (Exit `0`=ja, `1`=nein). `--fork-point` versucht den Abzweigpunkt einer Topic-Branch zu finden.                                         |
| `git config`        | Liest/schreibt Git-Konfiguration. Hier z. B. setzten eines Branch-spezifischen Keys in `.git/config`.                                                                                                                   |
| `git status`        | Arbeitsverzeichnis/Zwischenablage-Status. `--porcelain=v2` maschinenlesbar, `--branch` Branch-Header, `-u` untracked, `--find-renames` Rename-Erkennung.                                                                |
| `git pull`          | `fetch` + `merge` (oder `rebase`, je nach Config). `--tags` holt Tags mit. Bricht bei ungeklärten Konflikten ab.                                                                                                        |
| `git worktree list` | Listet Worktrees; `--porcelain` maschinenlesbar.                                                                                                                                                                        |
| `git stash list`    | Listet Stashes. Mit `--format/--numstat/--summary -M` inklusive Stats & Rename-Detection.                                                                                                                               |
| `git blame`         | Zeigt für jede Zeile die verantwortlichen Commits. `--root` erlaubt Root-Commits, `--incremental` streaming-freundlich.                                                                                                 |

---

## Gesehene Aufrufmuster (aus dem Log, zusammengefasst)

* **shortlog**

  * `git shortlog -s --all --no-min-parents --since=1.year.ago`
* **for-each-ref**

  * `git for-each-ref --format=%1E%(HEAD)%1D%(refname)%1D%(upstream)%1D%(upstream:track)%1D%(objectname)%1D%(committerdate:iso8601)%1D%(worktreepath)%1D refs/heads/ refs/remotes/`
* **rev-parse**

  * `git rev-parse --show-toplevel`
* **log**

  * `git log --format=%x1E%H%x1D -n2 -L2,2:.gitignore`
  * `git log -z --format=%H -n1 work-dir-changes --`
  * `git log --format=%x1E%H%x1D%aN%x1D%aE%x1D%at%x1D%cN%x1D%cE%x1D%ct%x1D%P%x1D%D%x1D%B%x1D --numstat --summary -M --use-mailmap -m --no-min-parents -n1 <commit> --`
  * `git log --format=%x1E%H%x1D%at%x1D%ct%x1D --no-walk --stdin`
  * `git log --format=%x1E%H%x1D%aN%x1D%aE%x1D%at%x1D%B%x1D --shortstat --use-mailmap --no-min-parents <commit>..develop --`
* **merge-base**

  * `git merge-base --is-ancestor <A> <B>` (Varianten: `Script2MMD`↔`main/origin/main`, `develop`↔`main/origin/main`)
  * `git merge-base <A> <B>` (z. B. `FlowOptimized origin/Script2MMD`)
  * `git merge-base --fork-point <A> <B>`
* **config**

  * `git config --local branch.Script2MMD.gk-merge-base origin/main`
* **status**

  * `git status --porcelain=v2 --branch -u --find-renames --`
* **pull**

  * `git pull --tags`
* **worktree**

  * `git worktree list --porcelain`
* **stash**

  * `git stash list --format=%x1E%H%x1D%at%x1D%ct%x1D%P%x1D%gd%x1D%gs%x1D --numstat --summary -M`
* **blame**

  * `git blame --root --incremental :3 -- .gitignore`

---

## Auffällige Fehlerbilder & zielgerichtete Next-Steps

Kurz, pragmatisch – damit die Tools/Automatisierung wieder rund laufen:

1. **„fatal: not a git repository“ / „must be run in a work tree“**

   * Ursache: Aufruf außerhalb eines Worktrees (z. B. direkt im `.git`-Ordner oder UNC-Pfad).
   * **Fix**: In den Repo-Root wechseln (`git rev-parse --show-toplevel`) und dort ausführen. Für Netzpfade besser ein lokales Clone/Worktree nutzen.

2. **`merge-base --is-ancestor …` Exit-Code 1**

   * Bedeutung: *Kein* Vorfahr-Verhältnis (technisch kein Fehler).
   * **Tipp**: In Skripten ausdrücklich auf Exit-Codes reagieren und `1` als „false“ behandeln, nicht als Fehler.

3. **„Permission denied: .git/config“ / „unable to access '.git/config'“**

   * Ursache: NTFS-Rechte/Lock (AV/Backup), anderer Benutzerkontext oder nur-lesbarer Share.
   * **Fix**: Schreibrechte prüfen/setzen (`icacls .git\config`), Editor/AV schließen, Pfad lokal klonen, Prozesskontext vereinheitlichen (kein Mixed Admin/Nicht-Admin).

4. **`pull --tags` blockiert wegen „unmerged files“**

   * **Fix-Reihenfolge**: `git status` → Konflikte auflösen → `git add -A` → `git merge --continue` (oder `git rebase --continue`) → erst dann `git pull --tags`.

5. **Line-History Fehler: „file .gitignore has only 1 lines“**

   * Ursache: `-L2,2:.gitignore` verlangt Zeile 2, Datei hat nur 1 Zeile.
   * **Fix**: Bereich anpassen (`-L1,1:.gitignore`) oder Datei prüfen.

6. **„bad revision 'work-dir-changes'“ / `blame :3`**

   * `work-dir-changes` ist keine gültige Revision – ggf. Tool-Platzhalter.
   * `:3` ist Index-Stage-Syntax; bei `blame` so nicht gültig.
   * **Fix**: Refs validieren (existiert Branch/Tag/Commit?), für Index-Stages korrekte Form verwenden (z. B. `git show :3:path` statt `blame`).

7. **Hohe Latenz/Abbrüche („Operation cancelled“, viele `slow`)**

   * **Tuning**:

     * Teure Optionen nur bei Bedarf: `--find-renames`/`-M` und sehr breite `for-each-ref`-Scans throttlen/cachen.
     * `git gc --aggressive` in Wartungsfenster laufen lassen.
     * `fetch --prune --tags` vor Analysen, um Refs aufzuräumen.
     * Timeouts im aufrufenden Tool (PSVisualizer) erhöhen und parallele Aufrufe begrenzen.

8. **Repos auf Netzlaufwerken (UNC/NAS)**

   * Für Performance und Locks möglichst lokale Clones/Worktrees nutzen; Netzlaufwerke sind fehleranfälliger für `.git/config`-Zugriff.
