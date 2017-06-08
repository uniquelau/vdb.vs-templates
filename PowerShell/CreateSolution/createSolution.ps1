# Parameters 
Param (
    [Parameter(Mandatory=$true, HelpMessage="Your target directory should contain a trailing slash (e.g. c:\projects\) ")]
    $TARGETDIR,
    [Parameter(Mandatory=$true, HelpMessage="You must provide a company name. (e.g. contoso). This becomes the solution folder.")]
    $COMPANY,
    [Parameter(Mandatory=$true, HelpMessage="You must provide a project name. (e.g. banking). This becomes the project prefix. ")]
    $PROJECT,
    [Parameter(Mandatory=$true, HelpMessage="You must provide a company copyright notice. (e.g. Contoso Global Holdings Ltd, 2014.")]
    $COMPANYFULLNAME,
    $List = "ReplacementList.csv",
    $Find = '*_company_._project_*' ,
    $UpdateFiles = ('app.js' , '*.asax' , '*.csproj' , '*.cs' , '*.cshtml', '*.config' , '*.gitignore' , '*.md' , 'package.json' , '*.sln')
)


# Function for YES / NO logic
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
#set target dir to full path
$TARGETDIR = $TARGETDIR+"${COMPANY}.${PROJECT}"
#Set source dir
$SOURCEDIR = ".\2015\"


# Welcome logic
Write-Host "`n**********************************************************" -ForegroundColor Yellow
Write-Host "*`t`tAutomatic Visual Studio Solution Creation" -ForegroundColor Yellow
Write-Host "*" -ForegroundColor Yellow
Write-Host "*" -ForegroundColor Yellow -nonewline; Write-Host " Parameters"
Write-Host "*" -ForegroundColor Yellow -nonewline; Write-Host " Target Dir (-TARGET):`t`t" -nonewline; Write-Host "$TARGETDIR" -ForegroundColor DarkGreen
Write-Host "*" -ForegroundColor Yellow -nonewline; Write-Host " Company Name (-COMPANY):`t`t" -nonewline; Write-Host "$COMPANY" -ForegroundColor DarkGreen
Write-Host "*" -ForegroundColor Yellow -nonewline; Write-Host " Project Name (-PROJECT):`t`t" -nonewline; Write-Host "$PROJECT" -ForegroundColor DarkGreen
Write-Host "*" -ForegroundColor Yellow -nonewline; Write-Host " Full Name (-COMPANYFULLNAME):`t`t" -nonewline; Write-Host "$COMPANYFULLNAME" -ForegroundColor DarkGreen
Write-Host "*" -ForegroundColor Yellow
Write-Host "*" -ForegroundColor Yellow -nonewline; Write-Host " Solution name: " -nonewline; Write-Host "$COMPANY.$PROJECT" -ForegroundColor DarkGreen
Write-Host "*" -ForegroundColor Yellow
Write-Host "**********************************************************" -ForegroundColor Yellow
 
Ask-YesOrNo
if ($nresult -eq "$false") {exit}


#Create target dir
if (-not (test-path $TARGETDIR ) ) {
    write-host "$TARGETDIR  doesn't exist, creating it" -ForegroundColor Magenta
    md $TARGETDIR |out-null
} else {
    write-host $TARGETDIR  " exists, no need to create it" -ForegroundColor DarkGreen
}

#Copy source into target dir
write-host "Copying files" -ForegroundColor DarkGreen
cmd /c robocopy.exe $SOURCEDIR ${TARGETDIR} /e /nfl /ndl /njh /r:100 /w:1



# Rename files, that match $Find
Write-Host "Renaming matched files" -ForegroundColor Yellow

foreach ($sc in Get-ChildItem -Path $TARGETDIR -Filter $Find -Recurse | where { test-path $_.fullname -pathtype leaf} ) {
	
    Write-Host "Found $sc" -ForegroundColor DarkGreen
	
	Get-ChildItem $sc.FullName | foreach { 
		rename-item $_ $_.Name.Replace('_company_._project_', "${COMPANY}.${PROJECT}") 
	}

}

# Create an array that contains all the folders that should be renamed
Write-Host "Finding folders" -ForegroundColor Yellow
$folders = Get-ChildItem -Path $TARGETDIR -Filter $Find -recurse | Where-Object {$_.PSIsContainer -eq $True}  | Select-Object

# Reverse the array - we need to deal with the deepest items first!
if ($folders) {
    [array]::Reverse($folders)

    foreach ($folder in $folders) {
        $folder.Name
        $folder.FullName
        Write-Host "Renamed folder" -ForegroundColor DarkGreen
        Rename-Item $folder.FullName $folder.Name.Replace('_company_._project_', "${COMPANY}.${PROJECT}")
    } 
}


# Import Manual CSV into $ReplacementList variable, this is a useful extension point
$scriptPath = split-path -parent $MyInvocation.MyCommand.Definition 
$relativeList = $scriptPath + "\" + $List
$ReplacementList = Import-Csv $RelativeList;

# Handle replacements from our this Powershell's params
$_Company = New-Object PsObject -Property @{ OldValue = '_company_' ; NewValue = $COMPANY }
$_CompanyFullName = New-Object PsObject -Property @{ OldValue = '_companyfullname_' ; NewValue = $COMPANYFULLNAME }
$_Project = New-Object PsObject -Property @{ OldValue = '_project_' ; NewValue = $PROJECT }

# Dynamically create GUIDs
$_GUID1 = New-Object PsObject -Property @{ OldValue = '_guid0_' ; NewValue = [GUID]::NewGuid() }
$_GUID2 = New-Object PsObject -Property @{ OldValue = '_guid1_' ; NewValue = [GUID]::NewGuid() }
$_GUID3 = New-Object PsObject -Property @{ OldValue = '_guid2_' ; NewValue = [GUID]::NewGuid() }
$_GUID4 = New-Object PsObject -Property @{ OldValue = '_guid3_' ; NewValue = [GUID]::NewGuid() }
$_GUID5 = New-Object PsObject -Property @{ OldValue = '_guid4_' ; NewValue = [GUID]::NewGuid() }
$_GUID6 = New-Object PsObject -Property @{ OldValue = '_guid5_' ; NewValue = [GUID]::NewGuid() }

$ReplacementList += $_Company, $_CompanyFullName, $_Project, $_GUID1, $_GUID2, $_GUID3, $_GUID4, $_GUID5, $_GUID6

# Print out the replacement list
if ($debug) {
    Write-Host "Running 'Find and replace'" -ForegroundColor Yellow
    $ReplacementList
}

# Run through the files and update
# TODO :: Support ignoring certain folders, e.g. Umbraco_Client & Umbraco
Get-ChildItem -Path $TARGETDIR -Recurse -Include $UpdateFiles | 
ForEach-Object {

    Write-Host "Updating - $_" -ForegroundColor DarkGreen

    $Content = Get-Content -Path $_.FullName;
    foreach ($ReplacementItem in $ReplacementList)
    {
        $Content = $Content -Replace($ReplacementItem.OldValue, $ReplacementItem.NewValue)
    }
    Set-Content -Path $_.FullName -Value $Content
}

# Open Solution
Invoke-Item $TARGETDIR\src\${COMPANY}.${PROJECT}.sln

Write-Host "`n**********************************************************" -ForegroundColor Yellow
Write-Host "*`Your project is now setup." -ForegroundColor Yellow
Write-Host "*`Please run the Visual Studio solution." -ForegroundColor Yellow
Write-Host "*`Next install UmbracoCms using NuGet into the Web project." -ForegroundColor Yellow
Write-Host "*`Next install UmbracoCms.Core using NuGet into the Logic project." -ForegroundColor Yellow
Write-Host "*`See the README file for more details." -ForegroundColor Yellow
Write-Host "*`Tip: Do not override the log4net.config file" -ForegroundColor red
Write-Host "*`Tip: Now is a good time to make your initial Git commit!" -ForegroundColor red
Write-Host "`n**********************************************************" -ForegroundColor Yellow
