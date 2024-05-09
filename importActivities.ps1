. ".\lib\Authentication.ps1"
. ".\lib\Activities.ps1"

Write-Information "Start export all strava activities"
Write-Information "Get AccessToken from Authentication API"

# create the access token with createToken.ps1 in this directory
$accessToken = $Env:StravaAccessToken

# read csv to variable
$importedActivities = Import-Csv -Path "AllActivities.csv"

$counter = 1
$total = $importedActivities.Count

# update strava activities
foreach ($activity in $importedActivities) {

    Write-Host "Updating Activity $counter of $total"

    $body = @{
        # "commute"        = $commute
        # "trainer"        = $trainer
        # "hide_from_home" = $hide_from_home
        # "description"    = $description
        # "name"           = $name
        # "sport_type"     = $sport_type
        "gear_id" = $activity.gear_id

    }

    Update-StravaActivity -accessToken $accessToken -activityId $activity.id -body $body
    $counter++
}


