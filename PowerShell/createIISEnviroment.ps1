<# 
.SYNOPSIS       CreateWebsite - Automatic website creation. 
.DESCRIPTION  	Allow to create a website and its ApplicationPool. Some tuning is included 
.PARAMETER 		SiteName		Defines the display name (in IIS Manager) of the website
								Mandatory parameter. 
.PARAMETER 		Port			Defines the listening port for the website     
								Default is "80". 
.PARAMETER		Environment		Defines the website environment. 
								This will be added as suffix in the website display name     
								Possible values are "LIVE", "STAGING", "UAT", "QUAL" or "DEV"     
								Default is "LIVE". 
.PARAMETER		Identity		Defines the identity type to be used for the ApplicationPool
								Possible values are "0" (LocalSystem), "1" (LocalService), "2" (NetworkService), 
								"3" (SpecificUser) or "4" (ApplicationPoolIdentity)     
								Default is "4" (ApplicationPoolIdentity). 
.PARAMETER		Runtime			Defines the Managed Runtime to be used for the ApplicationPool
								Possible values are "1.1", "2.0" or "4.0"
								Default is "4.0".
.PARAMETER		Pipeline		Defines the Managed Pipeline Mode to be used for the ApplicationPool
								Possible values are 
								"Classic" = 1
								"Integrated" = 0
								Default is "Integrated".
.PARAMETER		Computer		Computer name, default %Computer%
.PARAMETER		InetFolder		Default location that contains each website (normally c:\inetpub, d:\inetpubs, or d:\webs)
.PARAMETER		Domain			Default top-level domain used to build default hostname.
.PARAMETER		Hostname		Defines the URL the website reponds to. Default 'http://$SiteName-$Enviroment.$Computer.$Domain'
.PARAMETER		EnvironmentHostName	Default 'http://$SiteName.$Environment.$Domain'
.PARAMETER		VDirName		Name for the Virtual Directory (e.g. Media)
.PARAMETER		FileShare		Location of your File Share
.PARAMETER		VDirPath		Default $SiteName-$Environment\$VDirName\
.NOTES			File Name  : CreateWebsite.ps1     
				Remixed by  : Laurence Gillian lau@voodoobytes.co.uk
				Orginal production by : Fabrice ZERROUKI - fabricezerrouki@hotmail.com 
				
 
.EXAMPLE     PS D:\>CreateWebsite.ps1 -SiteName TESTSITE
		
		Creates a website named 'testsite-LIVE', listening on the TCP80 port (default value), responding to 'http://$SiteName-$Enviroment.$Computer.$Domain' (default value). The associated ApplicationPool 'testsite' running with the identity 'ApplicationPoolIdentity' (default value), v4.0 .NET Framework managed runtime (default value) and 'Integrated' managed pipeline mode (default value).
 
.EXAMPLE	PS D:\>CreateWebsite.ps1 -SiteName TESTSITE -Port 8080 -Environment PREPROD -Runtime 2.0 -Pipeline Classic
		
		Creates a website named 'testsite-PREPROD', listening on the TCP8080 port. The associated ApplicationPool 'testsite' running with the identity 'ApplicationPoolIdentity' (default value), v2.0 .NET Framework managed runtime and 'Classic' managed pipeline mode.
		
		By default the site is binded to
		
		http://$SiteName-$Environment.$Computer.$Domain
		http://$SiteName.$Environment.$Domain
 
.EXAMPLE     PS D:\>CreateWebsite.ps1 -SiteName TESTSITE -VDirName Media
 
		Creates a website named TESTSITE-LIVE, with a virtual directory for Media, 
		that points at $FileShare\$VDirPath
		
		e.g.
		
		192.168.1.1\TESTSITE-LIVE\Media
		
#>
 
 
Param(
    [Parameter(Mandatory=$true, HelpMessage="You must provide a display name for the website.")]
    $SiteName,
    $Port="80",
    [ValidateSet("LIVE", "STAGING", "UAT", "QUAL", "DEV")]
    $Environment="LIVE",
    [ValidateSet("0", "1", "2", "3", "4")]
    $Identity="4",
    [ValidateSet("v1.1", "v2.0", "v4.0")]
    $Runtime="v4.0",
    [ValidateSet("1", "0")]
    $Pipeline="0",
	$Computer=$env:COMPUTERNAME,
	$InetFolder="z:\webs",
	$Domain="voodoobytes.net",
	[ValidatePattern("([\w-]+\.)+[\w-]+(/[\w- ;,./?%&=]*)?")]
    $HostName="$SiteName-$Environment" + ".$Computer" + ".$Domain",
	$EnvironmentHostName="$SiteName.$Environment.$Domain",
	$VDirName="",
	$FileShare="\\192.168.1.1\",
	$VDirPath="$SiteName-$Environment\$VDirName\"
    )
 
switch ($Identity)
    {
        0 {$FullIdentity="LocalSystem"}
        1 {$FullIdentity="LocalService"}
        2 {$FullIdentity="NetworkService"}
        3 {$FullIdentity="SpecificUser"}
        4 {$FullIdentity="ApplicationPoolIdentity"}
    }
 
Function Ask-YesOrNo
{
param([string]$title="Confirmation needed.",[string]$message="Parameters that will be used by the script are listed above.`nIf you want to modify one or more parameter, please restart the script and specify the wanted parameters.`nAny not defined parameter uses its default value.`r`nDo you want to continue with the above parameters?`n")
$choiceYes = New-Object System.Management.Automation.Host.ChoiceDescription "&Yes", "Answer Yes."
$choiceNo = New-Object System.Management.Automation.Host.ChoiceDescription "&No", "Answer No."
$options = [System.Management.Automation.Host.ChoiceDescription[]]($choiceYes, $choiceNo)
$nresult = $host.ui.PromptForChoice($title, $message, $options, 1)
switch ($nresult)
    {
        0 {"OK, we can continue..."}
        1 {"Bye bye!" ; exit}
    }
}
 
Write-Host "`n**********************************************************" -ForegroundColor Yellow
Write-Host "*`t`tAutomatic Website Creation" -ForegroundColor Yellow
Write-Host "*" -ForegroundColor Yellow
Write-Host "*" -ForegroundColor Yellow -nonewline; Write-Host " Parameters"
Write-Host "*" -ForegroundColor Yellow -nonewline; Write-Host " Website Name (-SiteName):`t`t" -nonewline; Write-Host "$SiteName" -ForegroundColor DarkGreen
Write-Host "*" -ForegroundColor Yellow -nonewline; Write-Host " Website Port (-Port):`t`t`t" -nonewline; Write-Host "$Port" -ForegroundColor DarkGreen
Write-Host "*" -ForegroundColor Yellow -nonewline; Write-Host " Website Environment (-Environment):`t" -nonewline; Write-Host "$Environment" -ForegroundColor DarkGreen
Write-Host "*" -ForegroundColor Yellow -nonewline; Write-Host " AppPool Identity (-Identity):`t`t" -nonewline; Write-Host "$FullIdentity ($Identity)" -ForegroundColor DarkGreen
Write-Host "*" -ForegroundColor Yellow -nonewline; Write-Host " Managed Runtime (-Runtime):`t`t" -nonewline; Write-Host "$Runtime" -ForegroundColor DarkGreen
Write-Host "*" -ForegroundColor Yellow -nonewline; Write-Host " Managed Pipeline Mode (-Pipeline):`t" -nonewline; Write-Host "$Pipeline" -ForegroundColor DarkGreen
Write-Host "*" -ForegroundColor Yellow -nonewline; Write-Host " Computer Name (-Computer):`t`t" -nonewline; Write-Host "$Computer" -ForegroundColor DarkGreen
Write-Host "*" -ForegroundColor Yellow -nonewline; Write-Host " Inetpub Folder (-InetFolder):`t`t" -nonewline; Write-Host "$InetFolder" -ForegroundColor DarkGreen
Write-Host "*" -ForegroundColor Yellow -nonewline; Write-Host " Top Level Domain (-Domain):`t`t" -nonewline; Write-Host "$Domain" -ForegroundColor DarkGreen
Write-Host "*" -ForegroundCOlor Yellow
Write-Host "*" -ForegroundColor Yellow -nonewline; Write-Host " Website Hostname (-HostName):`t`t" -nonewline; Write-Host "$HostName" -ForegroundColor DarkGreen
Write-Host "*" -ForegroundColor Yellow -nonewline; Write-Host " Environment (-EnvironmentHostName):`t" -nonewline; Write-Host "$EnvironmentHostName" -ForegroundColor DarkGreen
Write-Host "*" -ForegroundCOlor Yellow
if ($VDirName) {
Write-Host "*" -ForegroundColor Yellow -nonewline; Write-Host " Virtual Directory Name (-VDirName):`t" -nonewline; Write-Host "$VDirName" -ForegroundColor DarkGreen
Write-Host "*" -ForegroundColor Yellow -nonewline; Write-Host " File Share (-FileShare):`t`t" -nonewline; Write-Host "$FileShare" -ForegroundColor DarkGreen
Write-Host "*" -ForegroundColor Yellow -nonewline; Write-Host " Virtual Directory Path (-VDirPath):`t" -nonewline; Write-Host "$VDirPath" -ForegroundColor DarkGreen
}
Write-Host "*" -ForegroundColor Yellow
Write-Host "**********************************************************" -ForegroundColor Yellow
 
Ask-YesOrNo
if ($nresult -eq "$false") {exit}
 
if ($Identity -eq "3") {
$AppPoolUser=Read-Host "`nPlease provide username for the ApplicationPool identity"
$AppPoolPwd=Read-Host "Please provide the password for '$AppPoolUser' user" -AsSecureString
}
 
function Read-Choice {
    Param(
        [System.String]$Message,
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [System.String[]]$Choices,
        [System.Int32]$DefaultChoice=1,
        [System.String]$Title=[string]::Empty
    )
    [System.Management.Automation.Host.ChoiceDescription[]]$Poss=$Choices | ForEach-Object {
        New-Object System.Management.Automation.Host.ChoiceDescription "&$($_)", "Sets $_ as an answer."
    }
    $Host.UI.PromptForChoice($Title, $Message, $Poss, $DefaultChoice)
}
 
function Select-IPAddress {
    [cmdletbinding()]
    Param(
        [System.String]$ComputerName='localhost'
    )
    $IPs=Get-WmiObject -ComputerName $ComputerName -Class Win32_NetworkAdapterConfiguration -Filter "IPEnabled='True'" | ForEach-Object {
        $_.IPAddress
    } | Where-Object {
        $_ -match "^(([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])$"
    }
 
    if($IPs -is [array]){
        Write-Host "`nServer $ComputerName uses these IP addresses:"
        $IPs | ForEach-Object {$Id=0} {Write-Host "${Id}: $_" -ForegroundColor Yellow; $Id++}
        $IPs[(Read-Choice -Message "`nChoose an IP Address" -Choices (0..($Id-1)) -DefaultChoice 0)]
    }
    else{$IPs}
}
$ChosenIP=Select-IPAddress
Write-Host "`nThe selected IP address is: $ChosenIP`n" -ForegroundColor DarkGreen
 
# Combine SiteName and Enviroment
$SiteNameEnvironment = "$SiteName-$Environment"
# Create the website directory
Write-Host "Creating application directory" -ForegroundColor Yellow
$PROJECTPath = "$InetFolder" + "\" + "$SiteNameEnvironment"
$SitePath = "$PROJECTPath" + "\wwwroot\"
if (!(Test-Path $SitePath)) {
    New-Item -ItemType Directory -Path $SitePath
}
 
# Creates the website logfiles directory
Write-Host "Creating application logfiles directory" -ForegroundColor Yellow
$SiteLogsPath = "$PROJECTPath" + "\logs\"
if (!(Test-Path $SiteLogsPath)) {
    New-Item -ItemType Directory -Path $SiteLogsPath
}
 
Import-Module "WebAdministration" -ErrorAction Stop
 
# Creates the ApplicationPool
Write-Host "Creating website application pool" -ForegroundColor Yellow
New-WebAppPool –Name $SiteNameEnvironment -Force
Set-ItemProperty ("IIS:\AppPools\" + $SiteNameEnvironment) -Name processModel.identityType -Value $Identity
if ($Identity -eq "3") {
Set-ItemProperty ("IIS:\AppPools\" + $SiteNameEnvironment) -Name processModel.username -Value $AppPoolUser
Set-ItemProperty ("IIS:\AppPools\" + $SiteNameEnvironment) -Name processModel.password -Value $AppPoolPwd
}
Set-ItemProperty ("IIS:\AppPools\" + $SiteNameEnvironment) -Name "managedRuntimeVersion" -Value $Runtime
Set-ItemProperty ("IIS:\AppPools\" + $SiteNameEnvironment) -Name "managedPipelineMode" -Value $Pipeline
 
 
# Creates the website
Write-Host "Creating website" -ForegroundColor Yellow
New-Website –Name $SiteNameEnvironment -Port $Port –HostHeader $HostName -IPAddress $ChosenIP -PhysicalPath $SitePath -ApplicationPool $SiteNameEnvironment -Force
Set-ItemProperty ("IIS:\Sites\" + $SiteNameEnvironment) -Name logfile.directory -Value $SiteLogsPath
# Add additional bindings
Write-Host "Adding environment binding" -ForegroundColor Yellow
New-WebBinding -Name $SiteNameEnvironment -Port $Port -IPAddress $ChosenIP -HostHeader $EnvironmentHostName -Force
 
# Create Virtual Directory that points at a FileShare/SAN/NAS, etc
# Must point to existing path, so FileShare + VDirPath
if ($VDirName -and $FileShare) {
	# If Directory doesn't exist then create it
	if (!(Test-Path $FileShare\$VDirPath)) {
    New-Item -ItemType Directory -Path $FileShare\$VDirPath
	}
	Write-Host "Creating a virtual directory" -ForegroundColor Yellow
	New-WebVirtualDirectory -Site $SiteNameEnvironment -Name $VDirName -PhysicalPath $FileShare\$VDirPath
}
  
Start-WebAppPool -Name $SiteNameEnvironment
Start-WebSite $SiteNameEnvironment
 
Write-Host "Excellent!!!" -ForegroundColor DarkGreen
Write-Host "Website $SiteNameEnvironment created!" -ForegroundColor DarkGreen
