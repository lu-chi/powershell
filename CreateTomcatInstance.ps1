
$configFile = "configuration.xml"

# xml processing 
$data = [xml](Get-Content $configFile)

function CreateTomcatInstance {
   <#
	 .SYNOPSIS
	 This script creates a defined amount of Topfas instances.
	 The whole configuration can be found in configuration.xml file
	 .OPTIONS
	 -CreateConfig
	 -Config
	 .PARAMETER None
	 .EXAMPLE
	 Tomcat-Cofigurator -CreateConfig
	 This example will create an empty configuraton template. If no name will be provided, 
	 configuration file will be default
	 .EXAMPLE
	 Tomcat-Cofigurator -Config
	 This example will use a given configuration file. If no parameter or no option will be provided 
	 the default configuration.xml file will be used

	 #>
	$ParenTomcatPath = $data.config.tomcat.path
	$instanceGroupName = $data.config.tomcat.instances.group
	$instanceGroupPath = $data.config.tomcat.instances.path
	$nodes = $data.config.tomcat.instances.instance
	
	Write-Output "Tomcat path: $ParenTomcatPath"
	Write-Output "Instance group name: $instanceGroupName"
	Write-Output "Instance group parh: $instanceGroupPath"
	
	$InstanceDestPath = $instanceGroupPath + "\" + $instanceGroupName
	
	$instance = New-Item -ItemType directory -Path $InstanceGroupPath -Name $instanceGroupName
	
	Write-Output "Instance destination path: $Instance"
	Get-ChildItem $instance
	

#
#	foreach ($node in $data.config.tomcat.instances.instance) {
#		New-Item -ItemType directory -path $instance -Name $node.name
#
#	}	
}

CreateTomcatInstance
