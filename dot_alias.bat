@echo off
::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Command Processor\Autorun
::string: full path to this path

DOSKEY nn=nvim -c "lua require(\"persistence\").load({last=true})"
DOSKEY n=nvim .
