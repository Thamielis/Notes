function Send-Mail {
    [CmdletBinding()]
    param (
        [Parameter()]
        [String] $SMTPServer = 'atklmail01.kostweingroup.intern',
        [Parameter()]
        [String] $From = 'SyncSage2AD@kostwein.at',
        [Parameter()]
        [String] $To = 'Administrator@kostwein.at',
        [Parameter()]
        [String] $Subject = 'Test',
        [Parameter()]
        [String] $Body = 'TestMail',
        [Parameter()]
        [String] $Attachment
    )

    $MellunigM = 'mario.mellunig@kostwein.at'
    $PetritschS = 'sabrina.petritsch@kostwein.at'

    # Erstelle das Mail-Objekt
    $MailMessage = [System.Net.Mail.MailMessage]::new()
    $MailMessage.from = $From
    $MailMessage.To.Add($To)
    $MailMessage.To.Add($MellunigM)
    $MailMessage.To.Add($PetritschS)
    $MailMessage.Subject = $Subject
    $MailMessage.BodyEncoding = [System.Text.Encoding]::UTF8
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
        Write-Log -Level INFO -Message "E-Mail erfolgreich gesendet an $To"
    }
    catch {
        Write-Host -Level ERROR -Message "Fehler beim Senden der E-Mail: $_"
    }

    Wait-Logging
}
