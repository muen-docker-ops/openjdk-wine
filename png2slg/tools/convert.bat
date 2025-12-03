@echo off
set WorkDir=.

del ..\*.pngslg
del ..\*.slg

for %%i in (.\*.png) do (
    echo Converting %%i...
    png_tool_command %%i ..\%%islg > nul 2>&1
    if %errorlevel% neq 0 (
        echo Conversion failed for %%i
        exit /b 1
    )
)

cd ..

if exist *.pngslg (
    ren *.pngslg *.slg
    echo Conversion completed successfully
) else (
    echo No output files generated
    exit /b 1
)