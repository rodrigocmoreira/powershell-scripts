# powershell-scripts

PowerShell scripts to improve overal perfomance with .net stardand development (at least IMHO)

I will add new ones as soon as I create or discover new ones.

With these scripts I can use the following for example:

## (To build a solution)

GOTODEV | msbuild $Env:Variable /m /t:rebuild
GOTODEV | msbuild $Env:Variable /m /t:clean
GOTODEV | msbuild $Env:Variable /m /t:clean

## (To get latest from tfs)

GOTOSPRINT | tf get . /Recursive

## (To run unit tests from certain project)

GOTODEV | MSTest /testcontainer:$Env:Variable
