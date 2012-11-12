@echo off
del /q .\bin\resource\
xcopy .\src\resource\* .\bin\resource\ /e /d /i
