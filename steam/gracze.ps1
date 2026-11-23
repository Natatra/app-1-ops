$ErrorActionPreference = 'Stop'
$gra = Get-Content -LiteralPath 'steam/gra.json' -Raw | ConvertFrom-Json
$uri = "https://api.steampowered.com/ISteamUserStats/GetNumberOfCurrentPlayers/v1/?appid=$($gra.appid)"
$dane = Invoke-RestMethod -Uri $uri -UseBasicParsing -TimeoutSec 20
Write-Output "$($gra.nazwa) ($($gra.appid)) | gracze teraz: $($dane.response.player_count)"
