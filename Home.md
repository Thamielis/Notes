<details>
<summary>Inhaltsverzeichnis</summary>

- [1. ToDo](#1-todo)
  - [1.1. RepoOverview](#11-repooverview)
  - [1.2. Notes Repo](#12-notes-repo)
- [2. Repos](#2-repos)
  - [2.1. Kostwein](#21-kostwein)
    - [2.1.3. ConfigurationManager](#213-configurationmanager)
  - [2.2. Analyse/Visualize](#22-analysevisualize)
- [3. Knowledge](#3-knowledge)
  - [3.1 Dokuments](#31-dokuments)
    - [3.1.1 PowerShell](#311-powershell)
      - [3.1.1.1 PowerShell References](#3111-powershell-references)
      - [3.1.1.2 Active Directory Reports](#3112-active-directory-reports)
        - [3.1.1.2.1 ADGroups](#31121-adgroups)
    - [3.1.2 Veeam](#312-veeam)
      - [3.1.2.1 Best Practices](#3121-best-practices)
      - [3.1.2.2 NAS Backup - GFS To Tape](#3122-nas-backup---gfs-to-tape)
      - [3.1.2.3 How to Design and Implement a Backup System Based on SLA Policies](#3123-how-to-design-and-implement-a-backup-system-based-on-sla-policies)
    - [3.1.3 ML](#313-ml)
  - [3.2 Algorithmen](#32-algorithmen)
  - [3.3 CheatSheets](#33-cheatsheets)
  - [3.4 Programming Books](#34-programming-books)
  - [3.5 Regex](#35-regex)
  - [3.6 Build your own VR Headset](#36-build-your-own-vr-headset)
- [4. Links](#4-links)
- [5. Wikies](#5-wikies)
- [6. Wichtig](#6-wichtig)

</details>

## 1. ToDo

### 1.1. RepoOverview
  >
  > - [ ] :bangbang: Anzahl der Files per Repo hinzufügen
  > - [ ] :bangbang: Branches und Unterschiede hinzufügen
  > - [ ] :bangbang: [MarkMap.js](<https://markmap.js.org>) Integrieren
  >
### 1.2. Notes Repo
  >
  > - [ ] :memo: PSModulesHelp hinzufügen
  > - [ ] :memo: KnowledgeBase hinzufügen

## 2. Repos

- [<span style="color:yellow">ReposWiki</span>](<ReposWiki/ReposWiki.md>): Alle GitHub Repositories
- [<span style="color:yellow">Meine Repos</span>](ReposWiki/Repositories.md): <span style="color:cyan">*Meine Programmierungen*</span>

### 2.1. Kostwein

- [Kostwein](/%2F/Kostwein.md)

#### 2.1.3. ConfigurationManager

### 2.2. Analyse/Visualize

- [PSVisualizer](<https://github.com/In-Pro-Org/PSVisualizer>)
  > Erstellen eines Mermaid Diagramms vom Ablauf eines PowerShell Scripts

## 3. Knowledge

- [<span style="color:yellow">Knowledge</span>](<Knowledge/Knowledge.md>)
  - [<span style="color:red">ML</span>](<Knowledge/ML/ML.md>)
    - [<span style="color:green">Build KnowledgeBase</span>](<Knowledge/ML/How I Turned My Companys Docs into a Searchable Database with OpenAI.md>)
  - [<span style="color:#4da6ff">PowerShell</span>](<Knowledge/PowerShell/PowerShell.md>)
    - [<span style="color:#7d7dff">Fast FileContent Search</span>](https://www.leeholmes.com/scour-fast-personal-local-content-searches/)
    - [<span style="color:#ff8040">PSWriteHTML</span>](Knowledge/PowerShell/PSWriteHTML/)
      - [<span style="color:cyan">Nested Tabs</span>](<Knowledge/PowerShell/PSWriteHTML/Nested Tabs, Diagram Updates, Diagram Events, Calendar Object and more in PSWriteHTML.md>)
    
  - [<span style="color:cyan">Mermaid</span>](<Knowledge/Mermaid/Mermaid.md>)
    - [<span style="color:cyan">Examples</span>](<Knowledge/Mermaid/MermaidOnGitHubExamples.md>)

### 3.1 Dokuments

#### 3.1.1 PowerShell

- [ ] ChangelogManagement
- [ ] Configuration
- [ ] MarkdownLinkCheck
- [ ] Metadata
- [ ] Pester
- [ ] Plaster
- [ ] PSDepend
- [ ] PSCodeHealth
- [ ] PSCoverage
- [ ] PSFunctionExplorer
- [ ] ClassExplorer
- [ ] PSClassUtils
- [ ] EventLogConverter
- [ ] FindFunctionCalls
- [ ] Format-Markdown
- [ ] GitHub
- [ ] GitHubProvider
- [ ] GitHubActions
- [ ] HtmlToMarkdown
- [ ] MarkdownEx

##### 3.1.1.1 [PowerShell References](<PowerShell-References.md>)

##### 3.1.1.2 Active Directory Reports

###### 3.1.1.2.1 ADGroups

```powershell
New-ADGroupReport -Name 'PaloAlto*' -ReportTitle 'PaloAlto_Internet ADGroups' -EmbedCSS -FilePath C:\Temp\ADPaloAlto_Internet.html -CSSUri "A:\PowerShell\PSTaskSequenceReport\IIS\css\ADReports.css"
```

#### 3.1.2 <span style="color:green">Veeam</span>

##### 3.1.2.1 [Best Practices](<Knowledge\Veeam\Best Practices\index.md>)

##### 3.1.2.2 [NAS Backup - GFS To Tape](<Knowledge\Veeam\NAS backup - GFS To Tape\NAS backup - GFS to Tape - Part I.md>)

##### 3.1.2.3 [How to Design and Implement a Backup System Based on SLA Policies](<Knowledge\Veeam\How to Design and Implement a Backup System\Veeam How to Design and Implement a Backup System Based on SLA Policies - Part I - Design, Architecture, and Tagging in vSphere.md>)

#### 3.1.3 ML

### 3.2 Algorithmen

- [<span style="color:rgb(241, 82, 220)">Algorithmen</span>](/%2F/Algorithmen.md)
  - [<span style="color:rgb(241, 82, 220)">Awesome Algorithms</span>](<https://github.com/tayllan/awesome-algorithms>)
  - [<span style="color:rgb(241, 82, 220)">The Ultimate Topic List(with Tutorials, Problems, and Templates)</span>](<https://blog.shahjalalshohag.com/topic-list/>)

### 3.3 CheatSheets

- [Programming CheatSheets](https://github.com/EbookFoundation/free-programming-books/blob/8366c91ffb66e43471ef26b578c03dff0fe8a4ef/more/free-programming-cheatsheets.md)

### 3.4 Programming Books

- [<span style="color:yellow">Free Programming Books</span>](<https://github.com/EbookFoundation/free-programming-books>)
  - [<span style="color:yellow">By Subjects</span>](<https://github.com/EbookFoundation/free-programming-books/blob/8366c91ffb66e43471ef26b578c03dff0fe8a4ef/books/free-programming-books-subjects.md>)
  - [<span style="color:yellow">By Language</span>](<https://github.com/EbookFoundation/free-programming-books/blob/8366c91ffb66e43471ef26b578c03dff0fe8a4ef/books/free-programming-books-langs.md>)
    - [<span style="color:yellow">PowerShell</span>](<https://github.com/EbookFoundation/free-programming-books/blob/main/books/free-programming-books-langs.md#powershell>)

### 3.5 Regex
- [Reference](https://learn.microsoft.com/en-us/dotnet/standard/base-types/regular-expression-language-quick-reference)

### 3.6 Build your own VR Headset

- [Relativty](<https://github.com/relativty/Relativty>)
- [HadesVR](<https://github.com/HadesVR/HadesVR>)

## 4. Links

- [<span style="color:magenta">Links</span>](<Links/LinksWiki.md>): Links zu meinen Themen
- [<span style="color:cyan">PSModulesHelp</span>](<PSModulesHelp/ModuleDoku.md>): :information_source: Help für PowerShell Module

## 5. Wikies
  >
  > - [Notes](https://github.com/thamielis/Notes)
  > - [PSModulesDoku](https://thamielis.github.io/PSModulesDoku/)
  > - [PSKnowledge](https://thamielis.github.io/PSKnowledge/ClassExplorer/gasm.html)
  > - [Mein Netlify Blog](<https://blog.in-pro.org>)
  > - [Thamielis Pages](<https://thamielis.github.io>)

## 6. Wichtig
>
>[!warning]
>***PowerShell***
>[PowerShell](Links/PowerShell%20Links.md)
>>**gMSA**
>>>[:bangbang: Using gMSA for Remoting](Knowledge/PowerShell/gMSA/Using%20Group%20Managed%20Service%20Accounts%20(gMSAs)%20for%20PowerShell%20Remoting.md)
>>
>>***Runspace***
>>>[:exclamation: Invoke-ProducerConsumer](Scripts/Invoke-ProducerConsumer.ps1)
>>
>***GitHub***
>>[:bulb: Mein Repo to Wiki Script](https://github.com/thamielis/PSRepoOverview)
>
>**Veeam**
>>[Veeam](Links/Veeam.md)
>>[:bangbang: Backup Infra erstellen](<https://jorgedelacruz.uk/2020/03/09/veeam-how-to-design-and-implement-a-backup-system-based-on-sla-policies-part-i-design-architecture-and-tagging-in-vsphere>)
>
