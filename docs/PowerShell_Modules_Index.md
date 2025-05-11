# **PowerShell Modules Index**

## DevOps

### Build & CI/CD Automation

* **psake** – A PowerShell-based build automation tool that uses PowerShell syntax (inspired by Rake) to script build tasks. *Last Updated:* October 7, 2024.
* **PSDevOps** (PowerShell-DevOps) – Module for automating Azure DevOps pipelines and GitHub workflows via pipeline-aware cmdlets. *Last Updated:* January 29, 2022.

### Cloud & Infrastructure Modules

* **Az** – Official Azure PowerShell module with cmdlets to manage Azure resources from PowerShell. *Last Updated:* May 6, 2025.
* **AWSPowerShell** – AWS Tools for PowerShell; enables managing AWS services from the PowerShell environment (covers all AWS services in one module). *Last Updated:* May 6, 2025.
* **VMware PowerCLI** – Comprehensive VMware module providing many cmdlets to manage a wide range of VMware products (vSphere, vCenter, etc.), allowing admins to automate virtualization tasks. *Last Updated:* July 25, 2024.

### Configuration Management & Provisioning

* **DSCParser** – Parses a Desired State Configuration script into objects for analysis (useful for DSC configuration auditing). *Last Updated:* April 3, 2025.
* **Carbon** – DevOps module for automating the configuration and setup of Windows servers and applications (configures local users, IIS sites, registry, services, etc.). *Last Updated:* August 18, 2023.
* **AutomatedLab** – PowerShell framework to easily deploy lab environments (virtual machines on Hyper-V or Azure) from simple configurations. *Last Updated:* November 24, 2022.

## Security

### Offensive Security & Pentesting

* **PowerSploit** – A collection of offensive PowerShell modules/scripts to aid penetration testers and red teamers in all phases of engagements. *Last Updated:* December 19, 2015.
* **PowerShellArsenal** – PowerShell module for reverse engineering tasks (can disassemble .NET and native code, analyze malware, memory, etc.) *(Community module by Matt Graeber; no recent official updates)*.

### Defensive Security & Forensics

* **DSInternals** – Exposes internal Active Directory/Azure AD features for auditing and incident response (e.g. AD database (NTDS.dit) analysis, password hash retrieval, FIDO2 key audit). *Last Updated:* April 11, 2025.
* **PowerForensics** – A digital forensics toolkit for PowerShell, providing low-level disk and filesystem forensic analysis capabilities (NTFS, FAT, etc.). *Last Updated:* January 30, 2016.

### Credential & Secrets Management

* **SecretManagement** – (Microsoft.PowerShell.SecretManagement) Provides a convenient way to securely store and retrieve secrets (credentials, API keys, etc.) via pluggable vault backends. *Last Updated:* January 27, 2022.
* **Posh-SSH** – PowerShell module for SSH connectivity and SFTP file transfers, allowing secure remote management of systems (supports creating SSH sessions, executing commands, uploading/downloading files). *Last Updated:* (frequently updated, community module by darkoperator – check PowerShell Gallery for latest date).

## Scripting Tools

### Development & Testing

* **Pester** – The ubiquitous testing framework for PowerShell, used to write and run unit/integration tests with a BDD-like syntax and mocking support. *Last Updated:* January 8, 2025.
* **PSScriptAnalyzer** – A static code analysis tool that checks PowerShell scripts against best practices and style rules to identify potential defects or code quality issues. *Last Updated:* February 27, 2024.
* **Plaster** – A template-based scaffolding module to quickly generate the structure/files for new PowerShell projects or modules. *Last Updated:* October 19, 2022.

### Shell & Prompt Enhancements

* **PSReadLine** – Enhances the interactive console with advanced line-editing, history search, and syntax highlighting for an improved command-line editing experience. *Last Updated:* October 3, 2024.
* **posh-git** – Integrates Git status into the PowerShell prompt, showing branch status and providing tab-completion for Git commands in the shell. *Last Updated:* March 11, 2021.
* **oh-my-posh** – A prompt theme engine for customizing your shell prompt with color themes and status segments (works cross-shell and cross-platform). *Last Updated:* May 17, 2022.
* **Terminal-Icons** – Adds file and folder icons to directory listings in the terminal based on item type/extension, improving visual clarity when browsing files in PowerShell. *Last Updated:* January 28, 2022.

### UI and Notification Tools

* **BurntToast** – Module for creating and displaying native Windows Toast notifications from PowerShell (supports Windows 10/11 toast pop-ups). *Last Updated:* Dec 30, 2020 (v0.8.5). *(v1.0.0 preview available with Windows 10/11 support)*
* **AnyBox** – Provides a simple GUI prompt (WPF window) for script input/output, allowing you to collect user input or display results in a customizable dialog. *Last Updated:* 2018 (community module for GUI interactions).

### Web Frameworks & REST APIs

* **Polaris** – A cross-platform, minimalist web framework for PowerShell that can host web endpoints or REST APIs using PowerShell script logic. *Last Updated:* December 6, 2018.
* **Pode** – PowerShell web server framework to create REST APIs and websites; supports running as an Azure Function or AWS Lambda for serverless scenarios. *Last Updated:* 2021 (community module, cross-platform).
* **UniversalDashboard** – Module for building web dashboards and interactive web UIs entirely in PowerShell (allows creating charts, tables, and webpages for monitoring or reporting). *Last Updated:* 2020 (now succeeded by PowerShell Universal).

## Reporting & Data Output

### Office Integration & Document Generation

* **ImportExcel** – Popular module to import/export Excel spreadsheets **without requiring Excel to be installed** (read and write .xlsx files easily from PowerShell). *Last Updated:* Oct 12, 2023.
* **PSWriteWord** – Allows creation of Word `.docx` documents via PowerShell without MS Word installed (uses the OpenXML SDK). *Last Updated:* June 28, 2019.
* **PSWritePDF** – Module to create or modify PDF files (merge, split, add content) on Windows, Linux, or Mac using PowerShell (built on iText7 libraries). *Last Updated:* October 2, 2022.

### Visualization & Reporting Tools

* **PSGraph** – Provides a domain-specific language to generate graphs using the GraphViz engine, making it easier to script creation of diagrams and flowcharts. *Last Updated:* March 16, 2019.
* **PSWordCloud** – Generates word cloud images from text input (turns scripts or documents into word cloud visuals for reports) using PowerShell. *Last Updated:* 2019 (community module for fun reporting visuals).
* **PSWinDocumentation** – Generates detailed documentation of environment configuration (Active Directory, Exchange, Office 365, AWS, etc.) into Word/Excel/SQL reports. *Last Updated:* June 22, 2020.
* **Testimo** – An infrastructure health check module that performs automated tests of Active Directory and outputs the results (reports on AD configuration issues or best practice compliance). *Last Updated:* February 23, 2025.

## Data Management

### Database Automation (SQL/NoSQL)

* **dbatools** – The community module for SQL Server professionals, offering 500+ functions to automate SQL Server tasks (backups, restores, migrations, configurations, etc.). *Last Updated:* April 12, 2024.
* **DbcChecks (dbachecks)** – Automated SQL Server environment validation framework that uses Pester tests to check for best practices and configurations (part of the DBATools suite). *Last Updated:* 2023 (updates parallel to dbatools).
* **SqlServer** – Official Microsoft module for SQL Server automation. Allows DB developers and DBAs to script out database development, administration, and BI tasks (supports managing SQL instances, databases, agent jobs, SSAS, etc.). *Last Updated:* January 16, 2024.
* **CosmosDB** – Module for Azure Cosmos DB (NoSQL) that provides cmdlets to manage Cosmos DB accounts, databases, containers/collections, documents, and related entities (e.g. users, permissions, stored procedures). *Last Updated:* June 7, 2024.

### Data Import/Export & Other Tools

* **SqlServerDsc** – Desired State Configuration resources for SQL Server to automate deployment and configuration of SQL instances and settings (infrastructure as code for SQL). *Last Updated:* 2022 (Microsoft module on PSGallery).
* **CsvTools** – *(Various small modules/script functions)* Utilities to simplify importing, exporting, or transforming CSV data beyond what the built-in `Import-CSV/Export-CSV` provide (e.g., handling very large CSV files efficiently). *Last Updated:* Varies by project.
* **PowerBI Management** – A collection of modules (MicrosoftPowerBIMgmt\*) to interact with Power BI Service (REST API wrappers to automate tasks like workspace management, reports deployment, etc.). *Last Updated:* 2025 (ongoing updates on PowerShell Gallery).

Each module above is linked to its source (GitHub repo or PowerShell Gallery page) for more information. This index is organized by high-level use case and technical functionality to help you quickly find modules relevant to DevOps, Security, Scripting, Reporting, or Data management needs. All descriptions are concise summaries of each module’s purpose, and the “Last Updated” dates indicate the most recent release as of this writing.
