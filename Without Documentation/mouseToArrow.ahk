#Persistent
#UseHook

SetTimer, CheckCapsNumLock, 100
global isOn := false ;
return

CheckCapsNumLock:
    if (GetKeyState("CapsLock", "T") && !GetKeyState("NumLock", "T")) {
        Hotkey, LButton, LButton_UpArrow, On
        Hotkey, RButton, RButton_DownArrow, On
        BlockInput, MouseMove  ; Block mouse movement
        isOn = true;
    } else {
        
            if(isOn) {
            Hotkey, LButton, Off
            Hotkey, RButton, Off
            BlockInput, MouseMoveOff  ; Allow mouse movement
            }
    }
return

LButton_UpArrow:
    Send {Left}
return

RButton_DownArrow:
    Send {Right}
return
