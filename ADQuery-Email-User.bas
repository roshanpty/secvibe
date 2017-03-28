#This script can be used to query the Active Directory to get a list of usernames corresponding to a list of email addresses on domain.

Param(
  [string]$InputFile,
  [string]$OutFile
)

Import-Module ActiveDirectory

$EmailFile = Import-CSV -Path $InputFile

$Output = foreach($i in $EmailFile)
    {
    $var=$i.email
    Get-ADUser -Filter {UserPrincipalName -like $var} | Select samaccountname
    }
    
$Output | Export-CSV $OutFile
