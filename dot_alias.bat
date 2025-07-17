@echo off
::Install .alias.reg to autorun this file in cmd

DOSKEY nn=nvim -c "lua require(\"persistence\").load({last=true})"
DOSKEY n=nvim .
