#
function Get-AppInstallation {

  param(
		[string]$ServerList,
		[switch]$Uninstall = $false 
	)
	
	$machines = Get-Content $ServerList

	foreach($comp in $machines) {
		Write-Host "--------------------------"
		Write-Host "+ Inventoring" $comp
		Write-Host "--------------------------"
		$app = gwmi -class win32_product -computer $comp -filter "name like '%fas%'"
		if($app -eq $true) {
			foreach($item in $app) {
					write-host $item.name $item.IdentifyingNumber
					if($Uninstall -eq $true) {
						$item.Uninstall()
					}
			}
		}
		else {
			Write-Host "[-] No application instance found." 
		}
	}
} #~end of function

Get-AppInstallation -ServerList machines.txt 
# Get-AppInstallation -ServerList machines.txt -Uninstall


