Write-Host "Importing Authentication.ps1..."
. ".\\lib\\Authentication.ps1"
Write-Host "Authentication.ps1 imported."

Write-Host "Importing Activities.ps1..."
. ".\\lib\\Activities.ps1"
Write-Host "Activities.ps1 imported."

Write-Host "Start export all strava activities"

# create the access token with createToken.ps1 in this directory
$accessToken = $Env:StravaAccessToken

$activities = Get-StravaActivities -accessToken $accessToken

$activities | Export-Csv -Path "AllActivities.csv" -NoTypeInformation

Write-Host "Export done"
