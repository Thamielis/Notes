function Build-MailBody {
    [CmdletBinding()]
    param (
        [Parameter()]
        $NewSageADGroups
    )
    
    $HTMLContent = foreach ($GroupName in $NewSageADGroups) {
        @"
        <p class=MsoNormal style='text-indent:35.4pt'>
            <span>
                $GroupName
            </span>
            <o:p></o:p>
        </p>

"@
    }

    $Body = @"
<body lang=DE-AT link="#0563C1" vlink="#954F72">
    <div class=WordSection1>
        <p class=MsoNormal>
            <b>
                <span>
                    Neu angelegte Sage AD Gruppen: 
                    <o:p></o:p>
                </span>
            </b>
        </p>
$HTMLContent
        <p class=MsoNormal>
            <o:p>&nbsp;</o:p>
        </p>
    </div>
</body>
"@

    return $Body
}
