@echo off
set PYTHON=""
set JAVA=""
set DOTNET=""
set APPS=""
set TYPESCRIPT=""
set FRONTEND=false
set BACKEND=false
set FULLSTACK=false
set FULLRESUME=false

:parse
if "%1"=="" goto end

if "%1"=="--apps" (
    set APPS="\def\appsvariant{1}"
    set BACKEND=true
)
if "%1"=="--typescript" (
    set TYPESCRIPT="\def\typescriptvariant{1}"
    set BACKEND=true
)
if "%1"=="--python" (
    set PYTHON="\def\pythonvariant{1}"
    set BACKEND=true
)
if "%1"=="--java" (
    set JAVA="\def\javavariant{1}"
    set BACKEND=true
)
if "%1"=="--dotnet" (
    set DOTNET="\def\dotnetvariant{1}"
    set BACKEND=true
)
if "%1"=="--frontend" set FRONTEND=true
if "%1"=="--fullstack" set FULLSTACK=true
if "%1"=="--fullresume" set FULLRESUME=true

shift
goto parse

:end
echo ARGS="%PYTHON% %TYPESCRIPT% %JAVA% %DOTNET% %APPS%"

if "%FULLRESUME%"=="true" (
    xelatex dallas-fraser-one-page-resume.tex
)

if "%FULLSTACK%"=="true" (
    xelatex "\def\fullstackvariant{1} \input{dallas-fraser-one-page-resume.tex}"
)

if "%FRONTEND%"=="true" (
    xelatex "\def\frontendvariant{1} \input{dallas-fraser-one-page-resume.tex}"
)

if "%BACKEND%"=="true" (
    xelatex "\def\backendvariant{1} %PYTHON% %TYPESCRIPT% %JAVA% %DOTNET% %APPS% \input{dallas-fraser-one-page-resume.tex}"
)

cd cover-letter
xelatex dallas-fraser-cover-letter.tex
cd ..