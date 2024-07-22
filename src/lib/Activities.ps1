. ".\lib\Variables.ps1"

# Not all properties of a activity can be updated
# Only the props listed below are updateable

# ATTENTION: Please make sure that your updates are correct. The changes cannot be undone in strava
function Update-StravaActivity {
    [CmdletBinding()]
    param(
        # AppId of your strava app
        [Parameter(Mandatory)]
        [string] $accessToken,

        # Id of the Activity
        [Parameter(Mandatory)]
        [string] $activityId,

        # Object holds updatable properties of the activity
        [Parameter(Mandatory)]
        [System.Object] $body

        # [Parameter(Mandatory)]
        # [bool] $commute,

        # [Parameter(Mandatory)]
        # [bool] $trainer, 

        # [Parameter(Mandatory)]
        # [bool] $hide_from_home, 

        # [Parameter(Mandatory)]
        # [string] $description,

        # [Parameter(Mandatory)]
        # [string] $name,

        # [Parameter(Mandatory)]
        # [string] $sport_type,

        # [Parameter(Mandatory)]
        # [string] $gear_id
 
    )

    process {

        Write-Host "Updating Activity with id: $activityId"

        $header = @{
            "Authorization" = "Bearer $accessToken"
            "Content-Type"  = "application/json"
        }

        $url = $apiBaseUrl + $apiActivityUrlRoute + "/" + $activityId

        $body = $body | ConvertTo-JSON

        $result = Invoke-RestMethod -Method PUT -Uri $url -Headers $header -Body $body

        Start-Sleep -Seconds 10
    }
    
}
<<<<<<< Updated upstream
=======

# Function to get all activities
function Get-StravaActivities {
    [CmdletBinding()]
    param (
        [string]$accessToken,
        [int]$pageSize = 200,
        [int]$maxPages = 10
    )

    $allActivities = @()
    for ($page = 1; $page -le $maxPages; $page++) {
        $uri = "https://www.strava.com/api/v3/athlete/activities?access_token=$accessToken&per_page=$pageSize&page=$page"
        $activities = Invoke-RestMethod -Uri $uri -Method Get

        if ($activities.Count -eq 0) {
            break
        }

        $allActivities += $activities
    }

    return $allActivities
}
>>>>>>> Stashed changes
