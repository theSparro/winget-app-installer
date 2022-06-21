$MyAppsList = (
    "Discord.Discord"
 )

winget list | Out-File -FilePath .\Apps.txt

$AppsString = ""
$AppFile = Get-Content -Path .\Apps.txt 
$AppFile | ForEach-Object {
    $AppsString += $_
}
$AppsString = $AppsString -split " "
$MyAppsList | ForEach-Object {
    if ($_ -in $AppsString) {
        "$_ is already installed."
        "Attempting to Upgrade"
        winget upgrade -h -e --id $_
    }
    else {
        "Installing $_"
        winget install -e -h --id $_
    }
}