$ErrorActionPreference = 'Stop'
$gra = Get-Content -LiteralPath 'steam/gra.json' -Raw | ConvertFrom-Json

$parametry = @{
    appid         = $gra.appid
    languages     = @('all')
    num_per_page  = 1
    purchase_type = 1
} | ConvertTo-Json -Compress

$uri = 'https://api.steampowered.com/IUserReviewsService/GetAppReviews/v1/'
$dane = Invoke-RestMethod -Uri $uri -Body @{ input_json = $parametry } -UseBasicParsing -TimeoutSec 20
$podsumowanie = $dane.response.query_summary

Write-Output "$($gra.nazwa) | Ocena: $($podsumowanie.review_score_desc) | Liczba recenzji: $($podsumowanie.total_reviews)"
