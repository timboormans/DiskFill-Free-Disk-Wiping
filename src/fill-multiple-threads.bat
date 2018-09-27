@echo off
title Start multiple fill.bat threads
rem
rem DiskFill
rem

start cmd.exe /K "c: & fill.bat"
ping 1.1.1.1 -n 1 -w 2938 > nul

start cmd.exe /K "c: & fill.bat"
ping 1.1.1.1 -n 1 -w 2037 > nul

start cmd.exe /K "c: & fill.bat"
ping 1.1.1.1 -n 1 -w 2532 > nul

start cmd.exe /K "c: & fill.bat"
ping 1.1.1.1 -n 1 -w 2673 > nul

start cmd.exe /K "c: & fill.bat"
ping 1.1.1.1 -n 1 -w 2439 > nul

pause