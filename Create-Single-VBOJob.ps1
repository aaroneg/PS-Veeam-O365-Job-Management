[CmdletBinding()]
PARAM(
        [Parameter(Mandatory=$True)][string]$SamAccountName
)
. $PSScriptRoot\initialize-VBO365.ps1
$UserAccount=Get-ADUser -Identity $SamAccountName
$VBOUser=Get-VBOOrganizationUser -Organization $VBOOrganization -Type User -Name $UserAccount.Name
$VBOItem=New-VBOBackupItem -User $VBOUser -Mailbox 
Add-VBOJob -Organization $VBOOrganization -Repository $VBORepository -SelectedItems $VBOItem -Name $VBOUser.DisplayName -RunJob