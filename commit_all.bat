@echo off
echo auto update and commit to github by thanhkk 
cd "curl"
set GIT_PATH="C:\Program Files\Git\bin\git.exe"
echo add...
%GIT_PATH% add .
echo commit...
%GIT_PATH% commit -am "Commit on %date%"
echo pull...
%GIT_PATH% pull origin master
echo push...
%GIT_PATH% push origin master
call
pause