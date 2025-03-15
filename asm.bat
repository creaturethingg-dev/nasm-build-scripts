@echo off

set file=%1

if exist "%file%.asm" (
    where nasm >nul 2>nul
    if %ERRORLEVEL% neq 0 (
        echo You need to install NASM for windows first
        exit /b 2
    )
    
    nasm -fwin64 %file%.asm
    if %ERRORLEVEL% neq 0 (
        echo An error occured with NASM
        exit /b 3
    )

    where link >nul 2>nul
    if %ERRORLEVEL% neq 0 (
        echo MSVC linker 'link.exe' wasn't found
        echo Open in developer command prompt
        exit /b 2
    )

    link %file%.obj /subsystem:console /out:%file%.exe kernel32.lib legacy_stdio_definitions.lib msvcrt.lib
    if %ERRORLEVEL% neq 0 (
        echo An error occured with the MSVC linker 'link.exe'
        exit /b 3
    )

    del %file%.obj 2>nul

    echo Compiled %file%
) else (
    echo %file%.asm not found.
    exit /b 1
)