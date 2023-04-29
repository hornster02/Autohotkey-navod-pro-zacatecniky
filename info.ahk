/*
-p�ehlednost tohoto textu se z�sadn� zv��� pou�it�m n�jak�ho pokro�ilej��ho textov�ho editoru se syntax� ( a� u� vlastn� nebo typu AutoIt/Autohotkey ). T�eba Notepad++

-funk�n� skripty v�etn� popis� za��naj� od "666" - ve Win7 funguj� bez probl�mu - v�t�inou i ve Win11. ��dn� z nich ned�l� trval� z�sah do syst�mu a po stisknut� CTRL+ALT+INS se v�echny Autohotkey procesy ukon��

-aby nedo�lo k nefunk�nosti n�kter�ch skript� a probl�m�m s diakritikou, tak se mus� tento soubor spustit p�es "AutoHotkeyU64.exe" a ne p�es v�choz� "AutoHotkey.exe" - nap�. "c:\AutoHotkey\AutoHotkeyU64.exe info.ahk" ( v tomto p��pad� by se musel tento soubor nakop�rovat do slo�ky programu ). Nebo p�es kontextovou nab�dku "otev��t v programu". Na p��pon� souboru ale nijak zvl᚝ nez�le�� ( txt/ini/ahk/... )

-sta�en� aplikace a vypsan� kl�vesy a tla��tka my�i
https://www.autohotkey.com/download/
https://www.autohotkey.com/docs/v1/KeyList.htm
https://www.autohotkey.com/docs/v1/Hotkeys.htm


-m��e se hodit
https://www.autohotkey.com/docs/Tutorial.htm
https://www.autohotkey.com/docs/v1/scripts/index.htm


-znaky /* ( za��tek ) a */ ( konec ) slou�� pro vyzna�en� prostoru pro koment�� - pro funk�nost skriptu v t�to oblasti se mus� tyto znaky smazat ( *0 nedoporu�uji to v tomto p��pad� d�lat, proto�e n�e jsou skripty kter� by se mohly automaticky spustit pokud u nich chyb� aktiva�n� tla��tko a t�m se zacyklit - p��padn� prov�d�t dal�� neplechu - jedn� se hlavn� o kr�tk� a jednoduch� uk�zky ) a nebo nakop�rovat mimo n�. Znak ; slou�� pro za��tek koment��e na nov�m ��dku. Znaky " ;" ( mezera+st�edn�k ) slou�� pro za��tek koment��e na ��dku s p��kazem

-WindowSpy.ahk ve slo�ce programu Autohotkey slou�� ke zji�t�n� podrobnost� oken, pozice my�i atd. Samotn� k�d skriptu je u� zde obsa�en a kl�vesou "ScrollLock" se okno otev�e

-VK=Virtual Key, SC=Scan Code - dal�� mo�nost jak pou��t pot�ebnou kl�vesu ( n�kter� programy ur�it� kl�vesy blokuj� ). Nap��klad kl�vesa "a" se d� napsat tak� jako "VK41" nebo "SC01E". Kl�vesy se daj� zjistit v okn� Autohotkey - CTRL+K - v�etn� multimedi�ln�ch atd. R�zn� kl�vesnice maj� r�zn� ozna�en� kl�ves a tak n�kter� mnou napsan� VK a SC kl�vesy nemus� v�dy odpov�dat skute�nosti. Kl�vesa WIN se m��e napsat jako #      ALT !      CTRL ^      SHIFT +      ALTGR <^>!      P��klad pou�it� n�sleduje po vyhled�n� ^!PgUp      Uk�zky skript� n�e jsou chaoticky naps�ny ve v�ech t�chto form�tech pro co nejv�t�� rozmanitost

-text p�ed :: ( dvojit� dvojte�ka ) je pro kl�vesy/tla��tka. Text za nimi je pro samotn� p��kazy ( pokud je jenom jeden, tak m��e b�t na stejn�m ��dku ). Pokud je jich v�ce, tak je ps�t na dal�� ��dky. Nap�.
a::Click, 366, 195 ;;;;;;;;;;;;;;;;;;;;;;;;;;1 p��kaz
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;nebo
a::
Click, 366, 195 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;1 p��kaz
SendInput {RButton up} ;;;;;;;;;;;;;;;2 p��kaz

-p�i ur�it�m naps�n� skriptu se n�kdy m��e st�t, �e dojde k neuvoln�n� kl�vesy ( tzv. hook - d� se zjistit z okna programu - Hook's Logical, Physical ) - nap��klad kl�vesa CTRL, kter� je po��d virtu�ln� stisknut� m��e d�lat necht�n� v�ci ( t�eba zm�na velikosti str�nky ve webov�m prohl�e�i v kombinaci s kole�kem my�i ) a jakousi "nefunk�nost" kl�vesnice. Nejlep�� je tomu p�edch�zet pat�i�n� napsan�m skriptem, ale "odhookov�n�" kl�vesy se d� prov�st jej�m ( p��padn� ALT, ALTGR, SHIFT, WIN ) fyzick�m stisknut�m










;;;;;;;;;;;;��ste�n� shoda n�zvu okna ( ide�ln� napsat na �pln� za��tek skriptu )
SetTitleMatchMode, 2
;;;;;;;;;;;;;;;;;;;;;;;;na za��tku skriptu se m��e tak� hodit nap�. n�kter� z t�chto direktiv. #NoEnv ale m��e ��ste�n� naru�it jeden jinak funk�n� skript n�e ( vyhledat "F11" )
#InstallKeybdHook
#SingleInstance, force
#NoTrayIcon
#NoEnv


;;;;;;;;;;;;;;;;;;;;;pokud je okno v pop�ed� ( title, class, process - viz "WindowSpy.ahk" ), tak...
#IfWinActive


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;klik my�� do konkr�tn� ��sti ( n�zvu ) okna ( ClassNN - viz "WindowSpy.ahk" )
ControlClick


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;klik my�� ( sou�adnice )
Click


;;;;;;;;;;;;;;;;pohyb my�� na sou�adnici
MouseMove


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;aktivovat okno do pop�ed�
WinActivateBottom


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;*.exe soubory a jejich ukon�ov�n� a jin�
Process


;;;;;;;;;;;;;;;;;;;;;;;;nastaven� hlasitosti +- mute. Pokud se nap�e t�eba ��slo 5, tak se hlasitost zm�n� o 5%
SoundSet


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;napsat text
SendInput


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;p�ev�n� stisknout kl�vesu(y) - �et�zec
Send


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;odd�lova� funkc� - n�vrat na za��tek
Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;spustit
Run


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;po�kat
sleep


;;;;;;;;;;;;;;;;;;;;;;;;;;;��rka - nap�. pro (Run, c:\OverdriveNTool.exe -p0"0,3") se nap�e (Run, c:\OverdriveNTool.exe -p0"0`,3")
`,


;;;;;;;;;;;;;;;;;;;;;;ukon�it skript
ExitApp










;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;od t�to ��sti by skripty fungovaly samy o sob�. Ale nedoporu�uji je zkou�et jen tak naslepo - viz *0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;automatick� kontrola �ehokoli - v tomto p��pad� ka�dou vte�inu ( bli��� popisky u p��kaz� n�e ). I zde je mo�n� pod sebe �tosovat des�tky a stovky r�zn�ch p��kaz� - "return" bude pouze jeden na konci
settimer, check, 1000
check:
if WinExist("ahk_class TForm_StabilityTest") && WinExist("ahk_exe aida64.exe") ;;;;;;;;;;;;pokud existuje okno s t�mito n�zvy
WinMove, ahk_class TForm_StabilityTest, , -5, -10, 10000, 10000 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;tak zv�t�it okno na celou obrazovku a posunout doleva nahoru do m�nusu ( skr�t 5px a 10px )
if WinExist("Obnova dokument� LibreOffice 6.2") && WinExist("ahk_exe soffice.bin") ;;;;;;pokud existuje okno s t�mito n�zvy
WinActivateBottom, ahk_exe soffice.bin ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;tak aktivovat do pop�ed� proces "soffice.bin"
WinClose,Obnova dokument� LibreOffice 6.2 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;a zav��t okno "Obnova dokument� LibreOffice 6.2"
if WinExist("ahk_exe FullEventLogView.exe") ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;pokud je spu�t�n� tento proces
WinSet, Style, -0xC00000 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;tak odstranit "titlebar" ( li�ta s minimalizovat/maximalizovat/zav��t a n�zvem okna ) - univerz�ln� p��kaz
DllCall("SetMenu", uint, WinExist(), uint, 0) ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;odstranit z�hlav� ( li�ta s p��kazy pod "titlebar" ) - univerz�ln� p��kaz
Control, hide , , ToolbarWindow321 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;odstranit ovl�dac� ikony programu ( n�zev li�ty je pod ClassNN v "WindowSpy.ahk" )
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;stisknut� "a" nap�e "b"
a::b
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;zablokuje kl�vesu "a"
a::Return
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;zablokuje kl�vesu "a" v procesu "aida64.exe"
#IfWinActive, ahk_exe aida64.exe
a::Return
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;stisknut� "LAlt" provede ta�en� lev�m tla��tkem my�i z pozice "537, 300" do "500, 1048"
LAlt::MouseClickDrag, left, 537, 300, 500, 1048
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;stisknut� "LAlt" a jeho uvoln�n� (Up) provede ta�en� lev�m tla��tkem my�i z pozice "537, 300" do "500, 1048". D�ky znaku ~ ( vlnovka ) nedojde k zablokov�n� kl�vesy skriptem pro sebe, ale je mo�n� pou��t i nap�. v�choz� Win zkratku ALT+TAB
~LAlt Up::MouseClickDrag, left, 537, 300, 500, 1048
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;po kliknut� prav�m tla��tkem my�i z�stane tla��tko stisknut� dokud nedojde k op�tovn�mu kliknut� ( p�ep�na� ). U�ite�n� pro hry
RButton::
KeyDown := !KeyDown
If KeyDown
SendInput {RButton down}
Else
SendInput {RButton up}
Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;po stisknut� "c" z�stane kl�vesa stisknut� dokud nedojde k op�tovn�mu stisknut� ( p�ep�na� ). U�ite�n� pro hry
$c::
If (Switch := !Switch)
{
KeyWait c
Send {c Down}
} Else {
KeyWait c
Send {c Up}
}
Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;ALTGR+l - p�ep�na� dvou kl�vesov�ch zkratek ( CTRL+ALT+Numpad4 a CTRL+ALT+Numpad5 )
VKA5 & SC026::
KeyDown := !KeyDown
If KeyDown
SendInput ^!{Numpad4}
Else
SendInput ^!{Numpad5}
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;kop�rov�n�+p�eps�n� ( 1 ano, 0 ne )
FileCopy, c:\_NOVE\_NASTAVENI\ClickMonitorDDC\1\ClickMonitorDDC.xml, c:\_NOVE\_NASTAVENI\ClickMonitorDDC, 1
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;smazat hodnotu z registru
RegDelete, HKEY_LOCAL_MACHINE, SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer, MaxCachedTiles15E
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;kr�tk� p��klad vlastn�ho "po spu�t�n�" skriptu ( a nemuset pou��vat tu MS hr�zu rozesetou po cel�m syst�mu ). Bli��� popisky u p��kaz� n�e
Run, c:\nsmc.exe ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;spustit program
Sleep 2000 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;2 vte�iny po�kat
FileRemoveDir, a:\$RECYCLE.BIN, 1 ;;;;;;;;;;;;;;;;;;;;;;;;smazat slo�ku (ko�) s ve�ker�m obsahem
FileCopy, c:\$Recycle.Bin, a:\$Recycle.Bin, 1 ;;;;;;;;;;;;nakop�rovat soubor/slo�ku z "c:" do "a:" a p�epsat ( vzhledem k p�edchoz�mu p��kazu ale nen� co p�episovat ). Pokud se nakop�ruje soubor, tak se vytvo�� ten jedin� spr�vn� "ko�" = ��dn�
Run, c:\nircmdc.exe ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;spustit program
WinActivateBottom, ahk_exe TOTALCMD64.EXE ;;;aktivovat do pop�ed� okno "TOTALCMD64.EXE"
Send ^+!{r} ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;zm��knout CTRL+SHIFT+ALT+R
MouseMove, 100, 600 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;posun my�� na sou�adnice
Send {Down 100}{Enter} ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;stisknout 100x �ipku dol� a Enter
exit ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;ukon�it skript


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;stisknut�m ALTGR+F7 dojde ke spu�t�n� programu �.1 - p�i dal��m programu �.2 - p�i dal��m programu �.3 - p�i dal��m programu �.1 - ... Cyklus - p�ep�na�
VKA5 & F7::
key++ ; this will help cycling through the keys depending on its value
if key = 1
Run, c:\MouseSC_x64.exe /Speed:6, , Hide
else if key = 2
Run, c:\MouseSC_x64.exe /Speed:10, , Hide
else if key = 3
{
Run, c:\MouseSC_x64.exe /Speed:14, , Hide
key = 0 ; return to the original state... do this on the last hotkey you would like to send
}
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;restartovat po��ta� kl�vesou CTRL+ALT+PgUp. V tomto p��pad� na s�lu (2+4=6) = rozpracovan� v�ci se neulo��. Pokud PC nen� sekl� a p�ep�n�n� "NumLock" funguje, tak je lep�� tento zp�sob, ne� pou�it� vyp�nac�ho/restartovac�ho tla��tka s potenci�ln� hor��mi n�sledky. Odhl�sit (0), vypnout (1), restart (2), "s�la" (p�i��st 4)
^!PgUp::Shutdown, 6
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;pokud je aktivn� "aida64.exe", tak jedno oto�en� kole�kem nahoru ud�l� dv� oto�en�
#IfWinActive, ahk_exe aida64.exe
WheelUp::Send {WheelUp 2}
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;pokud je aktivn� "Ulo�it" ( ��st n�zvu okna nebo cel� n�zev - viz "SetTitleMatchMode" - n�e u� to nebudu znovu uv�d�t ), tak kl�vesa Numpad0 nastav� okno na "v�dy v pop�ed�" ( p�ep�na� )
#IfWinActive, Ulo�it
Numpad0::Winset, Alwaysontop, Toggle, A
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;pokud je aktivn� "Notepad++", tak stisknut�m prost�edn�ho tla��tka my�i se provede klik lev�m tla��tkem my�i na sou�adnic�ch, vte�inu po�k� a n�sleduje dal�� klik
#IfWinActive, ahk_class Notepad++
Mbutton::
Click, 366, 195
sleep 1000
Click, 356, 222
Return


;;;;;;;;;;;;;pokud je aktivn� "hexelon.exe", tak stiknut� "END" provede klik prav�m tla��tkem na sou�adnic�ch / 0,5 vte�iny po�k� / 3x �ipka dol� / enter / klik lev�m tla��tkem na sou�adnic�ch ( zkop�rov�n� v�sledku na kalkula�ce )
#IfWinActive, ahk_exe hexelon.exe
End::
Send {Click right, 14 93}
sleep 500
Send {Down 3}{Enter}{Click, 441 167}
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;pokud je aktivn� ��st n�zvu okna programu Firefox, tak kliknut�m X1 tla��tka my�i se provede n�kolik klik� lev�m tla��tkem na sou�adnic�ch ( v�etn� �ek�n� ) / dojde ke stisknut� ALT+lev� �ipka / posun my�� na sou�adnice. V m�m nastaven� to znamen� otev��t spam slo�ku, ozna�it v�echny emaily, n�kolikr�t potvrdit �e se nejedn� o spam a p�esunout je do slo�ky doru�en� a vr�tit se na p�vodn� str�nku. Od te� ti drz� krastyov� nebudou nikdy zdr�ovat
#IfWinActive, Seznam Email - Firefox Developer Edition
XButton1::
Click, 98, 478
sleep, 500
Click, 360, 229
sleep, 250
Click, 748, 228
sleep, 250
Click, 1095, 434
sleep, 250
Send !{left}
sleep, 250
MouseMove, 788, 496
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;pokud je aktivn� ��st n�zvu okna programu Firefox, tak kliknut�m X1 tla��tka my�i se provede spu�t�n�/pozastaven� videa, zapnut�/vypnut� fullscreen a pohyb my�� na sou�adnice
#IfWinActive, - YouTube - Firefox Developer Edition
XButton1::
Send {space}{f}
MouseMove, 2800, 540
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;pokud je aktivn� ��st n�zvu okna programu Firefox, tak zkratka RCtrl+Num7 klikne na sou�adnice / po�k� na lev� klik my�� u�ivatelem / po�k� 0,2 vte�iny / provede pohyb my�� na sou�adnice
#IfWinActive, - YouTube - Firefox Developer Edition
RControl & Numpad7::
Click, 2402, 1035
KeyWait, Lbutton, D
sleep 200
MouseMove, 2800, 540
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;pokud je aktivn� "WinRAR.exe", tak zkratka ALTGR+C nap�e cestu ke slo�ce
#IfWinActive, ahk_exe WinRAR.exe
VKA5 & SC02E::SendInput, c:\_X\.windows\
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;pokud je aktivn� "AutoHotkeyU64.exe", tak ESC schov� okno ( v p��pad� tohoto programu do tray )
#IfWinActive, ahk_exe AutoHotkeyU64.exe
ESC::WinHide, ahk_exe AutoHotkeyU64.exe
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;po naps�n� znak� ",.d" se nap�e aktu�ln� datum a p�vodn� znaky se sma�ou
:OC*:,.d::
	send %A_DD%.%A_MM%.%A_YYYY%
Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;po naps�n� znak� ",.a" v aktivn�m procesu "notepad++.exe" se nap�e emailov� adresa / po�k� na kliknut� prost�edn�m tla��tkem my�i u�ivatelem / nap�e po�tovn� sm�rovac� ��slo. P�vodn� znaky se sma�ou
#IfWinActive, ahk_exe notepad++.exe
:OC*:,.a::
SendInput, 2023-01@seznam.cz
KeyWait, Mbutton, D
SendInput, 999 88
Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;CTRL+ALT+PgUp - pozastaven�/pokra�ov�n� (suspend) procesu "lorelai.exe" (p�ep�na� s 3 vte�inov�m ozn�men�m). Velmi u�ite�n� nap�. v p��pad� zapnut�ho programu s vysok�mi n�roky na v�kon PC. Pokud je pot�eba ve�ker� v�kon pou��t jinde, tak t�mto p�ep�na�em se proces bez ukon�en� pozastav�. M��e tak� doj�t k z�sadn�mu sn�en� spot�eby/teplot/hlu�nosti
^!PgUp::
if (toggle := !toggle) {
Process_Suspend("lorelai.exe")
MsgBox, 48, , suspended, 3
Process_Suspend(PID_or_Name){
    PID := (InStr(PID_or_Name,".")) ? ProcExist(PID_or_Name) : PID_or_Name
    h:=DllCall("OpenProcess", "uInt", 0x1F0FFF, "Int", 0, "Int", pid)
    If !h   
        Return -1
    DllCall("ntdll.dll\NtSuspendProcess", "Int", h)
    DllCall("CloseHandle", "Int", h)
}
} else {
Process_Resume("lorelai.exe")
MsgBox, 48, , resumed, 3
Process_Resume(PID_or_Name){
    PID := (InStr(PID_or_Name,".")) ? ProcExist(PID_or_Name) : PID_or_Name
    h:=DllCall("OpenProcess", "uInt", 0x1F0FFF, "Int", 0, "Int", pid)
    If !h   
        Return -1
    DllCall("ntdll.dll\NtResumeProcess", "Int", h)
    DllCall("CloseHandle", "Int", h)
}
ProcExist(PID_or_Name=""){
    Process, Exist, % (PID_or_Name="") ? DllCall("GetCurrentProcessID") : PID_or_Name
    Return Errorlevel
}
}
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;pokud je kurzor my�i na "titlebar", tak kole�kem se okno zv�t�uje/zmen�uje


~WheelDown::Resize(.75)
~WheelUp::Resize(1.335)

Resize(Perc)
{
	static CaptionBarSize := 20
    WinGetPos,,, winW, winH, A
	MouseGetPos,, mPosY
	if (mPosY <= CaptionBarSize)
	    WinMove,A,,,, % winW*Perc, % winH*Perc
}
return


*/
;
;
;
;
;
;
;
;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;666;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;n�e n�sleduje funk�n� skript bez nutn�ch dal��ch �prav
SetTitleMatchMode, 2
#InstallKeybdHook
;#NoEnv
;
;
;
;
;
;
;
;
;
;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;-ovl�d�n� my�i kl�vesnic� ( vypnout numerickou kl�vesnici ) - pohyb v�etn� �ikm�ho (1235), lev�+prost�edn�+prav� tla��tko v�etn� mo�nosti Drag and drop a dvojkliku (789), kole�ko dolu+nahoru (46), pohyb kurzoru do t�� ur�en�ch pozic (0), 4-t� tla��tko my�i (.). Snadn� �prava rychlosti a akcelerace. Od te� u� nen� nutn� m�t vystudovanou vysokou �kolu na zapamatov�n� si v�choz�ho a osekan�ho MS v�myslu
NumpadClear::
NumpadEnd::
NumpadPgDn::
NumpadDown::
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;po��te�n� rychlost pro Win7 se zd� ide�ln� 0
IS := 0.5 ;Initial Speed
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;po��te�n� akcelerace pro Win7 se zd� ide�ln� 0.5
Ac := 1 ;Acceleration
Loop{
 X := Y := 0
 MouseMove, X := GetKeyState("NumpadEnd","P") ? -IS+=Ac : GetKeyState("NumpadPgDn","P") ? IS+=Ac : X
	  , Y := GetKeyState("NumpadClear","P") ? -IS+=Ac : GetKeyState("NumpadDown","P") ? IS+=Ac : Y,0,R
}until !X && !Y
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;posun kole�kem nahoru - rychlost 2
NumpadRight::Send {WheelUp 2}
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;posun kole�kem dolu - rychlost 2
NumpadLeft::Send {Wheeldown 2}
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;lev� tla��tko
*NumpadHome::
   If (A_PriorHotKey = A_ThisHotKey) ;these are built in variables
   return
MouseClick, left,,, 1, 0, D  ; Hold down the left mouse button.
return
*NumpadHome up::MouseClick, left,,, 1, 0, U  ; Release the mouse button.
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;prav� tla��tko
*NumpadPgUp::
   If (A_PriorHotKey = A_ThisHotKey) ;these are built in variables
   return
MouseClick, right,,, 1, 0, D  ; Hold down the right mouse button.
return
*NumpadPgUp up::MouseClick, right,,, 1, 0, U  ; Release the mouse button.
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;prost�edn� tla��tko
*NumpadUp::
   If (A_PriorHotKey = A_ThisHotKey) ;these are built in variables
   return
MouseClick, middle,,, 1, 0, D  ; Hold down the middle mouse button.
return
*NumpadUp up::MouseClick, middle,,, 1, 0, U  ; Release the mouse button.
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;p�ep�na� pozic
$NumpadIns::
count++
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;st�ed
If count=1
x := (A_ScreenWidth // 2)
y := (A_ScreenHeight // 2)
mousemove, x, y
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;prav�
If count=2
x := (A_ScreenWidth // 1.003)
y := (A_ScreenHeight // 2)
mousemove, x, y
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;lev� - vypnuto
;If count=3
;x := (A_ScreenWidth // -1)
;y := (A_ScreenHeight // 2)
;mousemove, x, y
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;prav� naho�e - pokud je zde ve Win7 um�st�n hlavn� panel ( s automatick�m skr�v�n�m nebo v�dy naho�e ), tak kurzor najede na tla��tko "zobrazit plochu". Pokud si MS oprav� Win11 a znovu umo�n� zobrazit skryt� panel i najet�m do m�st kde jsou tray ikony, tak to bez �prav p�jde i zde
If count=3
{
x := (A_ScreenWidth // 1)
y := (A_ScreenHeight // -1)
mousemove, x, y
count:=0
}
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;4-t� tla��tko my�i
NumpadDel::XButton1
return
;
;
;
;
;
;
;
;
;
;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;kl�vesa menu ( kontextov� nab�dka ) - zobrazit/skr�t hlavn� panel bez nab�dky start ( panel mus� b�t nastaven na automatick� skr�v�n� ) - p�ep�na�. Ve Win11 z�ejm� nefunguje ( bez nutnosti kliknout my�� ) op�tovn� skryt� - probl�m m��e b�t i v m� "zastaral�" verzi Autohotkey 2020, proto�e p��kaz "WinMinimize" provede stejnou v�c jako "WinActivateBottom"
VK5D::
If (Switch := !Switch)
{
WinActivateBottom, ahk_class Shell_TrayWnd
} Else {
WinMinimize, ahk_class Shell_TrayWnd
}
return
;
;
;
;
;
;
;
;
;
;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;lev� WIN - hledat ( CTRL+F )
LWin::SendInput ^{f}
return
;
;
;
;
;
;
;
;
;
;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;pause - ukon�it ( ALT+F4 ) - pokud "SC" a "VK" ��sla odpov�daj� va�� kl�vesnici, tak p�jdou vypnout nap�. i hry, kter� maj� tyto kl�vesy "zablokovan�". Ve Win11 ale takov� "Spr�vce �loh" j�t zav��t nemus�
SC045::
pause::
VK13::
Send, !{F4}
SendInput, {LAlt Up}
return
;
;
;
;
;
;
;
;
;
;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;RControl+Numpad0 - obnovit / maximalizovat okno - p�ep�na�
RControl & Numpad0::
If (Switch := !Switch)
{
   WinRestore, A
} Else {
   WinMaximize, A
}
return
;
;
;
;
;
;
;
;
;
;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;CTRL+ALT+INS - vypnout procesy AutoHotkey
^!insert::
Process, Close, AutoHotkey.exe
Sleep, 100
Process, Close, AutoHotkeyA32.exe
Sleep, 100
Process, Close, AutoHotkeyU32.exe
Sleep, 100
Process, Close, AutoHotkeyU64.exe
return
;
;
;
;
;
;
;
;
;
;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;lev�+prost�edn� tla��tko my�i - ta�en�m my�i ( kdekoli v okn� - ne jenom p�es title bar ) se p�esunuje okno kter� nen� maximalizovan�. Prost�edn� tla��tko se nemus� dr�et celou dobu. ESC vr�t� okno na p�vodn� pozici
~LButton & MButton::
CoordMode, Mouse  ; Switch to screen/absolute coordinates.
MouseGetPos, EWD_MouseStartX, EWD_MouseStartY, EWD_MouseWin
WinGetPos, EWD_OriginalPosX, EWD_OriginalPosY,,, ahk_id %EWD_MouseWin%
WinGet, EWD_WinState, MinMax, ahk_id %EWD_MouseWin% 
if EWD_WinState = 0  ; Only if the window isn't maximized
    SetTimer, EWD_WatchMouse, 10 ; Track the mouse as the user drags it.
return
;
EWD_WatchMouse:
GetKeyState, EWD_LButtonState, LButton, P
if EWD_LButtonState = U  ; Button has been released, so drag is complete.
{
    SetTimer, EWD_WatchMouse, Off
    return
}
GetKeyState, EWD_EscapeState, Escape, P
if EWD_EscapeState = D  ; Escape has been pressed, so drag is cancelled.
{
    SetTimer, EWD_WatchMouse, Off
    WinMove, ahk_id %EWD_MouseWin%,, %EWD_OriginalPosX%, %EWD_OriginalPosY%
    return
}
; Otherwise, reposition the window to match the change in mouse coordinates
; caused by the user having dragged the mouse:
CoordMode, Mouse
MouseGetPos, EWD_MouseX, EWD_MouseY
WinGetPos, EWD_WinX, EWD_WinY,,, ahk_id %EWD_MouseWin%
SetWinDelay, -1   ; Makes the below move faster/smoother.
WinMove, ahk_id %EWD_MouseWin%,, EWD_WinX + EWD_MouseX - EWD_MouseStartX, EWD_WinY + EWD_MouseY - EWD_MouseStartY
EWD_MouseStartX := EWD_MouseX  ; Update for the next timer-call to this subroutine.
EWD_MouseStartY := EWD_MouseY
return
;
;
;
;
;
;
;
;
;
;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;F12 zapne/vypne fullscreen - p�ep�na� ( u�ite�n� pro hry )
;;; Known issues:
;;;
;;; - Weird results for windows with custom decorations such as
;;; Chrome, or programs with a Ribbon interface.
;;; - Emacs will be maximized behind instead of in front of
;;; the taskbar. Workaround: WinHide ahk_class Shell_TrayWnd
ToggleFakeFullscreen()
{
CoordMode Screen, Window
static WINDOW_STYLE_UNDECORATED := -0xC40000
static savedInfo := Object() ;; Associative array!
WinGet, id, ID, A
if (savedInfo[id])
{
inf := savedInfo[id]
WinSet, Style, % inf["style"], ahk_id %id%
WinMove, ahk_id %id%,, % inf["x"], % inf["y"], % inf["width"], % inf["height"]
savedInfo[id] := ""
}
else
{
savedInfo[id] := inf := Object()
WinGet, ltmp, Style, A
inf["style"] := ltmp
WinGetPos, ltmpX, ltmpY, ltmpWidth, ltmpHeight, ahk_id %id%
inf["x"] := ltmpX
inf["y"] := ltmpY
inf["width"] := ltmpWidth
inf["height"] := ltmpHeight
WinSet, Style, %WINDOW_STYLE_UNDECORATED%, ahk_id %id%
mon := GetMonitorActiveWindow()
SysGet, mon, Monitor, %mon%
WinMove, A,, %monLeft%, %monTop%, % monRight-monLeft, % monBottom-monTop
}
}

GetMonitorAtPos(x,y)
{
;; Monitor number at position x,y or -1 if x,y outside monitors.
SysGet monitorCount, MonitorCount
i := 0
while(i < monitorCount)
{
SysGet area, Monitor, %i%
if ( areaLeft <= x && x <= areaRight && areaTop <= y && y <= areaBottom )
{
return i
}
i := i+1
}
return -1
}

GetMonitorActiveWindow(){
;; Get Monitor number at the center position of the Active window.
WinGetPos x,y,width,height, A
return GetMonitorAtPos(x+width/2, y+height/2)
}

F12::ToggleFakeFullscreen()
return
;
;
;
;
;
;
;
;
;
;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;F11 - zabr�n� kurzoru my�i pohyb mimo aktivn� okno - p�ep�na� ( u�ite�n� pro hry )
F11::
If (Switch := !Switch)
{
KeyWait F11
ClipCursor( Confine=True, x1=0 , y1=0, x2=1, y2=1 ) {
 VarSetCapacity(R,16,0),  NumPut(x1,&R+0),NumPut(y1,&R+4),NumPut(x2,&R+8),NumPut(y2,&R+12)
Return Confine ? DllCall( "ClipCursor", UInt,&R ) : DllCall( "ClipCursor" )
}
;f11::     ;on
WinGetPos, VarX, VarY, Width, Height, A
Varx := VarX + 10
Vary := VarY + 30
VarX2 := VarX + Width - 20    ;10 + 10
VarY2 := VarY + Height - 40   ;30 + 10
ClipCursor( True, VarX, VarY, VarX2, VarY2)
} Else {
KeyWait F11
ClipCursor( False, VarX, VarY, VarX2, VarY2)
}
Return
;
;
;
;
;
;
;
;
;
;
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;AUTOHOTKEY-WindowSpy.ahk. Zapnout "ScrollLock", aktivovat okno do pop�ed� "ALTGR+M, zav��t "ESC"
ScrollLock::
;#NoEnv
;#NoTrayIcon
;#SingleInstance Ignore
SetWorkingDir, %A_ScriptDir%
SetBatchLines, -1
CoordMode, Pixel, Screen

IfExist, ..\toolicon.icl ; Seems useful enough to support standalone operation.
	Menu, Tray, Icon, ..\toolicon.icl, 9

try
    Hotkey #a, FreezeDisplay
catch
    Hotkey #vk41, FreezeDisplay

isUpd := true
txtNotFrozen := "(ALTGR+M - aktivovat do pop�ed�             ESC - zav��t)"
txtFrozen := "(l to unfreeze display)"

Gui, New, hwndhGui AlwaysOnTop Resize MinSize
Gui, Add, Text,, Window Title, Class and Process:
Gui, Add, Edit, w320 r3 ReadOnly -Wrap vCtrl_Title
Gui, Add, Text,, Mouse Position:
Gui, Add, Edit, w320 r3 ReadOnly vCtrl_MousePos
Gui, Add, Text,, Control Under Mouse Position:
Gui, Add, Edit, w320 r5 ReadOnly vCtrl_MouseCur
Gui, Add, Text,, Active Window Position:
Gui, Add, Edit, w320 r2 ReadOnly vCtrl_Pos
Gui, Add, Text,, Status Bar Text:
Gui, Add, Edit, w320 r2 ReadOnly vCtrl_SBText
Gui, Add, Checkbox, vCtrl_IsSlow, Slow TitleMatchMode
Gui, Add, Text,, Visible Text:
Gui, Add, Edit, w320 r2 ReadOnly vCtrl_VisText
Gui, Add, Text,, All Text:
Gui, Add, Edit, w320 r2 ReadOnly vCtrl_AllText
Gui, Add, Text, w320 r1 vCtrl_Freeze, % txtNotFrozen
Gui, Show,, Active Window Info
GetClientSize(hGui, temp)
horzMargin := temp*96//A_ScreenDPI - 320
SetTimer, Update, 250
return

GuiSize:
Gui %hGui%:Default
if !horzMargin
	return
ctrlW := A_GuiWidth - horzMargin
list = Title,MousePos,MouseCur,Pos,SBText,VisText,AllText,Freeze
Loop, Parse, list, `,
	GuiControl, Move, Ctrl_%A_LoopField%, w%ctrlW%
return

Update:
Gui %hGui%:Default
curWin := WinExist("A")
if (curWin = hGui)
	return
WinGetTitle, t1
WinGetClass, t2
WinGet, t3, ProcessName
GuiControl,, Ctrl_Title, % t1 "`nahk_class " t2 "`nahk_exe " t3
CoordMode, Mouse, Screen
MouseGetPos, msX, msY, msWin, msCtrlHwnd, 2
CoordMode, Mouse, Relative
MouseGetPos, mrX, mrY,, msCtrl
CoordMode, Mouse, Client
MouseGetPos, mcX, mcY
GuiControl,, Ctrl_MousePos, % "Absolute:`t" msX ", " msY " (less often used)`nRelative:`t" mrX ", " mrY " (default)`nClient:`t" mcX ", " mcY " (recommended)"
PixelGetColor, mClr, %msX%, %msY%, RGB
mClr := SubStr(mClr, 3)
mText := "`nColor:`t" mClr " (Red=" SubStr(mClr, 1, 2) " Green=" SubStr(mClr, 3, 2) " Blue=" SubStr(mClr, 5) ")"
if (curWin = msWin)
{
	ControlGetText, ctrlTxt, %msCtrl%
	mText := "ClassNN:`t" msCtrl "`nText:`t" textMangle(ctrlTxt) mText
    ControlGetPos cX, cY, cW, cH, %msCtrl%
    mText .= "`n`tx: " cX "`ty: " cY "`tw: " cW "`th: " cH
    WinToClient(msWin, cX, cY)
    GetClientSize(msCtrlHwnd, cW, cH)
    mText .= "`nClient:`tx: " cX "`ty: " cY "`tw: " cW "`th: " cH
} else mText := "`n" mText
GuiControl,, Ctrl_MouseCur, % mText
WinGetPos, wX, wY, wW, wH
GetClientSize(curWin, wcW, wcH)
GuiControl,, Ctrl_Pos, % "`tx: " wX "`ty: " wY "`tw: " wW "`th: " wH "`nClient:`t`t`tw: " wcW "`th: " wcH
sbTxt := ""
Loop
{
	StatusBarGetText, ovi, %A_Index%
	if ovi =
		break
	sbTxt .= "(" A_Index "):`t" textMangle(ovi) "`n"
}
StringTrimRight, sbTxt, sbTxt, 1
GuiControl,, Ctrl_SBText, % sbTxt
GuiControlGet, bSlow,, Ctrl_IsSlow
if bSlow
{
	DetectHiddenText, Off
	WinGetText, ovVisText
	DetectHiddenText, On
	WinGetText, ovAllText
}
else
{
	ovVisText := WinGetTextFast(false)
	ovAllText := WinGetTextFast(true)
}
GuiControl,, Ctrl_VisText, % ovVisText
GuiControl,, Ctrl_AllText, % ovAllText
return

GuiClose:
ExitApp

WinGetTextFast(detect_hidden)
{
	; WinGetText ALWAYS uses the "fast" mode - TitleMatchMode only affects
	; WinText/ExcludeText parameters.  In Slow mode, GetWindowText() is used
	; to retrieve the text of each control.
	WinGet controls, ControlListHwnd
	static WINDOW_TEXT_SIZE := 32767 ; Defined in AutoHotkey source.
	VarSetCapacity(buf, WINDOW_TEXT_SIZE * (A_IsUnicode ? 2 : 1))
	text := ""
	Loop Parse, controls, `n
	{
		if !detect_hidden && !DllCall("IsWindowVisible", "ptr", A_LoopField)
			continue
		if !DllCall("GetWindowText", "ptr", A_LoopField, "str", buf, "int", WINDOW_TEXT_SIZE)
			continue
		text .= buf "`r`n"
	}
	return text
}

GetClientSize(hWnd, ByRef w := "", ByRef h := "")
{
	VarSetCapacity(rect, 16)
	DllCall("GetClientRect", "ptr", hWnd, "ptr", &rect)
	w := NumGet(rect, 8, "int")
	h := NumGet(rect, 12, "int")
}

WinToClient(hWnd, ByRef x, ByRef y)
{
    WinGetPos wX, wY,,, ahk_id %hWnd%
    x += wX, y += wY
    VarSetCapacity(pt, 8), NumPut(y, NumPut(x, pt, "int"), "int")
    if !DllCall("ScreenToClient", "ptr", hWnd, "ptr", &pt)
        return false
    x := NumGet(pt, 0, "int"), y := NumGet(pt, 4, "int")
    return true
}

textMangle(x)
{
	if pos := InStr(x, "`n")
		x := SubStr(x, 1, pos-1), elli := true
	if StrLen(x) > 40
	{
		StringLeft, x, x, 40
		elli := true
	}
	if elli
		x .= " (...)"
	return x
}

FreezeDisplay:
Gui %hGui%:Default
isUpd := !isUpd
SetTimer, Update, % isUpd ? "On" : "Off"
GuiControl,, Ctrl_Freeze, % isUpd ? txtNotFrozen : txtFrozen
return
<^>!m::
WinActivateBottom, ahk_exe AutoHotkeyU64.exe
return
#IfWinActive, ahk_exe AutoHotkeyU64.exe
ESC::WinHide, ahk_exe AutoHotkeyU64.exe
;#IfWinActive, C:\_NOVE\Autohotkey\AutoHotkey.ini - AutoHotkey v1.1.33.02
;Mbutton::^k
Return