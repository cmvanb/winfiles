#Requires AutoHotkey >=2.0

; Keep the session awake without injecting mouse movement: AHK's MouseMove
; sends absolute coordinates, which raw-input games read as huge deltas.
Loop
{
    ; Only nudge when the user has been physically idle; never during play
    if (A_TimeIdlePhysical >= 50000)
        Send "{F15}"

    Sleep 60000
}
return
