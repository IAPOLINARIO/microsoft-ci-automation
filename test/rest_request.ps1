$JSON = @'
{
    "user":"Test",
    "content":"Test",
    "timestamp":"2016-12-16T02:00:00Z"
}
'@

$response = Invoke-RestMethod -Uri $api_endpoint -Method Post -Body $JSON -ContentType "application/json"
