. ".\lib\Authentication.ps1"

# Take the secret from your  strava app registration
$client_secret = "" 

#  Take the client id from your  strava app registration
$client_id = ""

# Take the code from step 2 in the readme.md
$code = ""

$tokens = Get-Strava-Token -client_id $client_id -client_secret $client_secret -code $code

# Save the access token to an environment variable.
$Env:StravaAccessToken = $tokens.access_token
