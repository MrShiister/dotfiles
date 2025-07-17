@echo off
::Install .alias.reg to autorun this file in cmd

DOSKEY nn=nvim -c "lua require(\"persistence\").load({last=true})"
DOSKEY n=nvim .
DOSKEY vscmd=cmd -- %comspec% /k "C:\Program Files/Microsoft Visual Studio/2022/Community/VC/Auxiliary/Build/vcvars64.bat"
