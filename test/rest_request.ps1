$JSON = @'
{
    "user":"Test",
    "content":"Test",
    "timestamp":"2016-12-16T02:00:00Z"
}
'@

$response = Invoke-RestMethod -Uri "http://localhost:5000/v1/worker" -Method Post -Body $JSON -ContentType "application/json"
