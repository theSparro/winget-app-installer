$Browsers = @(
    ("Google.Chrome",1),
    ("Mozilla.Firefox",2),
    ("LibreWolf.LibreWolf",3),
    ("BraveSoftware.BraveBrowser",4)
)
$Communication = @(
    ("Discord.Discord", 1),
    ("WhatsApp.WhatsApp", 2),
    ("Mozilla.Thunderbird", 3),
    ("Microsoft.Skype", 4),
    ("SlackTechnologies.Slack", 5),
    ("Microsoft.Teams", 6),
    ("Zoom.Zoom", 7)
)
$Development = @(
    ("Git.Git", 1),
    ("GitHub.Desktop", 2),
    ("Microsoft.VisualStudioCode", 3),
    ("JetBrains.PyCharm.Professional", 4),
    ("JetBrains.PyCharm.Community", 5),
    ("OpenJS.Nodejs", 6),
    ("Amazon.AWSCLI", 7),
    ("Microsoft.WindowsTerminal", 8)
)
$Media = @(
    ("Spotify.Spotify", 1),
    ("CodecGuide.K-LiteCodecPack.Standard", 2),
    ("qBittorrent.qBittorrent", 3)
)
$Gaming = @(
    ("Valve.Steam", 1),
    ("Epic.EpicGamesLauncher", 2)
)
$Utility = @(
    ("7zip.7zip", 1),
    ("RARLab.WinRAR", 2),
    ("Greenshot.Greenshot", 3),
    ("Microsoft.PowerToys", 4),
    ("CPUID.CPU-Z", 5)
)
$Networking = @(
    ("VMware.WorksationPlayer", 1),
    ("WiresharkFoundation.Wireshark", 2)
)
$Apps = $Browsers, $Communication, $Development, $Media, $Gaming, $Networking, $Utility
$Cat_Names = "Browsers", "Communication", "Development", "Media", "Gaming", "Networking", "Utility"

$Final_Selection = @()
$i=0
Write-Host "Select Apps from each category that you would like to install.`nLeave empty to skip."
foreach ($Set in $Apps) {
    "`n"
    $Cat_Names[$i]
    "====================="
    #Print App and Number pairs to console
    $Set | ForEach-Object {
        Write-Host $_[1], ".", $_[0] -BackgroundColor DarkGreen -ForegroundColor White
    }
    "`n" 
    $AppNumbers = Read-Host "Enter App Numbers separated by spaces: " 
    $AppNumbers -split " " | ForEach-Object {
        $Final_Selection += ($Set[$_-1][0])
    }
    $i += 1
}
Write-Host "`n====================="
Write-Host "Finished Selection..."
Write-Host "These are your selected apps:" -BackgroundColor DarkRed -ForegroundColor White
Write-Host  $Final_Selection -Separator "`n"
if (Read-Host "`nProceed? Y/n" == "n") {
    Exit-PSSession
} 
else {
    foreach ($App in $Final_Selection) {
        Write-Host "Installing" $_ 
        winget install -e -h --id $_
    }
}
# Wait for input before closing.
if ($Host.Name -eq "ConsoleHost") {
    Write-Host "Press any key to continue..."
    $Host.UI.RawUI.FlushInputBuffer()   # Make sure buffered input doesn't "press a key" and skip the ReadKey().
    $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyUp") > $null
}