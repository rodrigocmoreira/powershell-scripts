
GOTOSCRIPT
$enviromentObj = Get-Content -Raw '.\enviroment-vars.json' | Out-String | ConvertFrom-Json
Pop-Location
$enviromentObj.enviroments | 
ForEach-Object { 
  $currentEnv = $_; 
  [Environment]::SetEnvironmentVariable($currentEnv.name, $currentEnv.value, "User")
}
function GOTODEV {set-location $Env:DEVPATH}
function GOTOSPRINT {set-location $Env:SPRINTPATH}
function GOTOFAT {set-location $Env:FATPATH}

Write-Host "`nLocal dev enviroments loaded, available functions (GOTODEV,GOTOSPRINT, GOTOFAT)." -ForegroundColor Yellow
Write-Host "`nNow Loading Visual Studios enviroment variables..." -ForegroundColor Yellow

Push-Location "$Env:FATPATH"
cmd /c "VsDevCmd.bat&set" |
ForEach-Object {
  if ($_ -match "=") {
    $v = $_.split("="); set-item -force -path "ENV:\$($v[0])"  -value "$($v[1])"
  }
}
Pop-Location
Write-Host "`nVisual Studio 2017 Command Prompt variables set." -ForegroundColor Yellow
