# Managing Cross-Node Dependencies with Desired State Configuration  Petri IT Knowledgebase
**Setting the Stage — Example**
-------------------------------

Consider a simple, two-tier, web application that has a web server and a database server. In this example, you are converting from manual install procedures to configuration management using DSC. Your instructions are the following:

![[images/devolutions_logo_blue.png]]

Sponsored Content

Devolutions Remote Desktop Manager

Devolutions RDM centralizes all remote connections on a single platform that is securely shared between users and across the entire team. With support for hundreds of integrated technologies — including multiple protocols and VPNs — along with built-in enterprise-grade password management tools, global and granular-level access controls, and robust mobile apps to complement desktop clients.

[

Learn More

](https://remotedesktopmanager.com/?utm_source=sponsorship&utm_medium=ads&utm_campaign=bww)

*   Configure SQL Server
*   Install database
*   Start SQL Server
*   Configure Web Server
*   After SQL Server starts, start IIS

In this scenario, your web server’s startup needs to complete after SQL Server begins. Keep in mind, the SQL Server configuration is happening on another server. To accomplish this, you will need to use the WaitForAny resource. This will tell the web server to wait for a dependency to complete.

**Choosing the Right Resource**
-------------------------------

You will want to use PSDesiredStateConfiguration. This is the module that contains the built-in DSC resources. It all contains the following three WaitFor resources:

*   **WaitForAny** — Waits for one of the nodes in the list to reach the prerequisite condition
*   **WaitForSome —** Waits for a minimum number of nodes in the list to reach the prerequisite condition
*   **WaitForAll —** Waits for all nodes in the list to reach the prerequisite condition

Why so many options? Taking the previous example one step further, you may have a mission-critical application that runs in a farm of SQL Server instances and a farm of web servers. Because you have many database servers, you need only one SQL server running the instance before your website starts. It does not matter which one.  Later in the configuration sequence, you may have a load balancing resource. You will only want to configure this once at least two of the web servers are running. The possible dependency combinations are endless and these three options allow handling of a variety of scenarios.

**Desired State Configuration Without Dependencies**
----------------------------------------------------

Without specifying dependencies in the configuration, you may be relying on manual dependencies. Waiting for the SQL Server configuration to finish, while I have also pushed the Web Server configuration, is an example of this.  This manual dependency has you relying on the speed of one configuration. You are hoping one is fast enough to finish before another finishes. This is not a reliable method. In this demonstration, I am going to continue with the example of configuring a single SQL Server and single Web Server. Please note, this code is not a full, working demo of a SQL Server/Web Server configuration. That is not the point of this demonstration.

Import-DscResource -moduleName PSDesiredStateConfiguration,

@{ModuleName="xSQLServer";ModuleVersion="6.0.0.0"},

@{ModuleName="xWebAdministration";ModuleVersion="1.17.0.0"}

xSQLServerSetup InstallSQL {

SetupCredential = $credential

InstanceName = 'Instance1'

xSQLServerDatabase InstallDB {

SQLInstanceName = 'Instance1'

DependsOn = '\[xSQLServerSetup\]InstallSQL'

DependsOn = '\[xSQLServerDatabase\]InstallDB'

WindowsFeature Web-Server {

PhysicalPath = "C:\\MyWebApp"

DependsOn = '\[WindowsFeature\]Web-Server'

DependsOn = '\[xWebSite\]MyWebApp'

Configuration TwoTier { Import-DscResource -moduleName PSDesiredStateConfiguration, @{ModuleName="xSQLServer";ModuleVersion="6.0.0.0"}, @{ModuleName="xWebAdministration";ModuleVersion="1.17.0.0"} Node SQLServer { xSQLServerSetup InstallSQL { SetupCredential = $credential InstanceName = 'Instance1' } xSQLServerDatabase InstallDB { Name = 'DatabaseName' SQLServer = 'SQLServer' SQLInstanceName = 'Instance1' DependsOn = '\[xSQLServerSetup\]InstallSQL' } Service StartSQLServer { Name = 'MSSQL$Instance1' Ensure = 'Present' State = 'Running' DependsOn = '\[xSQLServerDatabase\]InstallDB' } } Node WebServer { WindowsFeature Web-Server { Name = 'Web-Server' Ensure = 'Present' } xWebSite MyWebApp { Name = 'MyWebApp' Ensure = 'Present' PhysicalPath = "C:\\MyWebApp" DependsOn = '\[WindowsFeature\]Web-Server' } Service StartWebServer { Name = 'W3Svc' Ensure = "Present" State = 'Running' DependsOn = '\[xWebSite\]MyWebApp' } }

```powershell 
Configuration TwoTier {
    Import-DscResource -moduleName PSDesiredStateConfiguration,
             @{ModuleName="xSQLServer";ModuleVersion="6.0.0.0"},
             @{ModuleName="xWebAdministration";ModuleVersion="1.17.0.0"}

    Node SQLServer {
        
        xSQLServerSetup InstallSQL {
            SetupCredential = $credential
            InstanceName = 'Instance1'
            }

        xSQLServerDatabase InstallDB {
            Name = 'DatabaseName'
            SQLServer = 'SQLServer'
            SQLInstanceName = 'Instance1'
            DependsOn = '[xSQLServerSetup]InstallSQL'
            }

        Service StartSQLServer {
            Name = 'MSSQL$Instance1'
            Ensure = 'Present'
            State = 'Running'
            DependsOn = '[xSQLServerDatabase]InstallDB'
            }
        }

   Node WebServer {

        WindowsFeature Web-Server {
            Name = 'Web-Server'
            Ensure = 'Present'
            }

        xWebSite MyWebApp {
            Name = 'MyWebApp'
            Ensure = 'Present'
            PhysicalPath = "C:\MyWebApp"
            DependsOn = '[WindowsFeature]Web-Server'
            }    

        Service StartWebServer {
            Name = 'W3Svc'
            Ensure = "Present"
            State = 'Running'
            DependsOn = '[xWebSite]MyWebApp'
        }
    }
```

Differences Between DependsOn and WaitFor
-----------------------------------------

This code contains intra-node dependencies using DependsOn. Keep in mind, DependsOn can only depend on settings that are contained in the same MOF.  This configuration will produce two MOFs, one for WebServer and one for SQL Server. Therefore, it is not possible to use DependsOn to ensure that the SQL Server service on a database server starts before the W3SVC service on a web server.

**WaitForAny Resource Properties**
----------------------------------

I will add a WaitForAny resource to the Web Server configuration in between the xWebSite resource and the Service resource. This ensures that the configuration stops and waits for the prerequisite on the SQL Server to complete. There are a few properties to set for defining the dependency and the length of time the LCM should wait. This lets you know how long to go before you should stop waiting.

*   NodeName — This is either a single node name (shown in the example) or a list of nodes. You will be waiting on this.
*   ResourceName — This is the name of the specific resource in the dependency node’s configuration. The syntax is the same as a DependsOn property. The resource type is in square brackets followed directly by the unique resource name.
*   RetryIntervalSec — This defines how long to wait for each attempt of checking the state of the dependency.
*   RetryCount — This tells you a prerequisite for the number of attempts.

**Adding a WaitForAny Resource**
--------------------------------

The combination of RetryIntervalSec and RetryCount specify how long the configuration will wait on a dependency. In the below example, the LCM will check every 60 seconds to see if the configuration meets the dependency. It will allow for 60 attempts at checking. After an hour, the checking will stop and the configuration will throw an error. After that, the LCM’s ConfigurationMode setting will decide if it should attempt the configuration again. If the LCM setting reads as ApplyAndAutocorrect, it will attempt the configuration again at the next refresh interval. If not, the configuration will not be attempted again. In this case, you will need to manually correct (remove-dscconfigurationdocument -stage pending) and push again.

WaitForAny WaitForSQLStartup {

ResourceName = '\[Service\]StartSQLService'

DependsOn = '\[xWebSite\]MyWebApp'

Service StartWebServer {..}

 xWebSite MyWebApp {..} WaitForAny WaitForSQLStartup { NodeName = 'SQLServer' ResourceName = '\[Service\]StartSQLService' RetryIntervalSec = 60 RetryCount = 60 DependsOn = '\[xWebSite\]MyWebApp' } Service StartWebServer {..}

```powershell 
       xWebSite MyWebApp {..}

       WaitForAny WaitForSQLStartup {
            NodeName = 'SQLServer'
            ResourceName = '[Service]StartSQLService'
            RetryIntervalSec = 60
            RetryCount = 60
            DependsOn = '[xWebSite]MyWebApp'
            }

       Service StartWebServer {..}
```

**WaitForAll and WaitForSome Differences**
------------------------------------------

All three resources can have multiple node names in its NodeName property. Listed below is the proper syntax for multiple node names.

 NodeName = 'Svr1','Cli1','Svr

 NodeName = 'Svr1','Cli1','Svr

```powershell 
               NodeName = 'Svr1','Cli1','Svr
```

Because there are three options, you must decide which WaitFor resource fits your requirement. If you are waiting for the existence of something such as the SQL Server service to start, you would use WaitForAny. Some servers need all instances with a certain setting completed before proceeding. For example, all domain controllers would need to be available before starting a dependent service. In this situation, you would use WaitForAll. If you need 3 web servers from a farm of 10 to be available before activating a load balancer, you would use WaitForSome. WaitForSome has an additional property called NodeCount. You would set NodeName to all 10 web server names and **NodeCount = 3.** This indicates that you want 3 servers to be available before proceeding.

**Configuration Management — Not Install Orchestration**
--------------------------------------------------------

As a result of the flexibility that DSC allows, I occasionally lose sight of the intended design of DSC, also called configuration management. Instead, I use it more as a server or application provisioning mechanism. There are times when managing cross-node dependencies is right. For example, I might want 2 servers available before starting the load balancing service. There are times when you are outside the scope of configuration management. For example, I may want a file placed on Server 1. If I did something with the file that outputs file 2, then I copy file 2 to server 2. Then, I do something else on server 2. While WaitFor resources help with the synchronization of these tasks, there is a very fine line between configuration management and install orchestration. When using WaitFor resources, ensure you are using them for configuration management such as managing a server’s state, and not wieldy intermediate steps instead.