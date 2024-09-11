@echo off
setlocal EnableDelayedExpansion
Set _1=%~1 & Set _2=%~2
Set _3=%~3 & Set _4=%~4
Set _5=%~5 & Set _6=%~6 & Set _7=%~7
Set _8=%~8 & Set _9=%~9
:Main
set _string=
set "_SpaceWidth="
set _final=

set /a x_val=%~1+1

set y_val=%~2
set sepr=%~5
if /i "!sepr!" == "-" (set sepr=)
set char=%~6
if /i "!char!" == "-" (set char=)
if defined char (set char=!char:~0,1!) ELSE (set "char= ")
set color=%~7
if defined color (if /i "!color!" == "-" (set color=) Else (set "color=\e[%~7m"))
Set Type=%~8
If not defined Type (Set Type=1)
If %Type% Gtr 4 (Set Type=1)
If /i "%Type%" == "0" (
	If /I "%~6" == "-" (
		set _Hor_line= 
		set _Ver_line= 
		set _Top_sepr= 
		set _Base_sepr= 
		set _Top_left= 
		set _Top_right= 
		set _Base_right= 
		set _Base_left= 
		) ELSE (
		set _Hor_line= 
		set _Ver_line= 
		set _Top_sepr= 
		set _Base_sepr= 
		set _Top_left= 
		set _Top_right= 
		set _Base_right= 
		set _Base_left= 
		)
)
set /a _char_width=%~4-0
set /a _box_height=%~3-0

for /l %%A in (1,1,!_char_width!) do (
	if /i "%%A" == "%~5" (
	set "_string=!_string!"
	set "_SpaceWidth=!_SpaceWidth!"
	) ELSE (
	set "_string=!_string!"
	set "_SpaceWidth=!_SpaceWidth!!char!"
	)
)


set "_final=%\e%[%~2;%~1H!_string!%\e%[38;5;255m"
set /a y_val+=1

for /l %%A in (1,1,!_box_height!) do (
set "_final=!_final!%\e%[!y_val!;!x_val!H!_SpaceWidth!%\e%[38;5;255m"
set /a y_val+=1

)

Set _To_Replace=!_Top_sepr:~-3!
Set _Replace_With=!_Base_sepr:~-3!
For %%A in ("!_To_Replace!") do For %%B in ("!_Replace_With!") do set "_final=!_final!%\e%[!y_val!;!x_val!H%\e%[38;5;255m"
IF /i "%~9" == "" (echo=%\e%%color%!_final!%\e%[0m) ELSE (ENDLOCAL && Set "%~9=%color%!_final!%\e%[0m")
