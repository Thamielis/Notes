chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html

> Using PlatyPS is the fast and efficient way to create XML-based help.

# Create XML-based help using PlatyPS - PowerShell
## Create XML-based help using PlatyPS

-   Article
-   12/12/2024

## In this article

1.  [What is PlatyPS?](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#what-is-platyps)
2.  [Get started using PlatyPS](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#get-started-using-platyps)
3.  [Create Markdown content for a PowerShell module](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#create-markdown-content-for-a-powershell-module)
4.  [Edit the new or updated Markdown files](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#edit-the-new-or-updated-markdown-files)

When creating a PowerShell module, it's always recommended that you include detailed help for the cmdlets you create. If your cmdlets are implemented in compiled code, you must use the XML-based help. This XML format is known as the Microsoft Assistance Markup Language (MAML).

The legacy PowerShell SDK documentation covers the details of creating help for PowerShell cmdlets packaged into modules. However, PowerShell doesn't provide any tools for creating the XML-based help. The SDK documentation explains the structure of MAML help, but leaves you the task of creating the complex, and deeply nested, MAML content by hand.

This is where the [PlatyPS](https://www.powershellgallery.com/packages/platyPS/) module can help.

[](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#what-is-platyps)

## What is PlatyPS?

PlatyPS is an [open-source](https://github.com/PowerShell/platyps) tool that started as a *hackathon* project to make the creation and maintenance of MAML easier. PlatyPS documents the syntax of parameter sets and the individual parameters for each cmdlet in your module. PlatyPS creates structured [Markdown](https://commonmark.org/) files that contain the syntax information. It can't create descriptions or provide examples.

PlatyPS creates placeholders for you to fill in descriptions and examples. After adding the required information, PlatyPS compiles the Markdown files into MAML files. PowerShell's help system also allows for plain-text conceptual help files (about topics). PlatyPS has a cmdlet to create a structured Markdown template for a new *about* file, but these `about_*.help.txt` files must be maintained manually.

You can include the MAML and Text help files with your module. You can also use PlatyPS to compile the help files into a CAB package that can be hosted for updateable help.

[](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#get-started-using-platyps)

## Get started using PlatyPS

First you must install PlatyPS from the PowerShell Gallery.

```
<span><span># Install using PowerShellGet 2.x</span>
<span>Install-Module</span> platyps<span> -Force</span>

<span># Install using PSResourceGet 1.x</span>
<span>Install-PSResource</span> platyps<span> -Reinstall</span>
</span>
```

After installing PlatyPS, import the module into your session.

```
<span><span>Import-Module</span> platyps
</span>
```

The following flowchart outlines the process for creating or updating PowerShell reference content.

![The workflow for creating XML-based help using PlatyPS](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/docs-conceptual/platyps/media/create-help-using-platyps/cmdlet-ref-flow-v2.png?view=ps-modules)

[](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#create-markdown-content-for-a-powershell-module)

## Create Markdown content for a PowerShell module

1.  Import your new module into the session. Repeat this step for each module you need to document.
    
    Run the following command to import your modules:
    
    ```
    <span><span>Import-Module</span> &lt;your module name&gt;
    </span>
    ```
    
2.  Use PlatyPS to generate Markdown files for your module page and all associated cmdlets within the module. Repeat this step for each module you need to document.
    
    ```
    <span><span>$OutputFolder</span> = &lt;output path&gt;
    <span>$parameters</span> = @{
        Module = &lt;ModuleName&gt;
        OutputFolder = <span>$OutputFolder</span>
        AlphabeticParamsOrder = <span>$true</span>
        WithModulePage = <span>$true</span>
        ExcludeDontShow = <span>$true</span>
        Encoding = [System.Text.Encoding]::UTF8
    }
    <span>New-MarkdownHelp</span> @parameters
    
    <span>New-MarkdownAboutHelp</span><span> -OutputFolder</span> <span>$OutputFolder</span><span> -AboutName</span> <span>"topic_name"</span>
    </span>
    ```
    
    If the output folder doesn't exist, `New-MarkdownHelp` creates it. In this example, `New-MarkdownHelp` creates a Markdown file for each cmdlet in the module. It also creates the *module page* in a file named `<ModuleName>.md`. This module page contains a list of the cmdlets contained in the module and placeholders for the **Synopsis** description. The metadata in the module page comes from the module manifest and is used by PlatyPS to create the HelpInfo XML file (as explained [below](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#creating-an-updateable-help-package)).
    
    `New-MarkdownAboutHelp` creates a new *about* file named `about_topic_name.md`.
    
    For more information, see [New-MarkdownHelp](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/en-us/powershell/module/platyps/new-markdownhelp) and [New-MarkdownAboutHelp](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/en-us/powershell/module/platyps/new-markdownabouthelp).
    

[](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#update-existing-markdown-content-when-the-module-changes)

### Update existing Markdown content when the module changes

PlatyPS can also update existing Markdown files for a module. Use this step to update existing modules that have new cmdlets, new parameters, or parameters that have changed.

1.  Import your new module into the session. Repeat this step for each module you need to document.
    
    Run the following command to import your modules:
    
    ```
    <span><span>Import-Module</span> &lt;your module name&gt;
    </span>
    ```
    
2.  Use PlatyPS to update Markdown files for your module landing page and all associated cmdlets within the module. Repeat this step for each module you need to document.
    
    ```
    <span><span>$parameters</span> = @{
        Path = &lt;folder with Markdown&gt;
        RefreshModulePage = <span>$true</span>
        AlphabeticParamsOrder = <span>$true</span>
        UpdateInputOutput = <span>$true</span>
        ExcludeDontShow = <span>$true</span>
        LogPath = &lt;path to store log file&gt;
        Encoding = [System.Text.Encoding]::UTF8
    }
    <span>Update-MarkdownHelpModule</span> @parameters
    </span>
    ```
    
    `Update-MarkdownHelpModule` updates the cmdlet and module Markdown files in the specified folder. It doesn't update the `about_*.md` files. The module file (`ModuleName.md`) receives any new **Synopsis** text that has been added to the cmdlet files. Updates to cmdlet files include the following change:
    
    -   New parameter sets
    -   New parameters
    -   Updated parameter metadata
    -   Updated input and output type information
    
    For more information, see [Update-MarkdownHelpModule](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/en-us/powershell/module/platyps/update-markdownhelpmodule).
    

[](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#edit-the-new-or-updated-markdown-files)

## Edit the new or updated Markdown files

PlatyPS documents the syntax of the parameter sets and the individual parameters. It can't create descriptions or provide examples. The specific areas where content is needed are contained in curly braces. For example: `{{ Fill in the Description }}`

![Markdown template showing the placeholders in VS Code](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/docs-conceptual/platyps/media/create-help-using-platyps/placeholders-example.png?view=ps-modules)

You need to add a synopsis, a description of the cmdlet, descriptions for each parameter, and at least one example.

For detailed information about writing PowerShell content, see the following articles:

-   [PowerShell style guide](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/en-us/powershell/scripting/community/contributing/powershell-style-guide)
-   [Editing reference articles](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/en-us/powershell/scripting/community/contributing/editing-cmdlet-ref)

Note

PlatyPS has a specific schema that's uses for cmdlet reference. That schema only allows certain Markdown blocks in specific sections of the document. If you put content in the wrong location, the PlatyPS build step fails. For more information, see the [schema](https://github.com/PowerShell/platyPS/blob/master/docs/developer/platyPS/platyPS.schema.md) documentation in the PlatyPS repository. For a complete example of well-formed cmdlet reference, see [Get-Item](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/en-us/powershell/module/microsoft.powershell.management/get-item).

After providing the required content for each of your cmdlets, you need to make sure that you update the module landing page. Verify your module has the correct `Module Guid` and `Download Help Link` values in the YAML metadata of the `<module-name>.md` file. Add any missing metadata.

Also, you may notice that some cmdlets may be missing a **Synopsis** (*short description*). The following command updates the module landing page with your **Synopsis** description text. Open the module landing page to verify the descriptions.

```
<span><span>Update-MarkdownHelpModule</span><span> -Path</span> &lt;full path output folder&gt;<span> -RefreshModulePage</span>
</span>
```

Now that you have entered all the content, you can create the MAML help files that are displayed by `Get-Help` in the PowerShell console.

[](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#create-the-external-help-files)

## Create the external help files

This step creates the MAML help files that are displayed by `Get-Help` in the PowerShell console.

To build the MAML files, run the following command:

```
<span><span>New-ExternalHelp</span><span> -Path</span> &lt;folder with MDs&gt;<span> -OutputPath</span> &lt;output help folder&gt;
</span>
```

`New-ExternalHelp` converts all cmdlet Markdown files into one (or more) MAML files. About files are converted to plain-text files with the following name format: `about_topic_name.help.txt`. The Markdown content must meet the requirement of the PlatyPS schema. `New-ExternalHelp` exits with errors when the content doesn't follow the schema. You must edit the files to fix the schema violations.

Caution

PlatyPS does a poor job converting the `about_*.md` files to plain text. You must use very simple Markdown to get acceptable results. You may want to maintain the files in plain-text `about_topic_name.help.txt` format, rather than allowing PlatyPS to convert them.

Once this step is complete, you will see `*-help.xml` and `about_*.help.txt` files in the target output folder.

For more information, see [New-ExternalHelp](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/en-us/powershell/module/platyps/new-externalhelp)

[](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#test-the-compiled-help-files)

### Test the compiled help files

You can verify the content with the [Get-HelpPreview](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/en-us/powershell/module/platyps/Get-HelpPreview) cmdlet:

```
<span><span>Get-HelpPreview</span><span> -Path</span> <span>"&lt;ModuleName&gt;-Help.xml"</span>
</span>
```

The cmdlet reads the compiled MAML file and outputs the content in the same format you would receive from `Get-Help`. This allows you to inspect the results to verify that the Markdown files compiled correctly and produce the desired results. If you find an error, re-edit the Markdown files and recompile the MAML.

Now you are ready to publish your help files.

[](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#publishing-your-help)

## Publishing your help

Now that you have compiled the Markdown files into PowerShell help files, you are ready to make the files available to users. There are two options for providing help in the PowerShell console.

-   Package the help files with the module
-   Create an updateable help package that users install with the `Update-Help` cmdlet

[](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#packaging-help-with-the-module)

### Packaging help with the module

The help files can be packaged with your module. See [Writing Help for Modules](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/en-us/powershell/scripting/developer/help/writing-help-for-windows-powershell-modules) for details of the folder structure. You should include the list of Help files in the value of the **FileList** key in the module manifest.

[](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#creating-an-updateable-help-package)

### Creating an updateable help package

At a high level, the steps to create updateable help include:

1.  Find an internet site to host your help files
2.  Add a **HelpInfoURI** key to your module manifest
3.  Create a HelpInfo XML file
4.  Create CAB files
5.  Upload your files

For more information, see [Supporting Updateable Help: Step-by-step](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/en-us/powershell/scripting/developer/help/updatable-help-authoring-step-by-step).

PlatyPS assists you with some of these steps.

The **HelpInfoURI** is a URL that points to location where your help files are hosted on the internet. This value is configured in the module manifest. `Update-Help` reads the module manifest to get this URL and download the updateable help content. This URL should only point to the folder location and not to individual files. `Update-Help` constructs the filenames to download based on other information from the module manifest and the HelpInfo XML file.

Important

The **HelpInfoURI** must end with a forward-slash character (`/`). Without that character, `Update-Help` can't construct the correct file paths to download the content. Also, most HTTP-based file services are case-sensitive. It's important that the module metadata in the HelpInfo XML file contains the proper letter case.

The `New-ExternalHelp` cmdlet creates the HelpInfo XML file in the output folder. The HelpInfo XML file is built using YAML metadata contained in the module Markdown files (`ModuleName.md`).

The `New-ExternalHelpCab` cmdlet creates ZIP and CAB files containing the MAML and `about_*.help.txt` files you compiled. CAB files are compatible with all versions of PowerShell. PowerShell 6 and higher can use ZIP files.

```
<span><span>$helpCabParameters</span> = @{
    CabFilesFolder = <span>$MamlOutputFolder</span>
    LandingPagePath = <span>$LandingPage</span>
    OutputFolder = <span>$CabOutputFolder</span>
}
<span>New-ExternalHelpCab</span> @helpCabParameters
</span>
```

After creating the ZIP and CAB files, upload the ZIP, CAB, and HelpInfo XML files to your HTTP file server. Put the files in the location indicated by the **HelpInfoURI**.

For more information, see [New-ExternalHelpCab](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/en-us/powershell/module/platyps/new-externalhelpcab).

[](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#other-publishing-options)

### Other publishing options

Markdown is a versatile format that's easy to transform to other formats for publishing. Using a tool like [Pandoc](https://pandoc.org/), you can convert your Markdown help files to many different document formats, including plain text, HTML, PDF, and Office document formats.

Also, the cmdlets [ConvertFrom-Markdown](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/en-us/powershell/module/microsoft.powershell.utility/convertfrom-markdown) and [Show-Markdown](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/en-us/powershell/module/microsoft.powershell.utility/show-markdown) in PowerShell 6 and higher can be used to convert Markdown to HTML or create a colorful display in the PowerShell console.

[](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/_generated_background_page.html#known-issues)

## Known issues

PlatyPS is very sensitive to the [schema](https://github.com/PowerShell/platyPS/blob/master/docs/developer/platyPS/platyPS.schema.md) for the structure of the Markdown files it creates and compiles. It's very easy write valid Markdown that violates this schema. For more information, see the [PowerShell style guide](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/en-us/powershell/scripting/community/contributing/powershell-style-guide) and [Editing reference articles](chrome-extension://pcmpcfapbekmbjjkdalcgopdkipoggdi/en-us/powershell/scripting/community/contributing/editing-cmdlet-ref).

Collaborate with us on GitHub

The source for this content can be found on GitHub, where you can also create and review issues and pull requests. For more information, see [our contributor guide](https://learn.microsoft.com/powershell/scripting/community/contributing/powershell-style-guide).
