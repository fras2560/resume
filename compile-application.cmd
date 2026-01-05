@echo off
set PYTHON=
set JAVA=
set DOTNET=
set APPS=
set TYPESCRIPT=
set INTERMEDIATE=
set POSITION=
set FRONTEND=false
set BACKEND=false
set FULLSTACK=false
set FULLRESUME=false

set "COMPANYARG=%1"
set "COMPANYARG=%COMPANYARG:-= %"
set COMPANY=\def\companyname{%COMPANYARG:-= %}
set "POSITIONARG=%2"
set "POSITIONARG=%POSITIONARG:-= %"
set POSITION=\def\jobposition{%POSITIONARG:-= %}


:parse
if "%1"=="" goto end

if "%1"=="--apps" (
    set APPS=\def\appsvariant{1}
    set BACKEND=true
)
if "%1"=="--typescript" (
    set TYPESCRIPT=\def\typescriptvariant{1}
    set BACKEND=true
)
if "%1"=="--python" (
    set PYTHON=\def\pythonvariant{1}
    set BACKEND=true
)
if "%1"=="--java" (
    set JAVA=\def\javavariant{1}
    set BACKEND=true
)
if "%1"=="--dotnet" (
    set DOTNET=\def\dotnetvariant{1}
    set BACKEND=true
)
if "%1"=="--intermediate" (
    set INTERMEDIATE=\def\intermediatevariant{1}
)
if "%1"=="--frontend" set FRONTEND=true
if "%1"=="--fullstack" set FULLSTACK=true
if "%1"=="--fullresume" set FULLRESUME=true

shift
goto parse

:end
echo ARGS="%POSITION% %COMPANY% %PYTHON% %TYPESCRIPT% %JAVA% %DOTNET% %APPS% %INTERMEDIATE%"

if "%FULLRESUME%"=="true" (
    xelatex dallas-fraser-one-page-resume.tex
)

if "%FULLSTACK%"=="true" (
    echo "\def\fullstackvariant{1} %INTERMEDIATE% %POSITION% \input{dallas-fraser-one-page-resume.tex}"
    xelatex "\def\fullstackvariant{1} %INTERMEDIATE% %POSITION% \input{dallas-fraser-one-page-resume.tex}"
)

if "%FRONTEND%"=="true" (
    echo "\def\frontendvariant{1} %INTERMEDIATE% %POSITION% \input{dallas-fraser-one-page-resume.tex}"
    xelatex "\def\frontendvariant{1} %INTERMEDIATE% %POSITION% \input{dallas-fraser-one-page-resume.tex}"
)

if "%BACKEND%"=="true" (
    echo "\def\backendvariant{1} %INTERMEDIATE% %POSITION% %PYTHON% %TYPESCRIPT% %JAVA% %DOTNET% %APPS% \input{dallas-fraser-one-page-resume.tex}"
    xelatex "\def\backendvariant{1} %INTERMEDIATE% %POSITION% %PYTHON% %TYPESCRIPT% %JAVA% %DOTNET% %APPS% \input{dallas-fraser-one-page-resume.tex}"
)

xelatex "%COMPANY% %INTERMEDIATE% %POSITION% \input{dallas-fraser-cover-letter.tex}"