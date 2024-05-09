. ".\lib\Variables.ps1"

function Get-Strava-Token {
    [CmdletBinding()]
    param(
        # AppId of your strava app
        [Parameter(Mandatory)]
        [string] $client_id,

        # App Secret
        [Parameter(Mandatory)]
        [string] $client_secret,

        # App Code 
        [Parameter(Mandatory)]
        [string] $code 
    )

    process {

        $urlParameters = @{
            client_id     = $client_id
            client_secret = $client_secret
            code          = $code
            grant_type    = "authorization_code"
        }
        $urltocall = $tokenUrl
        Invoke-RestMethod -Uri $urltocall -Method Post -Body $urlParameters
    }
    
}

function Renew-Strava-AccessTokenWithRefreshToken {
    [CmdletBinding()]
    param(
        # AppId of your strava app
        [Parameter(Mandatory)]
        [string] $client_id,

        # App Secret
        [Parameter(Mandatory)]
        [string] $client_secret,

        # App Secret
        [Parameter(Mandatory)]
        [string] $refresh_token

    )

    process {

        $urlParameters = @{
            client_id     = $client_id
            client_secret = $client_secret
            refresh_token = $refresh_token
            grant_type    = "refresh_token"
        }
        $urltocall = $tokenUrl
        $response = Invoke-RestMethod -Uri $urltocall -Method Post -Body $urlParameters
        $response.access_token
    }
    
}
