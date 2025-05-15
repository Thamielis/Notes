# Testing DSC Configurations Using Pester  Petri IT Knowledgebase
**What Is Pester?**
-------------------

Pester is a testing framework, which is built into WMF 5.1. It is also available for download from the PowerShell Gallery for WMF 5.0. According to the [documentation](https://github.com/pester/Pester), Pester consists of a simple set of functions that exposes a testing domain-specific language (DSL) for isolating, running, evaluating, and reporting the results of PowerShell commands. In simple terms, it provides its own language for describing what a test should do.

**Organizing a Pester Test**
----------------------------

Like DSC, Pester has a hierarchical layout. DSC’s layout contains a Configuration block, one or more Node blocks, and one or more Resource blocks. A Pester test layout contains one or more Describe blocks, one or more Context blocks, and one or more It blocks.

![[images/devolutions_logo_blue.png]]

Sponsored Content

Devolutions Remote Desktop Manager

Devolutions RDM centralizes all remote connections on a single platform that is securely shared between users and across the entire team. With support for hundreds of integrated technologies — including multiple protocols and VPNs — along with built-in enterprise-grade password management tools, global and granular-level access controls, and robust mobile apps to complement desktop clients.

[

Learn More

](https://remotedesktopmanager.com/?utm_source=sponsorship&utm_medium=ads&utm_campaign=bww)

*   The Describe block contains a grouping of tests at the highest level. You can have multiple Describe blocks. This may be as simple as, “These tests examine Configuration X.”
*   The Context block contains a grouping of tests at the next level. If the Describe block contains a grouping of tests for a single function, then the Context block may break down the tests further. An example of this may be, “These tests examine Configuration X when Y condition is present.”
*   The It block describes a single test. It will describe an assertion or the expected result for a given test.

**Testing a Simple DSC Configuration**
--------------------------------------

For DSC, there are a few uses for Pester testing. I am going to show a configuration with a very simple file resource and write a Pester test to ensure that the applied configuration matches the desired configuration. Though this test may seem trivial for such an easy configuration, it becomes a great troubleshooting resource when your configuration becomes very large and contains more complicated resources.

```powershell 
Configuration FileRes {
    Node localhost {

        File TestFile {
        Ensure = 'Present'
        SourcePath = "C:\PowerShell\test.ps1"
        DestinationPath = "C:\temp"
        }
    }
}
```

**Adding a Pester Test**
------------------------

In order to use Pester, you need to import the Pester module.

```powershell 
import-module Pester
```

After the module is imported, the Pester-specific keywords will be available in your editor of choice. In my Pester test, I am using the high-level Describe block to define the boundary for the test. My boundary is the entire configuration. Next, the Context block defines the Ensure Present boundary. I could leave out the Context block completely because there is not a reason to define a test for Ensure Absent for this configuration. Finally, I am defining a single test to determine if the file exists.

Describe "Pester Test for Configuration FileRes" {

Context "Ensure Present" {

It "Should exist in the desired location" {

test-path "C:\\temp\\test.ps1" | Should Be $True

Describe "Pester Test for Configuration FileRes" { Context "Ensure Present" { It "Should exist in the desired location" { test-path "C:\\temp\\test.ps1" | Should Be $True } } }

```powershell 
Describe "Pester Test for Configuration FileRes" {
     Context "Ensure Present" {

        It "Should exist in the desired location" {
            test-path "C:\temp\test.ps1" | Should Be $True
            }
    }
}
```

**Running a Pester Test**
-------------------------

The test should be named with a .tests.ps1 extension. As long as you are in the directory where the test lives, it can be run simply by running command Invoke-Pester. Invoke-Pester will run ALL tests with the .tests.ps1 extension located in that directory.

![[images/Pester-1.png]]

I ran the test and my test failed! I have not run the configuration yet and I do not expect the test to pass at this point. Next, I run the DSC Configuration to copy the file to the location I expect. I run the test again and expect it to pass. It still does not pass. I realize that it is creating a file named C:\\temp instead of C:\\Temp\\test.ps1 and that my configuration needs some adjustments. As a result, I decide to make the configuration have two separate resources. One will be to create the C:\\temp directory and the other will be to copy the file. I finally get the test to pass.

![[images/Pester-2.png]]

**Comparing Pester and Test-DSCConfiguration**
----------------------------------------------

Test-DSCConfiguration is a great cmdlet to determine if your configuration is in the desired state. However, in the case of the above example, test-DSCConfiguration would have returned True because the configuration was in the desired state. However, the file was not in the correct location or named correctly. Therefore, my Pester test identified an error in the configuration.

**Expanding Your Use of Pester**
--------------------------------

Pester is a useful testing framework to have in your arsenal of PowerShell tools. Once you are familiar with Pester, you can use it for so much more. A few of these uses are unit testing, integration or acceptance testing, and test-driven development. Because it can be intimidating to learn, testing DSC configurations is a terrific way to start using Pester. It can help you identify errors in your configurations that might be difficult or troublesome to track down. This is especially true in large configurations.