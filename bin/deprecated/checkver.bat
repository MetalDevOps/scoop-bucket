@echo on
setlocal

for /f %%i in ('scoop which scoop') do set CHECKVER="C:\Users\Administrator\Documents\GitHub\whoamikyo-bucket\bin\checkver.ps1"
for /f %%i in ('scoop which pwsh') do set PWSH="C:\Program Files\PowerShell\7\pwsh.exe"

for %%i in (%0) do set DIR=%%~dpi..

if "x%~1" == "x" goto updall

:updone
if "x%~1" == "x" goto end
%PWSH% -noprofile -ex unrestricted -f %CHECKVER% -dir %DIR% "%~n1"
shift
goto :updone

:updall
%PWSH% -noprofile -ex unrestricted -f %CHECKVER% -dir %DIR%

:end
