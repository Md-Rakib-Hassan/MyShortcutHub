currentDesktop := 1  ; Assume starting from Desktop 1

PgUp::
    global currentDesktop
    if (currentDesktop = 1) {
        Send, ^#{Right}  ; Go to Desktop 2
        currentDesktop := 2
    } else if (currentDesktop = 2) {
        Send, ^#{Right}  ; Go to Desktop 3
        currentDesktop := 3
    } else if (currentDesktop = 3) {
        Send, ^#{Left 2}  ; Go back to Desktop 1
        currentDesktop := 1
    }
return
