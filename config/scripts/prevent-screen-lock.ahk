#Requires AutoHotkey >=2.0

CoordMode "Mouse", "Screen"
Loop
{
    ; Move mouse
    MouseMove 1, 1, 0, "R"

    ; Return mouse to its original position
    MouseMove -1, -1, 0, "R"

    ; Wait before moving the mouse again
    Sleep 60000
}
return