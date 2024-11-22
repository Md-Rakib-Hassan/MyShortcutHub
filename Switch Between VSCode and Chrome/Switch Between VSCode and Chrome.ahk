; Define the VS Code and the Chrome window you don't want to switch to
VSCode := "ahk_exe Code.exe"  ; Identifier for VS Code
ExcludeChrome := ""  ; If want to exclude any chrome window then the title of the window

; Middle mouse button behavior
~MButton::
{
    ToggleWindows()
}
return

; Ctrl + Period combo behavior
^.::
{
    ToggleWindows()
}
return

; Function to toggle between VS Code and Chrome
ToggleWindows()
{
    global VSCode, ExcludeChrome
    if (WinActive(VSCode))
    {
        ; Get a list of Chrome windows
        WinGet, windows, List, ahk_exe chrome.exe
        
        ; Loop through the list of windows
        Loop, %windows%
        {
            hwnd := windows%A_Index%
            WinGetTitle, title, ahk_id %hwnd%
            if (title != ExcludeChrome)
            {
                WinActivate, ahk_id %hwnd%
                return
            }
        }
    }
    else
    {
        ; Switch back to VS Code
        WinActivate, %VSCode%
    }
}
return
