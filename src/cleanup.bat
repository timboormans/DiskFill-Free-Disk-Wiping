@echo off
title Cleanup afterwards
rem
rem DiskFill
rem

c:
cd \

:again
dir c:\*.jpg > c:\tocleanup.txt
for /f %%i in ('dir *.jpg') do del %%i

goto again