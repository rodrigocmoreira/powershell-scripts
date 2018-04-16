# powershell-scripts

PowerShell scripts to improve overal perfomance with .net stardand development (at least IMHO)

I will add new ones as soon as I create or discover new ones.

I recomend to use some script like this to start some very initial procedures:

This script should be located in C:\Users\<userName>\Documents\WindowsPowerShell and named "Microsoft.PowerShell_profile.ps1" (if already exists, just add this lines in the end)

```powershell

$Env:SCRIPTSPATH = "C:\git\powershell-scripts"

function GOTOSCRIPT {set-location $Env:SCRIPTSPATH}

function LoadProfile { C:\git\powershell-scripts\Dev-Profile.ps1 }

```

With these scripts I can use the following for example:

## (To build a solution)

GOTODEV | msbuild $Env:Variable /m /t:rebuild
GOTODEV | msbuild $Env:Variable /m /t:clean
GOTODEV | msbuild $Env:Variable /m /t:clean

## (To get latest from tfs)

GOTOSPRINT | tf get . /Recursive

## (To run unit tests from certain project)

GOTODEV | MSTest /testcontainer:$Env:Variable
