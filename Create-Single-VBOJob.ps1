[CmdletBinding()]
PARAM(
        [Parameter(Mandatory=$True)][string]$SamAccountName
)
. $PSScriptRoot\initialize-VBO365.ps1
$UserAccount=Get-ADUser -Identity $SamAccountName
$VBOUser=Get-VBOOrganizationUser -Organization $VBOOrganization -Type User -Name $UserAccount.Name
$VBOItem=New-VBOBackupItem -User $VBOUser -Mailbox 
# If you want the job to run immediately, uncomment '-RunJob' on the next line.
Add-VBOJob -Organization $VBOOrganization -Repository $VBORepository -SelectedItems $VBOItem -Name $VBOUser.DisplayName # -RunJob
