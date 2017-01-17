$JSON = @'
{
    "user":"iapolinario",
    "content":"iapolinario",
    "timestamp":"2017-01-16T02:00:00Z"
}
'@

$response = Invoke-RestMethod -Uri $api_endpoint -Method Post -Body $JSON -ContentType "application/json"
