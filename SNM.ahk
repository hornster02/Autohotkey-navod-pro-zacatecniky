;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;( disable numeric keypad ) - move (1235), left button (7), middle button (8), right button (9),  wheel down (4), wheel up (6), move cursor to 4 specified positions (0), 4th mouse button (,)
NumpadClear::
NumpadEnd::
NumpadPgDn::
NumpadDown::
IS := 0.5 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Initial Speed
Ac := 1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;Acceleration
;ScaleFactor := 4
Loop{
 X := Y := 0
 MouseMove, X := GetKeyState("NumpadEnd","P") ? -IS+=Ac : GetKeyState("NumpadPgDn","P") ? IS+=Ac : X
	  , Y := GetKeyState("NumpadClear","P") ? -IS+=Ac : GetKeyState("NumpadDown","P") ? IS+=Ac : Y,0,R
}until !X && !Y
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;wheel up - speed 2
NumpadRight::Send {WheelUp 2}
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;wheel down - speed 2
NumpadLeft::Send {Wheeldown 2}
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;press and release = left click                 hold = hold
*NumpadHome::
   If (A_PriorHotKey = A_ThisHotKey) ;these are built in variables
   return
MouseClick, left,,, 1, 0, D  ; Hold down the left mouse button.
return
*NumpadHome up::MouseClick, left,,, 1, 0, U  ; Release the mouse button.
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;press and release = right click                 hold = hold
*NumpadPgUp::
   If (A_PriorHotKey = A_ThisHotKey) ;these are built in variables
   return
MouseClick, right,,, 1, 0, D  ; Hold down the right mouse button.
return
*NumpadPgUp up::MouseClick, right,,, 1, 0, U  ; Release the mouse button.
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;press and release = middle click                hold = hold
*NumpadUp::
   If (A_PriorHotKey = A_ThisHotKey) ;these are built in variables
   return
MouseClick, middle,,, 1, 0, D  ; Hold down the middle mouse button.
return
*NumpadUp up::MouseClick, middle,,, 1, 0, U  ; Release the mouse button.
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;move cursor to 4 specified positions
$NumpadIns::
count++
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;middle
If count=1
x := (A_ScreenWidth // 2)
y := (A_ScreenHeight // 2)
mousemove, x, y
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;right
If count=2
x := (A_ScreenWidth // 1.003)
y := (A_ScreenHeight // 2)
mousemove, x, y
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;left - disabled
;If count=3
;x := (A_ScreenWidth // -1)
;y := (A_ScreenHeight // 2)
;mousemove, x, y
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;up right
If count=3
{
x := (A_ScreenWidth // 1)
y := (A_ScreenHeight // -1)
mousemove, x, y
count:=0
}
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;4th mouse button
NumpadDel::XButton1
return