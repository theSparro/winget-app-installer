$MyAppsList = (
    "Discord.Discord"
 )


$InstalledApps = winget list
$InstalledApps = $InstalledApps -join ', '
$MyAppsList | ForEach-Object {
    if ($_ -in $InstalledApps) {
        "$_ is already installed."
        "Attempting to Upgrade"
        winget upgrade -h -e --id $_
    }
    # else {
    #     "Installing $_"
    #     winget install -e -h --id $_
    # }
}