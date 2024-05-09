. ".\lib\Authentication.ps1"
. ".\lib\Activities.ps1"

Write-Information "Start export all strava activities"
Write-Information "Get AccessToken from Authentication API"

# create the access token with createToken.ps1 in this directory
$accessToken = $Env:StravaAccessToken

$activities = Get-Strava-Activities -accessToken $accessToken

$activities | Export-Csv -Path "AllActivities.csv" -NoTypeInformation
