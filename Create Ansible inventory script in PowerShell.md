---
created: 2025-12-10T17:32:57 (UTC +01:00)
tags: []
source: https://4sysops.com/archives/create-an-ansible-inventory-file-with-psansible-inventory-and-an-ansible-inventory-script-in-powershell/
author: Stéphane van Gulick
---

# Create an Ansible inventory file with psansible.inventory and an Ansible inventory script in PowerShell – 4sysops

---
The PowerShell module psansible.Inventory allows you to simplify the dynamic creation of your Ansible inventory with the help of an Ansible inventory script. You can retrieve data from your preferred sources, structure the data, and create a standardized Ansible inventory.

Contents

1.  [Ansible inventory](https://4sysops.com/archives/create-an-ansible-inventory-file-with-psansible-inventory-and-an-ansible-inventory-script-in-powershell/#rtoc-1)
2.  [Ansible inventory plugins](https://4sysops.com/archives/create-an-ansible-inventory-file-with-psansible-inventory-and-an-ansible-inventory-script-in-powershell/#rtoc-2)
3.  [Ansible inventory script](https://4sysops.com/archives/create-an-ansible-inventory-file-with-psansible-inventory-and-an-ansible-inventory-script-in-powershell/#rtoc-3)
4.  [psansible.inventory](https://4sysops.com/archives/create-an-ansible-inventory-file-with-psansible-inventory-and-an-ansible-inventory-script-in-powershell/#rtoc-4)
5.  [Conclusion](https://4sysops.com/archives/create-an-ansible-inventory-file-with-psansible-inventory-and-an-ansible-inventory-script-in-powershell/#rtoc-5)

-   [Author](https://4sysops.com/archives/create-an-ansible-inventory-file-with-psansible-inventory-and-an-ansible-inventory-script-in-powershell/#abh_about)
-   [Recent Posts](https://4sysops.com/archives/create-an-ansible-inventory-file-with-psansible-inventory-and-an-ansible-inventory-script-in-powershell/#abh_posts)

[![Stéphane van Gulick](https://4sysops.com/wp-content/uploads/avatars/1804/58552295dcd04-bpfull.jpg)](https://4sysops.com/members/stephane-vangulick/ "Stéphane van Gulick")

A configuration management tool that has gotten a lot of traction lately is Ansible. It is an open-source project developed and maintained by Red Hat. Ansible is an agentless application that allows configuration management and the required state configuration using remoting protocols (shh/winrm). Like other things from the Linux ecosystem, Ansible is mostly file based, which makes it a simple and straightforward tool to use.

## Ansible inventory

An Ansible inventory is the heart of the Ansible ecosystem. It is used to manage multiple nodes simultaneously for a large variety of things. When you need to scale, you will need to use an Ansible inventory.

An Ansible inventory, in its simplest form, is a structured file that describes what your environment looks like. The file is generally in INI format, but formats such as YAML or JSON are also accepted. Since it is a simple text file, this inventory can be created in any way you like: by hand or by writing scripts that generate it for you.

In its simplest form, an Ansible inventory looks as follows:

```
[webservers]
srv-01
srv-02
srv-03
```

In the example above, we have three entries: srv-01, srv-02, and srv-03, all of which are members of the webservers group. By targeting the group webservers, you will reach only the servers that are contained in that group to execute your playbook (a list of tasks that determines the configuration of the hosts).

The main purpose of an inventory is to group hosts. Yes, it is true; you can also assign variables to hosts in an inventory to determine the host's configuration. However, it is a better practice to use group and host variable files for this purpose. This is something that psansible.inventory also handles, which I will cover in a future article.

## Ansible inventory plugins

If your environment doesn't change often, manually editing the inventory.ini file is probably good enough. But if you want to make things dynamic, for instance, if the number of hosts in your environment changes frequently, you can go with an existing dynamic [inventory plugin](https://docs.ansible.com/ansible/latest/user_guide/intro_dynamic_inventory.html) that can pull inventory information from various sources. Alternatively, if your data is stored in a custom configuration management database (CMDB), or in multiple ones, for that matter, you might need to write your own plugin in Python. Notably, custom plugins can only be written in Python.

## Ansible inventory script

If Python is not your preferred language, you can create an **Ansible inventory script** that creates the Ansible inventory. An inventory script can be written in any language that can be executed by the Ansible host on which Ansible resides**.**

A last and common option is to feed Ansible an INI file directly that contains your inventory.

The INI file is read in by Ansible each time a run is executed. The contents of this INI file can be created statically; they can also be created dynamically with the help of an external script (a PS1 file that resides locally on the server) that generates the Ansible inventory at frequent time intervals. This allows us to decouple the creation of the inventory from the Ansible infrastructure and makes things much easier to test.

For the last two cases, this is where **psansible.inventory** comes into play.

## psansible.inventory

psansible.Inventory is a helper module that simplifies the automatic creation of your Ansible inventory. It allows you to write logic to fetch data from your preferred sources, easily structure the data, and spit out a standardized Ansible inventory.

Psansible.inventory is the glue that will stick your DB queries to the supported Ansible export format, which can be either of the following:

1.  a) The INI format file, with the group_vars and host_vars folders (must be exported to the file system).
2.  b) A JSON-formatted object that is memory based and basically contains the same data but is structured a bit differently.

To get pansible.inventory on your machine, you can simply [download](https://www.powershellgallery.com/packages/psansible.inventory/0.1.0) it from the PowerShell gallery or install it with this command:

```
install-module psansible.inventory
```

To display a list of existing commands, you can run this command:

```
get-command -Module pansible.inventory
```

[![The available pansiible.inventory cmdlets](https://4sysops.com/wp-content/uploads/2022/05/The-available-pansiible.inventory-cmdlets-1.png)](https://4sysops.com/wp-content/uploads/2022/05/The-available-pansiible.inventory-cmdlets-1.png)

The available pansiible.inventory cmdlets

To see the power of psansible.inventory, let's recreate the Ansible inventory from the beginning of this article (three entries in a single group).

To create your first inventory, use the _New-AnsibleInventory_ cmdlet

```
$Inventory = New-AnsibleInventory
$Inventory
EntryCollection    : TotalEntries: 0
Hierarchy          : AnsibleInventoryHierarchyCollection
VariableCollection : AnsibleVariableCollection
GroupCollection    : 
Path               :
```

_$Inventory_ contains an object of type _AnsibleInventory,_ which defines what the Ansible inventory will look like. Notice the _EntryCollection_ property, which mentions _TotalEntries: 0_.  
This means that, for the moment, it is empty inventory and frankly not that useful in this current state. Let's change that and create some entries for our inventory. For this, we will use the _new-AnsibleInventoryEntry_ command.

```
$Entry = New-AnsibleInventoryEntry -NodeName "srv-01"
$Entry

GroupMemberShip NodeName
--------------- --------
{}              srv-01
```

_$Entry_ contains an object of type _AnsibleInventoryEntry,_ which describes a single entry of the global Ansible inventory.

_GroupMemberShip_ is empty. Let's change that, and add our server _srv-01_ to the _webservers_ group.

```
$Entry.AddToGroup("webservers")
$Entry

GroupMemberShip NodeName
--------------- --------
{webservers}    srv-01
```

An alternative way to accomplish this is to use the _-group_ parameter of the _New-AnsibleInventoryEntry_ cmdlet.

```
$Entry = New-AnsibleInventoryEntry -NodeName "srv-01" -Group "webservers"
$Entry

GroupMemberShip NodeName
--------------- --------
{webservers}    srv-01
```

Now that we have our first entry, we can add it to our previously created inventory using the _addInventoryEntry()_ method attached to the inventory object.

```
$Inventory.AddInventoryEntry($Entry)
$Inventory

EntryCollection    : TotalEntries: 1
Hierarchy          : AnsibleInventoryHierarchyCollection
VariableCollection : AnsibleVariableCollection
GroupCollection    : 
Path               :
```

We can see that we have the property **EntryCollection,** which now contains **TotalEntries: 1**.

We can add the last two servers to complete our inventory.

```
$servers = @("srv-02","srv-03")
$GroupName = "webservers"

foreach ($server in $servers){
    $e = New-AnsibleInventoryEntry -NodeName $server -Group $GroupName
    $Inventory.AddInventoryEntry($e)
}

$Inventory

EntryCollection    : TotalEntries: 3
Hiearchy           : AnsibleInventoryHiearchyCollection
VariableCollection : AnsibleVariableCollection
GroupCollection    : 
Path               :
```

We can now see that we have a total of three entries in our _EntryCollection_ property.

To see which entries we currently have in our inventory, we can use the _GetEntries()_ method from the _$Inventory_ object.

```
$Inventory.GetEntries()

GroupMemberShip NodeName
--------------- --------
{webservers}    srv-01
{webservers}    srv-02
{webservers}    srv-03
```

Now that the content is ready, we can go ahead and export the data to generate an inventory document that Ansible understands.

For that, we first need to add a folder path to where we would like to export this, too. Nothing is simpler than this. Simply use _the .SetPath()_ method attached to the inventory variable.

```
$Inventory.SetPath('/Users/stephanevg/exports')                          
                            
$Inventory                                                                                                         
EntryCollection    : TotalEntries: 2   
Hierarchy          : AnsibleInventoryHiearchyCollection
VariableCollection : AnsibleVariableCollection
GroupCollection    : 
Path               : /Users/stephanevg/exports
```

Once added, we can export the Ansible Inventory and generate the desired INI file using the _.Export()_ method attached to the inventory object**.** The following structure is generated:

$Inventory.Export() PS /Users/stephanevg/exports> Get-ChildItem | select Name Name ---- group_vars host_vars inventory.ini

Taking a closer look at the **inventory.ini,** it looks just like the one from the beginning of the article:

```
PS /Users/stephanevg/exports&gt; cat ./inventory.ini                                                      
         
[webservers]
srv-01
srv-02
srv-03
```

## Conclusion

You've seen that psansible.Inventory does a bit more than create a simple list of hosts. It allows you to control your whole inventory creation flow in your preferred language.

## Subscribe to 4sysops newsletter!

Many plugins exist for different environments, such as Azure or AWS. If your inventory data must come from one or more cloud sources, or from your own custom database, psansible.Inventory is the best choice to retrieve data for your inventory.
