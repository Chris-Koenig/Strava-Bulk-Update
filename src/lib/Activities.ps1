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

function Update-Strava-Activity {

}