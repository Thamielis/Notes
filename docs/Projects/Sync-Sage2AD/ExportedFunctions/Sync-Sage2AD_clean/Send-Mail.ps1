function Send-Mail {
    [CmdletBinding()]
    param (
        [Parameter()]
        [String] $SMTPServer = 'atklmail01.kostweingroup.intern',
        [Parameter()]
        [String] $From = 'SyncSage2AD@kostwein.at',
        [Parameter()]
        [String] $To = 'Mario.Mellunig@kostwein.at',
        [Parameter()]
        [String] $Subject = 'Test',
        [Parameter()]
        [String] $Body = 'TestMail',
        [Parameter()]
        [String] $Attachment,
        [switch] $Ticket
    )


    # Erstelle das Mail-Objekt
    $MailMessage = [System.Net.Mail.MailMessage]::new()
    $MailMessage.from = $From
    $MailMessage.To.Add($To)
    if ($Ticket) {
        $MailMessage.To.Add('Administrator@kostwein.at')
    }
    $MailMessage.Subject = $Subject
    $MailMessage.Body = $Body
    $MailMessage.IsBodyHtml = $true
    
    if ($Attachment) {
        $MailMessage.Attachments.Add($Attachment)
    }

    # Erstelle das SMTP-Client-Objekt
    $SmtpClient = [System.Net.Mail.SmtpClient]::new()
    $SmtpClient.Host = $SmtpServer
    $SmtpClient.UseDefaultCredentials = $true

    # Sende die E-Mail
    try {
        $SmtpClient.Send($MailMessage)
        Write-Host "E-Mail erfolgreich gesendet an $To"
    }
    catch {
        Write-Host "Fehler beim Senden der E-Mail: $_"
    }
}
