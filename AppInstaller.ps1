#     "CPUID.CPU-Z",
#     "Ubisoft.Uplay",
#     "WiresharkFoundation.Wireshark"
#  ) # | ForEach-Object {winget install -e --id $_}

$Browsers = [Ordered]@{
    "Google.Chrome"=1;
    "Mozilla.Firefox"=2;
    "LibreWolf.LibreWolf"=3
    "BraveSoftware.BraveBrowser"=4;
}
$Communication = [Ordered]@{
    "Discord.Discord"=1;
    "WhatsApp.WhatsApp"=2;
    "Mozilla.Thunderbird"=3;
    "Microsoft.Skype"=4;
    "SlackTechnologies.Slack"=5;
    "Microsoft.Teams"=6;
    "Zoom.Zoom"=7;
}
$Development = [Ordered]@{
    "Git.Git" = 1;
    "GitHub.Desktop" = 2;
    "Microsoft.VisualStudioCode"=3;
    "JetBrains.PyCharm.Professional"=4;
    "JetBrains.PyCharm.Community"=5;
    "OpenJS.Nodejs"=6;
    "Amazon.AWSCLI"=7;
    "Microsoft.WindowsTerminal"=8;
}
$Media = [Ordered]@{
    "Spotify.Spotify"=1;
    "CodecGuide.K-LiteCodecPack.Standard"=2;
    "qBittorrent.qBittorrent"=3;
}
$Gaming = [Ordered]@{
    "Valve.Steam" = 1;
    "Epic.EpicGamesLauncher" = 2;
}
$Utility = [Ordered]@{
    "7zip.7zip"=1;
    "RARLab.WinRAR"=2;
    "Greenshot.Greenshot"=3;
    "Microsoft.PowerToys"=4;
    "CPUID.CPU-Z"=5;
}
$Networking = [Ordered]@{
    "VMware.WorksationPlayer"=1;
    "WiresharkFoundation.Wireshark"=2;
}
$Apps = $Browsers, $Communication, $Development, $Media, $Gaming, $Networking, $Utility
$Cat_Names = "Browsers", "Communication", "Development", "Media", "Gaming", "Networking", "Utility"

$Final_Selection = @()
$i=0
foreach ($Set in $Apps) {
    "`n"
    $Cat_Names[$i]
    "=================="
    $Set #Print App and Number pairs to console
    # $Set.Keys | ForEach-Object {
    #     # "$($Set[$_]): '$_'"
    #     # $Selection = Read-Host "Enter App Numbers separated by commas or spaces:"
    #     # winget install -e -h --id $_
    # }
    $i += 1
}

