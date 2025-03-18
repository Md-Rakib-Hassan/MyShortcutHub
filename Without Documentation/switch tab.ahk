#IfWinActive ahk_exe chrome.exe  ; Only works in Chrome
PgUp::Send ^{Tab}  ; Next tab
+PgUp::Send ^+{Tab}  ; Previous tab
#IfWinActive
