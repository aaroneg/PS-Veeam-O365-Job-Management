$Servername=HOSTNAME.EXE
try {Connect-VBOServer -Server $Servername } catch {}
$VBOOrganization=(Get-VBOOrganization)[0]
$VBORepository=Get-VBORepository