@echo off
echo auto update and commit to github by thanhkk 
cd "curl"
set GIT_PATH="C:\Program Files\Git\bin\git.exe"
set BRANCH = "origin master"
echo add...
%GIT_PATH% add -A
echo commit...
%GIT_PATH% commit -am "Committed on %date%"
echo pull...
%GIT_PATH% pull %BRANCH%
echo push...
%GIT_PATH% push -f %BRANCH%
call
pause