  <#
 .SYNOPSIS
	 Script to search for new files updated in specified folder.
.DESCRIPTION 
    This script checks to see if a staticly named file exist in the path given.
	If the file exist it will be copied to the dedicated location.    
.NOTES 
    File Name  : Scan-Folder.ps1 
    Author     : Lukasz Chmielewski	
    Requires   : PowerShell V2 
 .PARAMETER FileName
 	None
 .PARAMETER From
 	None
 .PARAMETER To
 	None
 .PARAMETER Action
 	None
 .EXAMPLE
	 .\Scan-Folder -FileName <file> -From <source> -To <destination>
	 This example will look for <file> file in <source> folder 
	 and once <file> located the script will automaticaly copy that to <destination>.
#>
function Scan-Folder {
	param(
		[string]$FileName,
		[string]$From,
		[string]$To
		)
		while ($true) {
			if((Test-Path (Join-Path $From $FileName)) -eq $true) {
				Write-Output "[+] (Get-date)Found {$FileName} file in source folder."
				if((Test-Path (Join-Path $To $FileName)) -eq $false) {
					Copy-Item (Join-Path $From $FileName) $To
				} else {
					Write-Warning "[!] File {$FileName} already exist."
				}
			} else {
				Write-Error "[-] File {$FileName} not found."
			}
			Start-Sleep -Seconds 5
		}
}

# Scan-Folder -FileName "<file>" -From "<source>" -To "<destination>"


################################################################################################################################
# $File = Get-ChildItem $Path | Where { $_.LastWriteTime -ge [datetime]::Now.AddMinutes(-10) }
#$conflicted = Get-ChildItem E:\Dropbox -Recurse -Filter "*conflicted copy*" | Foreach-Object {$_.FullName}
#if($conflicted)
#{
#    $body = $conflicted | Out-String
#    Send-MailMessage -SmtpServer srv1 -From you@domain.com -To boss@domain.com -Subject 'conflicted copy files' -Body $body
#}

