currentDesktop := 1  ; Assume we start on Desktop 1

ToggleDesktop() {
    global currentDesktop
    if (currentDesktop = 1) {
        Send, ^#{Right}  ; Switch to Desktop 2
        currentDesktop := 2
    } else {
        Send, ^#{Left}  ; Switch back to Desktop 1
        currentDesktop := 1
    }
}

MButton::ToggleDesktop()  ; Middle Mouse Button toggles desktop
PgDn::ToggleDesktop()     ; Page Down button toggles desktop
