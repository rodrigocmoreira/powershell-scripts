
GOTOSCRIPT
$enviromentObj = Get-Content -Raw '.\enviroment-vars.json' | Out-String | ConvertFrom-Json
popd
$enviromentObj.enviroments | 
foreach { 
  $currentEnv = $_; 
  [Environment]::SetEnvironmentVariable("$currentEnv.name", "$currentEnv.value", "User")
}

function GOTODEV {set-location $Env:DEVPATH}
function GOTOSPRINT {set-location $Env:SPRINTPATH}
function GOTOFAT {set-location $Env:FATPATH}

Write-Host "`nLocal dev enviroments loaded, available functions (GOTODEV,GOTOSPRINT, GOTOFAT)." -ForegroundColor Yellow

pushd "C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\Common7\Tools"
cmd /c "VsDevCmd.bat&set" |
foreach {
  if ($_ -match "=") {
    $v = $_.split("="); set-item -force -path "ENV:\$($v[0])"  -value "$($v[1])"
  }
}
popd
Write-Host "`nVisual Studio 2017 Command Prompt variables set." -ForegroundColor Yellow
