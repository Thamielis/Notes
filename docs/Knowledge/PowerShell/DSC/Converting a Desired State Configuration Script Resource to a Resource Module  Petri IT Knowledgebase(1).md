# Converting a Desired State Configuration Script Resource to a Resource Module  Petri IT Knowledgebase(1)
If you use Desired State Configuration (DSC), you may have already explored many of the resources. There are built-in and community-provided resources that can help to solve configuration management problems. You have probably even played around a bit with building your own resources using the built-in script resource. Script resources, while handy during an initial research phase in determining if something can be done, are not considered the best practice for a production deployment. In this article, I am going to show you how to quickly convert a script resource into a modular resource.

**Follow Along with a Practical Example**
-----------------------------------------

To follow along with an example, I have a script resource that creates a GPO in a domain that I would like to convert to a modular resource. The script resource creates a GPO that is named PKI AutoEnroll.

```powershell
script CreatePKIAEGpo {
    Credential = $DomainCredential
    TestScript = {
        if ((get-gpo -name "PKI AutoEnroll" -domain $Using:Node.DomainName `
                -ErrorAction SilentlyContinue) -eq $Null) {
            return $False
            }
        else {
            return $True}
            }
    SetScript = {
        new-gpo -name "PKI AutoEnroll" -domain $Using:Node.DomainName
        }
    GetScript = {
        $GPO= (get-gpo -name "PKI AutoEnroll" -domain $Using:Node.DomainName)
        return @{Result = $($GPO.DisplayName)}
        } 
}
```

**Decide to Use a Function-Based or Class-Based Resource**
----------------------------------------------------------

There is no hard-and-fast rule for whether a resource should be function-based or class-based. The PowerShell community expects that best practice recommendations will steer us away from function-based resources and that class-based resource development becomes more prevalent. Currently, it may simply be a matter of personal preference. In the case of the example, I am choosing a function-based resource.

**Define the Scope of the Resource**
------------------------------------

I typically use the script resource to only do one thing. I also use the minimal number of parameters or options. PowerShell cmdlets that are used in a script resource have many other optional parameters that you may not be handling with your simple script resource. As a result, it is up to you whether you want to expand the scope of your resource module. This does not always have to happen at this stage in the development process. It can happen at any time during the resource development or even after the resource is completed. However, remember that if you are developing a function-based resource and need additional parameters after the shell is defined, you will need to add them to both the schema.mof file and the functions.

**Scope of the GPO Resource**
-----------------------------

If it does not already exist, I will choose the resource to simply create a new GPO. Since I am choosing to start out simple, providing a starter GPO by name or GUID are outside of the current scope of the resource. However, those can be added in later if I choose to support those options.

**Cover Absent and Present with an Ensure Property**
----------------------------------------------------

A script resource typically covers only one of the two scenarios, Absent or Present. You either wrote the script resource to put something in or you wrote it to take something out. This is the first property you will need.

**Define Other Properties**
---------------------------

Review your script resource for any items that you will need to define as a property. Remember that properties in the schema.mof file are also the parameters in the resource function. Therefore, include a property for items that you currently have hard-coded, items that you are passing in from a parameter in your configuration, or anything that is using the $Using: syntax in your script resource. For a function-based resource, consider using the [xDSCResourceDesigner](https://www.powershellgallery.com/packages/xDSCResourceDesigner/1.9.0.0) to create the resource module shell. This should include folder structure and the schema.mof file, which defines the properties for the resource. For a class-based resource, the properties only need to go into the module itself.

**Properties in the GPO Example**
---------------------------------

I am simply going to review the existing code to determine what I need to specify as input parameters. The first thing that I notice is the $DomainCredential parameter. The script resource defines the Credential property. My function-based resource will also define that as a property. Next, I notice the hard-coded name of the GPO PKI AutoEnroll. I will add a Name parameter so that users can call their GPOs whatever they like. I will also need to add a DomainName parameter because that is being passed in from the configuration data. I am going to make the Name parameter the key. GPO names will need to be unique.

**Add the Code**
----------------

Referring back to whether the original code covered the Absent or Present scenario, move the TestScript code into the Test-TargetResource or Test() function. Move the SetScript code into the Set-TargetResource or Set() function. Create an _if statement_ around the already-written code to cover the written scenario. An example of this is, if ($Ensure -eq “Present”). Change all the hard-coded values in the code and $Using statements to the actual parameters. In the example, I cut and pasted the code from the script resource into the module. I changed the parameters as shown in the Test-TargetResource function.

function Test-TargetResource

\[OutputType(\[System.Boolean\])\]

\[System.Management.Automation.PSCredential\]

\[parameter(Mandatory = $true)\]

\[ValidateSet("Present","Absent")\]

If ($Ensure -eq "Present") {

if ((get-gpo -name $Name -domain $DomainName \`

\-ErrorAction SilentlyContinue) -eq $Null) {

function Test-TargetResource { \[CmdletBinding()\] \[OutputType(\[System.Boolean\])\] param ( \[System.Management.Automation.PSCredential\] $Credential, \[parameter(Mandatory = $true)\] \[System.String\] $Name, \[System.String\] $DomainName, \[ValidateSet("Present","Absent")\] \[System.String\] $Ensure ) If ($Ensure -eq "Present") { if ((get-gpo -name $Name -domain $DomainName \` -ErrorAction SilentlyContinue) -eq $Null) { return $False } else { return $True } }

```powershell
function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]

    param
    (
        [System.Management.Automation.PSCredential]
        $Credential,

        [parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [System.String]
        $DomainName,

        [ValidateSet("Present","Absent")]
        [System.String]
        $Ensure
    )

    If ($Ensure -eq "Present") {
        if ((get-gpo -name $Name -domain $DomainName `
                -ErrorAction SilentlyContinue) -eq $Null) {
            return $False
            }
        else {
            return $True
            }
        }
```

 **Add the Opposing Scenario**
------------------------------

If the original code handled Ensure = Present, now you must add the Ensure = Absent scenario. You may find it easier to grab whatever object you are testing first and then handle the two ensure scenarios. You may find it cleaner to have code to query for the object twice, once in an Ensure Present block and again in an Ensure Absent block. If your script resource is well-tested in the original scenario, it may be easier to keep the blocks completely separated in the beginning. Write some good tests to test both and then refactor.

if (get-gpo -name $Name -Domain $DomainName \`

\-ErrorAction SilentlyContinue -eq $Null) {

 #Ensure = Absent else { if (get-gpo -name $Name -Domain $DomainName \` -ErrorAction SilentlyContinue -eq $Null) { return $True } else { return $False } }

```powershell 
    #Ensure = Absent
    else {
        if (get-gpo -name $Name -Domain $DomainName `
                -ErrorAction SilentlyContinue -eq $Null) {
            return $True
            }
        else {
            return $False
            }
        }
```

**Test, Test, Test**
--------------------

Did you write unit tests for your original script module? If so, add the tests for the opposing scenario that you just added above. You can also use Invoke-DSCResource with the -Name and -Method parameters to test the logic paths for each scenario. You can do this regardless of which type of resource you have written.

**Do Not Forget the Get**
-------------------------

Once you have added the opposing scenario to the Test and Set sections, you will probably have to change the Get as well. The script resource only allowed for a hash table with one item, Result = Something. Its ability to give useful information about the state of a resource was somewhat limited. In the resource module, return a hash table with as much information as is useful.

**Just a Few Simple Steps**
---------------------------

In just a few simple steps, you are on your way from a script resource to a more professional piece of DSC code. This will be easier to support and maintain. First, figure out the scope of the resource module. Second, define the parameters that are needed to support the resource. Next, move the code into the resource module and add the opposing scenario. Last, test the resource module just like you would test the script resource or any other piece of code. Happy coding!