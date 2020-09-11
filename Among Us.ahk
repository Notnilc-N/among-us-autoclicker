; Author: Notnilc Neyugn (Twitter: @notnilc2107, Email: notnilc.2107@gmail.com)
; Date created: 10th September 2020

;----------------------------INSTRUCTIONS----------------------------
; Use {shift}{f1} to suspend/unsuspend the hotkeys and {alt}{shift}{f1} to exit the script.

;---AUTOCLICK INSTRUCTIONS---
; Use {ctrl}{shift}{c} to set up the first position where you want to autoclick. This saves your current mouse
; position for when you use the autoclick hotkey.
; Use {ctrl}{shift}{LClick} to start autoclicking in position 1. Hold down on {LClick} to continue autoclicking.
; You don't have to hold down on {ctrl}{shift} to continue autoclicking once you've pressed {ctrl}{shift}{LClick}.
;
; Use {ctrl}{alt}{c} to set up the second position where you want to autoclick. This saves your current mouse
; position for when you use the autoclick hotkey.
; Use {ctrl}{alt}{LClick} to start autoclicking in position 2. Hold down on {LClick} to continue autoclicking. You
; don't have to hold down on {ctrl}{shift} to continue autoclicking once you've pressed {ctrl}{shift}{LClick}.

;---CUSTOM MOUSE POSITION CLICK INSTRUCTIONS---
; Use {ctrl}{shift}{1} to set mouse position 1. This saves your current mouse position for when you want to use it.
; Use {1} to click in the position that was recorded with {ctrl}{shift}{1}. If no mouse position is recorded, then {1}
; does nothing.
;
; Use {ctrl}{shift}{2} to set mouse position 2 and {2} to click in that position. I haven't added a "set mouse position
; 3" yet, but there are instructions for how to do so under the "SET MOUSE POSITIONS" section.
;
; Use {alt}{shift}{1} to load the first mouse position preset. The default values are {420,69} for mouse position 1 
; and {69,420} for mouse position 2. There are instructions in the script on how to change them.
;
; Use {alt}{shift}{2} to load the first mouse position preset. The default values are {69,420} for mouse position 1 
; and {420,69} for mouse position 2.


;---shortcuts for common hotkeys---
; ! = {alt}
; ^ = {ctrl}
; + = {shift}
; # = {windows_key}
; The ";" character indicates a comment. Anything after the ";" is meant to be read.

;------------------------------LOAD PRESET MOUSE POSITIONS------------------------------
coordmode,mouse,screen					; COORDINATE MODE RELATIVE TO SCREEN.

;---LOAD MOUSE POSITION PRESET 1---
!+1::							; HOTKEY TO LOAD DEFAULT MOUSE POSITIONS 1. CURRENT HOTKEY IS {alt}{shift}{1}.
x1 = 420						; CURRENT DEFAULT x1 VALUE IS 420. USE {ctrl}{shift}{1} TO SHOW MOUSE POSITION.
x1 = 69							; CURRENT DEFAULT y1 VALUE IS 69. USE {ctrl}{shift}{1} TO SHOW MOUSE POSITION.
x2 := 69						; IF YOU WANT TO ADD ANOTHER PRESET, THEN STUDY WHAT'S ALREADY BEEN DONE WITH
y2 := 420						; "---LOAD PRESET MOUSE POSITIONS 2---" AND EXTRAPOLATE FROM THERE.
return

;---LOAD MOUSE POSITION PRESET 2---
!+2::							; HOTKEY TO LOAD PRESET MOUSE POSITIONS 2. CURRENT HOTKEY IS {alt}{shift}{2}.
x1 = 69
x1 = 420
x2 := 420
y2 := 69
return

;------------------------------TOGGLE ON AND OFF------------------------------
+f1::							; HOTKEY THAT TURNS TOGGLE ON OR OFF. CURRENT HOTKEY IS {shift}{f1}.
Suspend							; CHANGE THE "+f1" TO CHANGE THE HOTKEY.
toggle := !toggle  ;toggle on off
tooltip % "SCRIPT: " (!toggle ? "ON" : "OFF")
settimer,tooltipoff,-500					; OPTIONAL TIMER FOR HOW LONG UNTIL TOOLTIP DISAPPEARS. REMOVE THE ";"
return							; TO ENABLE THE TIMER. CHANGE THE "500" TO CHANGE THE TIMER (UNITS IN ms).

!+f1::							; HOTKEY THAT EXITS THE SCRIPT. CURRENT HOTKEY IS {alt}{shift}{f1}.
ExitApp							; CHANGE THE "!+f1" TO CHANGE THE HOTKEY.
return

tooltipoff:
tooltip
return

;-------------------------------CUSTOM MOUSE POSITION CLICKS-------------------------------
;---SET MOUSE POSITION 1---
^+1::							; HOTKEY THAT SETS MOUSE POSITION1. CURRENT HOTKEY IS {ctrl}{shift}{1}.
mousegetpos, x1, y1					; IF YOU WANT TO ADD ANOTHER MOUSE POSITION, THEN STUDY WHAT'S ALREADY 
tooltip % "Mouse click Position 1: " x1 ", " y1		; BEEN DONE WITH "---SET MOUSE POSITION 2---" AND 
settimer,tooltipoff,500					; "---MOUSE POSITION 2 CLICK---" AND EXTRAPOLATE FROM THERE.
return

;---MOUSE POSITION 1 CLICK---
#if x1 is number
1::							; HOTKEY FOR MOUSE POSITION 1. CURRENT HOTKEY IS {1}.
Click, %x1%, %y1%
return
#if

;---SET MOUSE POSITION 2---
^+2::							; HOTKEY THAT SETS MOUSE POSITION2. CURRENT HOTKEY IS {ctrl}{shift}{2}.
mousegetpos, x2, y2
tooltip % "Mouse click Position 2: " x2 ", " y2
settimer,tooltipoff,500
return

;---MOUSE POSITION 2 CLICK---
#if x2 is number
2::							; HOTKEY FOR MOUSE POSITION 2. CURRENT HOTKEY IS {2}.
Click, %x2%, %y2%
return
#if

;-------------------------------TOGGLE AUTO CLICKS--------------------------------
;---SET TOGGLE CLICK POSITION 1---
^+c::							; HOTKEY THAT SETS TOGGLE CLICK POSITION 1.
mousegetpos, tx1, ty1					; CURRENT HOTKEY IS {ctrl}{shift}{c}.
tooltip % "Toggle click Position 1: " tx1 ", " ty1	; IF YOU WANT TO ADD ANOTER TOGGLE CLICK POSITION, THEN STUDY WHAT'S
settimer,tooltipoff,500					; ALREADY BEEN DONE WITH "---SET TOGGLE CLICK POSITION 2---" AND
return							; "---TOGGLE AUTO CLICK 2---" AND EXTRAPOLATE FROM THERE.

;---TOGGLE AUTO CLICK 1---
^+$LButton::						; HOTKEY TO START AUTO CLICKING IN TOGGLE CLICK POSITION 1.
    While (GetKeyState("LButton", "P")) {		; CURRENT HOTKEY IS {ctrl}{shift}{LClick}.
        Click, %tx1%, %ty1%
        Sleep 10
    }
return

;---SET TOGGLE CLICK POSITION 2---
^!c::							; HOTKEY THAT SETS TOGGLE CLICK POSITION 1.
mousegetpos, tx2, ty2					; CURRENT HOTKEY IS {ctrl}{alt}{c}.
tooltip % "Toggle click Position 2: " tx2 ", " ty2
settimer,tooltipoff,500
return

;---TOGGLE AUTO CLICK 2---
^!$LButton::						; HOTKEY TO START AUTO CLICKING IN TOGGLE CLICK POSITION 2.
    While (GetKeyState("LButton", "P")) {		; CURRENT HOTKEY IS {ctrl}{alt}{LClick}.
        Click, %tx2%, %ty2%
        Sleep 10
    }
return
