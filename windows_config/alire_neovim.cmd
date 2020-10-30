@echo off
IF "%1"=="" GOTO ERROR_NO_PARAM

pushd %1
FOR /F "tokens=* USEBACKQ" %%F IN (`..\packages\Alire.1.3.0\alr.exe getenv -q`) DO (
SET GPR_PROJECT_PATH=%%F
)
start "" "nvim-qt.exe"

rem Skip the following blocks; you can only jump straight into them
GOTO END

:ERROR_NO_PARAM
echo Error: expected a single parameter with the directory to open neovim in - if it contains an alire project then GPR_PROJECT_PATH will be set
exit /b 1

:END
