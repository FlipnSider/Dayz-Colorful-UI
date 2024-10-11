@echo off
SETLOCAL
:: ====================================================================================================================
::  DayZ Mod Manager & Server Launcher v2.0
::  by: DayZ n' Chill 
:: ====================================================================================================================

::  This script efficiently manages DayZ mods and facilitates launching a DayZ Diagnostic Server.
::  The primary aim of this script is to simplify mod development, and server management.
::  Especially for users who may not be experienced modders or developers.

::  References:
::  https://community.bistudio.com/wiki/DayZ:Modding_Basics,
::  https://community.bistudio.com/wiki/DayZ:Workbench_Script_Debugging 

::  WARNING!!! Do not edit this file unless you know what you are doing. 
::  Use the Start.bat in the root folder to set up your work enviornment
:: ====================================================================================================================

:: Load variables from Globals.cfg and set them with quoted values
for /f "tokens=1* delims== eol=#" %%i in (..\..\Utils\Shared\Globals.cfg)  do (
    set "%%i=%%j"
)

:: ====================================================================================================================
::  Server Specific Configuration: 
:: ====================================================================================================================

::  The Mods Section below are for mods that are specific to this server only. If you want to test with multiple maps,
::  and or servers, you will need to edit the globals.cfg in the Util/Shared folder.
::  SET "MODS=P:\Mods\Server_Specific_Mod;"
SET ""

:: ====================================================================================================================
::  NO NEED TO MODIFY ANYTHING ELSE, UNLESS YOU KNOW WHAT YOU'RE DOING!!!
:: ====================================================================================================================
SET "CLIENTLOGSDIR=%PROJECTDIR%\Servers\!ClientDiagLogs"
SET "MISSIONDIR=%PROJECTDIR%\Missions\Vanilla\dayzOffline.chernarusplus"
SET "EXPMISSIONDIR=%PROJECTDIR%\Missions\Experimental\dayzOffline.chernarusplus"
SET "SERVERCFG=%PROJECTDIR%\Servers\Cherno\serverDZ.cfg"
SET "PROFILES=%PROJECTDIR%\Servers\Cherno\Profiles"

:: ====================================================================================================================
::  Server and Game Initialization
::  You can change the -mission=%MISSIONDIR%" Variable with -mission=%EXPMISSIONDIR%" to use Experimental Mission
::  If you need to use server side mods you will need to add this line to the start local server "-mod=%GLOBALSERVERMODS%"
:: ====================================================================================================================

:: Start local server.
start /D "%GAMEDIR%\" DayZDiag_x64.exe -server -filePatching "-mod=%GLOBALMODS%%MODS%" "-profiles=%PROFILES%" "-mission=%MISSIONDIR%" "-config=%SERVERCFG%" "-newErrorsAreWarnings=1"
:: Play on local server.
start /D "%GAMEDIR%\" DayZDiag_x64.exe "-profiles=%CLIENTLOGSDIR%" "-mod=%GLOBALMODS%%MODS%" -filePatching -connect=127.0.0.1 -port=2302 "-newErrorsAreWarnings=1"