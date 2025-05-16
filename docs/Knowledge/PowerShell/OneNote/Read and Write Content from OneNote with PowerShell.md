
# Read and Write Content from OneNote with PowerShell

If you work with the Microsoft OneNote Desktop Application, you may have the need to interact with OneNote through external scripts.
OneNote uses its own proprietary format for the notebook file, but it is possible to interact with a local OneNote installation though the COM Object.
The definitions are documented in the [OneNote developer reference at msdn.microsoft.com](https://msdn.microsoft.com/en-us/library/office/jj680118(v=office.15).aspx),

It is not only possible to read structure and content from OneNote, but also to write new content to OneNote.

## Examples

### get a table of all notebooks

```powershell
$OneNote = New-Object -ComObject OneNote.Application
[xml]$Hierarchy = ""
$OneNote.GetHierarchy("", [Microsoft.Office.InterOp.OneNote.HierarchyScope]::hsPages, [ref]$Hierarchy)

$Hierarchy.Notebooks.Notebook | Format-Table Name, path, isUnread, isCurrentlyViewed
```

### list all notebooks with their sectiongroups and sections in the first level

```powershell
$OneNote = New-Object -ComObject OneNote.Application
[xml]$Hierarchy = ""
$OneNote.GetHierarchy("", [Microsoft.Office.InterOp.OneNote.HierarchyScope]::hsPages, [ref]$Hierarchy)

foreach ($notebook in $Hierarchy.Notebooks.Notebook ) {
    " "
    $notebook.Name
    "=============="

    foreach ($sectiongroup in $notebook.SectionGroup) {
        if ($sectiongroup.isRecycleBin -ne 'true') {
        "## "+$sectiongroup.Name
        }
    }
    "## #"
    foreach ($section in $notebook.Section) {
        #    $section |fl *
        "### "+$section.Name
    }
}
```

### write content from HTML-File to a new Notebook

(keeping heading levels and defining custom styles for headers, images not handled in this script)

```powershell
$OneNote = New-Object -ComObject OneNote.Application

$NotebookPath = "C:\Temp\onenoteimport\"
$source = Get-Content -Encoding UTF8 -Path 'C:\Temp\test.html' -Raw;
$NotebookName = "import"
$SiteName = 'Test' 

# create new notebook
$OneNote = New-Object -ComObject OneNote.Application
$Scope = [Microsoft.Office.Interop.OneNote.HierarchyScope]::hsNotebooks
[ref]$xml = ""
$OneNote.OpenHierarchy($NotebookPath, "", $xml, "cftNotebook")

$SectionPath = $NotebookPath + $NotebookName + '.one'
  
# create new section
[ref]$xmlSection = ""
$OneNote.OpenHierarchy($SectionPath, "", $xmlSection, "cftSection")

[ref]$newpageID = ''
$OneNote.CreateNewPage($xmlSection.Value,[ref]$newpageID,[Microsoft.Office.Interop.OneNote.NewPageStyle]::npsBlankPageWithTitle)
      
[ref]$NewPageXML = ''
$OneNote.GetPageContent($newpageID.Value,[ref]$NewPageXML,[Microsoft.Office.Interop.OneNote.PageInfo]::piAll)
      
$null = [Reflection.Assembly]::LoadWithPartialName('System.Xml.Linq')
$xDoc = [System.Xml.Linq.XDocument]::Parse($NewPageXML.Value)
 
# Get OneNote XML namespace
$ns = $xDoc.Root.Name.Namespace

# first quickstyle = pagetitle
$quickstyledef = $xDoc.Descendants() | Where-Object -Property Name -Like -Value '*}QuickStyleDef'
$quickstyledef.SetAttributeValue('font','Source Sans Pro Black')
$quickstyledef.SetAttributeValue('fontColor','#80be6a')

# define other styles
$QuickStyleNode2 = New-Object System.Xml.Linq.XElement( $ns + "QuickStyleDef")
$QuickStyleNode2.SetAttributeValue('index','2')
$QuickStyleNode2.SetAttributeValue('name','p')
$QuickStyleNode2.SetAttributeValue('font','Source Sans Pro Light')
$QuickStyleNode2.SetAttributeValue('fontColor','automatic')
$QuickStyleNode2.SetAttributeValue('fontSize','11.0')
$QuickStyleNode2.SetAttributeValue('spaceBefore','0.3')
$QuickStyleNode2.SetAttributeValue('spaceAfter','0.3')
$quickstyledef.AddAfterSelf($QuickStyleNode2)
$QuickStyleNode3 = New-Object System.Xml.Linq.XElement( $ns + "QuickStyleDef")
$QuickStyleNode3.SetAttributeValue('index','3')
$QuickStyleNode3.SetAttributeValue('name','h1')
$QuickStyleNode3.SetAttributeValue('font','Source Sans Pro Black')
$QuickStyleNode3.SetAttributeValue('fontColor','#be806a')
$QuickStyleNode3.SetAttributeValue('fontSize','16.0')
$QuickStyleNode3.SetAttributeValue('spaceBefore','1.0')
$QuickStyleNode3.SetAttributeValue('spaceAfter','0.5')
$quickstyledef.AddAfterSelf($QuickStyleNode3)
$QuickStyleNode4 = New-Object System.Xml.Linq.XElement( $ns + "QuickStyleDef")
$QuickStyleNode4.SetAttributeValue('index','4')
$QuickStyleNode4.SetAttributeValue('name','h2')
$QuickStyleNode4.SetAttributeValue('font','Source Sans Pro Black')
$QuickStyleNode4.SetAttributeValue('fontColor','#be806a')
$QuickStyleNode4.SetAttributeValue('fontSize','14.0')
$QuickStyleNode4.SetAttributeValue('spaceBefore','0.8')
$QuickStyleNode4.SetAttributeValue('spaceAfter','0.3')
$quickstyledef.AddAfterSelf($QuickStyleNode4)
$QuickStyleNode5 = New-Object System.Xml.Linq.XElement( $ns + "QuickStyleDef")
$QuickStyleNode5.SetAttributeValue('index','5')
$QuickStyleNode5.SetAttributeValue('name','h3')
$QuickStyleNode5.SetAttributeValue('font','Source Sans Pro Black')
$QuickStyleNode5.SetAttributeValue('fontColor','#555555')
$QuickStyleNode5.SetAttributeValue('fontSize','12.0')
$QuickStyleNode5.SetAttributeValue('spaceBefore','0.5')
$QuickStyleNode5.SetAttributeValue('spaceAfter','0.3')
$quickstyledef.AddAfterSelf($QuickStyleNode5)

$title = $xDoc.Descendants() | Where-Object -Property Name -Like -Value '*}T'
if (-not $title)
{throw 'Error: can not find title element'}

# set site title
$title.Value = "$SiteName"

$x = $xDoc.Descendants() | Where-Object -Property Name -Like -Value '*}Title'


$OutlineNode = New-Object System.Xml.Linq.XElement( $ns + "Outline")
$OEChildrenNode = New-Object System.Xml.Linq.XElement( $ns + "OEChildren")


$html = New-Object -ComObject "HTMLFile";
$html.IHTMLDocument2_write($source);
$html.childNodes[1].childNodes[1].childNodes | ? { $_.id -eq 'content' } | % { $_.childnodes } | % {

    $node = $_

    switch ($_.nodeName) {

    'H1' {
        $OENode = New-Object System.Xml.Linq.XElement( $ns + "OE")
        $TNode = New-Object System.Xml.Linq.XElement( $ns + "T")
        $CdataNode = New-Object System.Xml.Linq.XCData($node.innerText)

        $TNode.Add($CdataNode)
        $OENode.Add($TNode)
        $OENode.SetAttributeValue('quickStyleIndex','3')
        $OEChildrenNode.Add($OENode)
    }
    'H2' {
        $OENode = New-Object System.Xml.Linq.XElement( $ns + "OE")
        $TNode = New-Object System.Xml.Linq.XElement( $ns + "T")
        $CdataNode = New-Object System.Xml.Linq.XCData($node.innerText)

        $TNode.Add($CdataNode)
        $OENode.Add($TNode)
        $OENode.SetAttributeValue('quickStyleIndex','4')
        $OEChildrenNode.Add($OENode)
    }
    'H3' {
        $OENode = New-Object System.Xml.Linq.XElement( $ns + "OE")
        $TNode = New-Object System.Xml.Linq.XElement( $ns + "T")
        $CdataNode = New-Object System.Xml.Linq.XCData($node.innerText)

        $TNode.Add($CdataNode)
        $OENode.Add($TNode)
        $OENode.SetAttributeValue('quickStyleIndex','5')
        $OEChildrenNode.Add($OENode)
    }
    'P' {
        $HTMLBlock = New-Object System.Xml.Linq.XElement( $ns + "HTMLBlock")
        $HTMLData = New-Object System.Xml.Linq.XElement( $ns + "Data")
        $CdataNode = New-Object System.Xml.Linq.XCData($node.innerHTML)


        $HTMLData.Add($CdataNode)
        $HTMLBlock.Add($HTMLData)
        $OEChildrenNode.Add($HTMLBlock)
    }
    '#text' {
        $OENode = New-Object System.Xml.Linq.XElement( $ns + "OE")
        $TNode = New-Object System.Xml.Linq.XElement( $ns + "T")
        $CdataNode = New-Object System.Xml.Linq.XCData($node.nodeValue)

        $TNode.Add($CdataNode)
        $OENode.Add($TNode)
        $OENode.SetAttributeValue('quickStyleIndex','2')
        $OEChildrenNode.Add($OENode)
    }
    default {
        $HTMLBlock = New-Object System.Xml.Linq.XElement( $ns + "HTMLBlock")
        $HTMLData = New-Object System.Xml.Linq.XElement( $ns + "Data")
        $CdataNode = New-Object System.Xml.Linq.XCData("$($node.outerHTML)")


        $HTMLData.Add($CdataNode)
        $HTMLBlock.Add($HTMLData)
        $OEChildrenNode.Add($HTMLBlock)
    }
    }
}

$OutlineNode.Add($OEChildrenNode)

$x.AddAfterSelf( $OutlineNode )

$onenote.UpdatePageContent($xDoc.ToString())
```
