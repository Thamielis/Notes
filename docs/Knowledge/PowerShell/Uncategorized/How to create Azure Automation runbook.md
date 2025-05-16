Today I will not show you any script, but will guide you how to create Azure Automation runbook.

For those who didn’t heard about Azure Automation I strongly recommend to check Microsoft documentation – [link](https://azure.microsoft.com/en-us/services/automation/).  
To make long story short – Azure Automation is the service in Azure cloud, which allow to automate repetitive tasks in your environment using Powershell :).  
Not only standard work which can be done on VMs, but it can automate tasks for other services.

**How this work?**  
First of all you should have access to active Azure subscription.  
Login to [portal.azure.com](http://portal.azure.com/) and in the lookup field type Automation Accounts  
[![](How%20to%20create%20Azure%20Automation%20runbook%20-%20Powershellbros.com/AutomationAccount.png)](https://i2.wp.com/www.powershellbros.com/wp-content/uploads/2017/07/AutomationAccount.png)

In this step you must create Automation Account under which your runbook will be created.  
Provide all necessary information and choose region which is most suitable for you.  
[![](How%20to%20create%20Azure%20Automation%20runbook%20-%20Powershellbros.com/AutomationAccount_create.png)](https://i1.wp.com/www.powershellbros.com/wp-content/uploads/2017/07/AutomationAccount_create.png)

Once automation account is created you can create your own runbook. But before that I recommend to check share resources section under your automation account.  
This section store information which will be available across all runbooks created under automation account.  
From my perspective most usefull resources are:  
– **Modules** – same as in your “computer” version of Powershell. To work with some products you need specific module to be installed. All modules are available in galerry, so insallation is very quick  
– **Credentials** – you shouldn’t store your credentials directly in script. This section store credentials in encrypted way.  
– **Variables** – if you want to use same variable in few runbooks it is the best place to do it.  
[![](How%20to%20create%20Azure%20Automation%20runbook%20-%20Powershellbros.com/AzureAutomation_accountSharedResources.png)](https://i0.wp.com/www.powershellbros.com/wp-content/uploads/2017/07/AzureAutomation_accountSharedResources.png)

**Runbook creation**  
To create new runbook from Process automation section select **Runbooks**  
[![](How%20to%20create%20Azure%20Automation%20runbook%20-%20Powershellbros.com/AutomationAccount_runbook.png)](https://i2.wp.com/www.powershellbros.com/wp-content/uploads/2017/07/AutomationAccount_runbook.png)

From newly open blade select **Add a runbook** if you want to create new runbook or **Browse gallery** if you want to use runbook which was already created by someone else and uploaded to gallery.  
[![](How%20to%20create%20Azure%20Automation%20runbook%20-%20Powershellbros.com/AzureAutomation_runbookcreation.png)](https://i0.wp.com/www.powershellbros.com/wp-content/uploads/2017/07/AzureAutomation_runbookcreation.png)

In next step (if you choose add runbook option) you must provide runbook name (unique in automation account) and runbook type.  
Usually I choose Powwershell as a type of runbook, however if you want to use graphic runbook is not very complicated 😉  
[![](How%20to%20create%20Azure%20Automation%20runbook%20-%20Powershellbros.com/AzureAutomation_Powershellrunbook.png)](https://i2.wp.com/www.powershellbros.com/wp-content/uploads/2017/07/AzureAutomation_Powershellrunbook.png)

Once new runbook is created you can write Powershell script.  
Use Test pane section during script creation, it will help you to find some bugs 🙂  
[![](How%20to%20create%20Azure%20Automation%20runbook%20-%20Powershellbros.com/AzureAutomation_publish.png)](https://i2.wp.com/www.powershellbros.com/wp-content/uploads/2017/07/AzureAutomation_publish.png)

If you have any questions please leave a comment, we will try to help you 🙂