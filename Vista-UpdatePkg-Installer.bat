@ECHO OFF

SET CURRENTPATH=%~dp0

SET TEMPFLDR=%CURRENTPATH%\tmp

IF NOT EXIST %TEMPFLDR% (
    ECHO Creating temp folder...
    MD %TEMPFLDR%
)

FOR /R %CURRENTPATH% %%F in (*.cab) DO (
    ECHO Installing "%%F"
    START /W PKGMGR /IP /M:%%F /S:%TEMPFLDR%
)

CLS

ECHO Clearing temp folder...

RD %TEMPFLDR% /S /Q

PAUSE