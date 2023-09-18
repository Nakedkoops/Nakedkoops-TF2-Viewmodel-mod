set "xIn=gunslinger_inspect.qc"
set "xOut=PLACEHOLDER.snap"
set "xTerm=gunslinger_inspect"
set "xInsert=snap"
if not defined xIn goto End
if not defined xOut goto End
if defined xOut if exist "%xOut%" del /f /q "%xOut%" > nul
for /f "usebackq tokens=*" %%a in (`type %xIn%`) do (
    echo.%%a >> %xOut%
    for /f "usebackq tokens=*" %%x in (`echo."%%a" ^| find "%xTerm%"`) do (
        echo.%xInsert% >> %xOut%
    )
)
copy "hide.txt" + "gunslinger_inspect.snap" "gunslinger_inspect.done.snap"
move "gunslinger_inspect.done.snap" "gunslinger_inspect.qc"