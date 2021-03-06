$MyAppsList = (
    "Discord.Discord"
 )

winget list | Out-File -FilePath .\Apps.txt

$AppsString = ""
$AppFile = Get-Content -Path .\Apps.txt 
$AppFile | ForEach-Object {
    $AppsString += $_
}
Remove-Item .\Apps.txt
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
# Wait for input before closing.
if ($Host.Name -eq "ConsoleHost") {
    Write-Host "Press any key to continue..."
    $Host.UI.RawUI.FlushInputBuffer()   # Make sure buffered input doesn't "press a key" and skip the ReadKey().
    $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyUp") > $null
}