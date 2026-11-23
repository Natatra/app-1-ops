$ErrorActionPreference = 'Stop'
$gra = Get-Content -LiteralPath 'steam/gra.json' -Raw | ConvertFrom-Json
$uri = "https://api.steampowered.com/ISteamNews/GetNewsForApp/v2/?appid=$($gra.appid)&count=1&maxlength=300&feeds=steam_community_announcements"
$dane = Invoke-RestMethod -Uri $uri -UseBasicParsing -TimeoutSec 20
$news = $dane.appnews.newsitems[0]
Write-Output "$($gra.nazwa) | $($news.title) | $($news.url)"
