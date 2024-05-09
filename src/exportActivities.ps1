. ".\lib\Authentication.ps1"
. ".\lib\Activities.ps1"

Write-Host "Start export all strava activities"

# create the access token with createToken.ps1 in this directory
$accessToken = $Env:StravaAccessToken

$activities = Get-Strava-Activities -accessToken $accessToken

$activities | Export-Csv -Path "AllActivities.csv" -NoTypeInformation

Write-Host "Export done"
