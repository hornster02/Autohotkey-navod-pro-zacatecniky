/*
-přehlednost tohoto textu se zásadně zvýší použitím nějakého pokročilejšího textového editoru se syntaxí ( ať už vlastní nebo typu AutoIt/Autohotkey ). Třeba Notepad++

-funkční skripty včetně popisů začínají od "666" - ve Win7 fungují bez problému - většinou i ve Win11. Žádný z nich nedělá trvalý zásah do systému a po stisknutí CTRL+ALT+INS se všechny Autohotkey procesy ukončí

-aby nedošlo k nefunkčnosti některých skriptů a problémům s diakritikou, tak se musí tento soubor spustit přes "AutoHotkeyU64.exe" a ne přes výchozí "AutoHotkey.exe" - např. "c:\AutoHotkey\AutoHotkeyU64.exe info.ahk" ( v tomto případě by se musel tento soubor nakopírovat do složky programu ). Nebo přes kontextovou nabídku "otevřít v programu". Na příponě souboru ale nijak zvlášť nezáleží ( txt/ini/ahk/... )

-stažení aplikace a vypsané klávesy a tlačítka myši
https://www.autohotkey.com/download/
https://www.autohotkey.com/docs/v1/KeyList.htm
https://www.autohotkey.com/docs/v1/Hotkeys.htm


-může se hodit
https://www.autohotkey.com/docs/Tutorial.htm
https://www.autohotkey.com/docs/v1/scripts/index.htm


-znaky /* ( začátek ) a */ ( konec ) slouží pro vyznačení prostoru pro komentář - pro funkčnost skriptu v této oblasti se musí tyto znaky smazat ( *0 nedoporučuji to v tomto případě dělat, protože níže jsou skripty které by se mohly automaticky spustit pokud u nich chybí aktivační tlačítko a tím se zacyklit - případně provádět další neplechu - jedná se hlavně o krátké a jednoduché ukázky ) a nebo nakopírovat mimo ně. Znak ; slouží pro začátek komentáře na novém řádku. Znaky " ;" ( mezera+středník ) slouží pro začátek komentáře na řádku s příkazem

-WindowSpy.ahk ve složce programu Autohotkey slouží ke zjištění podrobností oken, pozice myši atd. Samotný kód skriptu je už zde obsažen a klávesou "ScrollLock" se okno otevře

-VK=Virtual Key, SC=Scan Code - další možnost jak použít potřebnou klávesu ( některé programy určité klávesy blokují ). Například klávesa "a" se dá napsat také jako "VK41" nebo "SC01E". Klávesy se dají zjistit v okně Autohotkey - CTRL+K - včetně multimediálních atd. Různé klávesnice mají různé označení kláves a tak některé mnou napsané VK a SC klávesy nemusí vždy odpovídat skutečnosti. Klávesa WIN se může napsat jako #      ALT !      CTRL ^      SHIFT +      ALTGR <^>!      Příklad použití následuje po vyhledání ^!PgUp      Ukázky skriptů níže jsou chaoticky napsány ve všech těchto formátech pro co největší rozmanitost

-text před :: ( dvojitá dvojtečka ) je pro klávesy/tlačítka. Text za nimi je pro samotné příkazy ( pokud je jenom jeden, tak může být na stejném řádku ). Pokud je jich více, tak je psát na další řádky. Např.
a::Click, 366, 195 ;;;;;;;;;;;;;;;;;;;;;;;;;;1 příkaz
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;nebo
a::
Click, 366, 195 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;1 příkaz
SendInput {RButton up} ;;;;;;;;;;;;;;;2 příkaz

-při určitém napsání skriptu se někdy může stát, že dojde k neuvolnění klávesy ( tzv. hook - dá se zjistit z okna programu - Hook's Logical, Physical ) - například klávesa CTRL, která je pořád virtuálně stisknutá může dělat nechtěné věci ( třeba změna velikosti stránky ve webovém prohlížeči v kombinaci s kolečkem myši ) a jakousi "nefunkčnost" klávesnice. Nejlepší je tomu předcházet patřičně napsaným skriptem, ale "odhookování" klávesy se dá provést jejím ( případně ALT, ALTGR, SHIFT, WIN ) fyzickým stisknutím










;;;;;;;;;;;;částečná shoda názvu okna ( ideálně napsat na úplný začátek skriptu )
SetTitleMatchMode, 2
;;;;;;;;;;;;;;;;;;;;;;;;na začátku skriptu se může také hodit např. některá z těchto direktiv. #NoEnv ale může částečně narušit jeden jinak funkční skript níže ( vyhledat "F11" )
#InstallKeybdHook
#SingleInstance, force
#NoTrayIcon
#NoEnv


;;;;;;;;;;;;;;;;;;;;;pokud je okno v popředí ( title, class, process - viz "WindowSpy.ahk" ), tak...
#IfWinActive


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;klik myší do konkrétní části ( názvu ) okna ( ClassNN - viz "WindowSpy.ahk" )
ControlClick


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;klik myší ( souřadnice )
Click


;;;;;;;;;;;;;;;;pohyb myší na souřadnici
MouseMove


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;aktivovat okno do popředí
WinActivateBottom


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;*.exe soubory a jejich ukončování a jiné
Process


;;;;;;;;;;;;;;;;;;;;;;;;nastavení hlasitosti +- mute. Pokud se napíše třeba číslo 5, tak se hlasitost změní o 5%
SoundSet


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;napsat text
SendInput


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;převážně stisknout klávesu(y) - řetězec
Send


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;oddělovač funkcí - návrat na začátek
Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;spustit
Run


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;počkat
sleep


;;;;;;;;;;;;;;;;;;;;;;;;;;;čárka - např. pro (Run, c:\OverdriveNTool.exe -p0"0,3") se napíše (Run, c:\OverdriveNTool.exe -p0"0`,3")
`,


;;;;;;;;;;;;;;;;;;;;;;ukončit skript
ExitApp










;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;od této části by skripty fungovaly samy o sobě. Ale nedoporučuji je zkoušet jen tak naslepo - viz *0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;automatická kontrola čehokoli - v tomto případě každou vteřinu ( bližší popisky u příkazů níže ). I zde je možné pod sebe štosovat desítky a stovky různých příkazů - "return" bude pouze jeden na konci
settimer, check, 1000
check:
if WinExist("ahk_class TForm_StabilityTest") && WinExist("ahk_exe aida64.exe") ;;;;;;;;;;;;pokud existuje okno s těmito názvy
WinMove, ahk_class TForm_StabilityTest, , -5, -10, 10000, 10000 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;tak zvětšit okno na celou obrazovku a posunout doleva nahoru do mínusu ( skrýt 5px a 10px )
if WinExist("Obnova dokumentů LibreOffice 6.2") && WinExist("ahk_exe soffice.bin") ;;;;;;pokud existuje okno s těmito názvy
WinActivateBottom, ahk_exe soffice.bin ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;tak aktivovat do popředí proces "soffice.bin"
WinClose,Obnova dokumentů LibreOffice 6.2 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;a zavřít okno "Obnova dokumentů LibreOffice 6.2"
if WinExist("ahk_exe FullEventLogView.exe") ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;pokud je spuštěný tento proces
WinSet, Style, -0xC00000 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;tak odstranit "titlebar" ( lišta s minimalizovat/maximalizovat/zavřít a názvem okna ) - univerzální příkaz
DllCall("SetMenu", uint, WinExist(), uint, 0) ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;odstranit záhlaví ( lišta s příkazy pod "titlebar" ) - univerzální příkaz
Control, hide , , ToolbarWindow321 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;odstranit ovládací ikony programu ( název lišty je pod ClassNN v "WindowSpy.ahk" )
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;stisknutí "a" napíše "b"
a::b
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;zablokuje klávesu "a"
a::Return
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;zablokuje klávesu "a" v procesu "aida64.exe"
#IfWinActive, ahk_exe aida64.exe
a::Return
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;stisknutí "LAlt" provede tažení levým tlačítkem myši z pozice "537, 300" do "500, 1048"
LAlt::MouseClickDrag, left, 537, 300, 500, 1048
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;stisknutí "LAlt" a jeho uvolnění (Up) provede tažení levým tlačítkem myši z pozice "537, 300" do "500, 1048". Díky znaku ~ ( vlnovka ) nedojde k zablokování klávesy skriptem pro sebe, ale je možné použít i např. výchozí Win zkratku ALT+TAB
~LAlt Up::MouseClickDrag, left, 537, 300, 500, 1048
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;po kliknutí pravým tlačítkem myši zůstane tlačítko stisknuté dokud nedojde k opětovnému kliknutí ( přepínač ). Užitečné pro hry
RButton::
KeyDown := !KeyDown
If KeyDown
SendInput {RButton down}
Else
SendInput {RButton up}
Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;po stisknutí "c" zůstane klávesa stisknutá dokud nedojde k opětovnému stisknutí ( přepínač ). Užitečné pro hry
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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;ALTGR+l - přepínač dvou klávesových zkratek ( CTRL+ALT+Numpad4 a CTRL+ALT+Numpad5 )
VKA5 & SC026::
KeyDown := !KeyDown
If KeyDown
SendInput ^!{Numpad4}
Else
SendInput ^!{Numpad5}
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;kopírování+přepsání ( 1 ano, 0 ne )
FileCopy, c:\_NOVE\_NASTAVENI\ClickMonitorDDC\1\ClickMonitorDDC.xml, c:\_NOVE\_NASTAVENI\ClickMonitorDDC, 1
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;smazat hodnotu z registru
RegDelete, HKEY_LOCAL_MACHINE, SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer, MaxCachedTiles15E
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;krátký příklad vlastního "po spuštění" skriptu ( a nemuset používat tu MS hrůzu rozesetou po celém systému ). Bližší popisky u příkazů níže
Run, c:\nsmc.exe ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;spustit program
Sleep 2000 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;2 vteřiny počkat
FileRemoveDir, a:\$RECYCLE.BIN, 1 ;;;;;;;;;;;;;;;;;;;;;;;;smazat složku (koš) s veškerým obsahem
FileCopy, c:\$Recycle.Bin, a:\$Recycle.Bin, 1 ;;;;;;;;;;;;nakopírovat soubor/složku z "c:" do "a:" a přepsat ( vzhledem k předchozímu příkazu ale není co přepisovat ). Pokud se nakopíruje soubor, tak se vytvoří ten jediný správný "koš" = žádný
Run, c:\nircmdc.exe ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;spustit program
WinActivateBottom, ahk_exe TOTALCMD64.EXE ;;;aktivovat do popředí okno "TOTALCMD64.EXE"
Send ^+!{r} ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;zmáčknout CTRL+SHIFT+ALT+R
MouseMove, 100, 600 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;posun myší na souřadnice
Send {Down 100}{Enter} ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;stisknout 100x šipku dolů a Enter
exit ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;ukončit skript


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;stisknutím ALTGR+F7 dojde ke spuštění programu č.1 - při dalším programu č.2 - při dalším programu č.3 - při dalším programu č.1 - ... Cyklus - přepínač
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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;restartovat počítač klávesou CTRL+ALT+PgUp. V tomto případě na sílu (2+4=6) = rozpracované věci se neuloží. Pokud PC není seklé a přepínání "NumLock" funguje, tak je lepší tento způsob, než použití vypínacího/restartovacího tlačítka s potenciálně horšími následky. Odhlásit (0), vypnout (1), restart (2), "síla" (přičíst 4)
^!PgUp::Shutdown, 6
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;pokud je aktivní "aida64.exe", tak jedno otočení kolečkem nahoru udělá dvě otočení
#IfWinActive, ahk_exe aida64.exe
WheelUp::Send {WheelUp 2}
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;pokud je aktivní "Uložit" ( část názvu okna nebo celý název - viz "SetTitleMatchMode" - níže už to nebudu znovu uvádět ), tak klávesa Numpad0 nastaví okno na "vždy v popředí" ( přepínač )
#IfWinActive, Uložit
Numpad0::Winset, Alwaysontop, Toggle, A
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;pokud je aktivní "Notepad++", tak stisknutím prostředního tlačítka myši se provede klik levým tlačítkem myši na souřadnicích, vteřinu počká a následuje další klik
#IfWinActive, ahk_class Notepad++
Mbutton::
Click, 366, 195
sleep 1000
Click, 356, 222
Return


;;;;;;;;;;;;;pokud je aktivní "hexelon.exe", tak stiknutí "END" provede klik pravým tlačítkem na souřadnicích / 0,5 vteřiny počká / 3x šipka dolů / enter / klik levým tlačítkem na souřadnicích ( zkopírování výsledku na kalkulačce )
#IfWinActive, ahk_exe hexelon.exe
End::
Send {Click right, 14 93}
sleep 500
Send {Down 3}{Enter}{Click, 441 167}
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;pokud je aktivní část názvu okna programu Firefox, tak kliknutím X1 tlačítka myši se provede několik kliků levým tlačítkem na souřadnicích ( včetně čekání ) / dojde ke stisknutí ALT+levá šipka / posun myší na souřadnice. V mém nastavení to znamená otevřít spam složku, označit všechny emaily, několikrát potvrdit že se nejedná o spam a přesunout je do složky doručené a vrátit se na původní stránku. Od teď ti drzí krastyové nebudou nikdy zdržovat
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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;pokud je aktivní část názvu okna programu Firefox, tak kliknutím X1 tlačítka myši se provede spuštění/pozastavení videa, zapnutí/vypnutí fullscreen a pohyb myší na souřadnice
#IfWinActive, - YouTube - Firefox Developer Edition
XButton1::
Send {space}{f}
MouseMove, 2800, 540
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;pokud je aktivní část názvu okna programu Firefox, tak zkratka RCtrl+Num7 klikne na souřadnice / počká na levý klik myší uživatelem / počká 0,2 vteřiny / provede pohyb myší na souřadnice
#IfWinActive, - YouTube - Firefox Developer Edition
RControl & Numpad7::
Click, 2402, 1035
KeyWait, Lbutton, D
sleep 200
MouseMove, 2800, 540
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;pokud je aktivní "WinRAR.exe", tak zkratka ALTGR+C napíše cestu ke složce
#IfWinActive, ahk_exe WinRAR.exe
VKA5 & SC02E::SendInput, c:\_X\.windows\
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;pokud je aktivní "AutoHotkeyU64.exe", tak ESC schová okno ( v případě tohoto programu do tray )
#IfWinActive, ahk_exe AutoHotkeyU64.exe
ESC::WinHide, ahk_exe AutoHotkeyU64.exe
return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;po napsání znaků ",.d" se napíše aktuální datum a původní znaky se smažou
:OC*:,.d::
	send %A_DD%.%A_MM%.%A_YYYY%
Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;po napsání znaků ",.a" v aktivním procesu "notepad++.exe" se napíše emailová adresa / počká na kliknutí prostředním tlačítkem myši uživatelem / napíše poštovní směrovací číslo. Původní znaky se smažou
#IfWinActive, ahk_exe notepad++.exe
:OC*:,.a::
SendInput, 2023-01@seznam.cz
KeyWait, Mbutton, D
SendInput, 999 88
Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;CTRL+ALT+PgUp - pozastavení/pokračování (suspend) procesu "lorelai.exe" (přepínač s 3 vteřinovým oznámením). Velmi užitečné např. v případě zapnutého programu s vysokými nároky na výkon PC. Pokud je potřeba veškerý výkon použít jinde, tak tímto přepínačem se proces bez ukončení pozastaví. Může také dojít k zásadnímu snížení spotřeby/teplot/hlučnosti
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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;pokud je kurzor myši na "titlebar", tak kolečkem se okno zvětšuje/zmenšuje


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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;666;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;níže následuje funkční skript bez nutných dalších úprav
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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;-ovládání myši klávesnicí ( vypnout numerickou klávesnici ) - pohyb včetně šikmého (1235), levé+prostřední+pravé tlačítko včetně možnosti Drag and drop a dvojkliku (789), kolečko dolu+nahoru (46), pohyb kurzoru do tří určených pozic (0), 4-té tlačítko myši (.). Snadná úprava rychlosti a akcelerace. Od teď už není nutné mít vystudovanou vysokou školu na zapamatování si výchozího a osekaného MS výmyslu
NumpadClear::
NumpadEnd::
NumpadPgDn::
NumpadDown::
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;počáteční rychlost pro Win7 se zdá ideální 0
IS := 0.5 ;Initial Speed
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;počáteční akcelerace pro Win7 se zdá ideální 0.5
Ac := 1 ;Acceleration
Loop{
 X := Y := 0
 MouseMove, X := GetKeyState("NumpadEnd","P") ? -IS+=Ac : GetKeyState("NumpadPgDn","P") ? IS+=Ac : X
	  , Y := GetKeyState("NumpadClear","P") ? -IS+=Ac : GetKeyState("NumpadDown","P") ? IS+=Ac : Y,0,R
}until !X && !Y
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;posun kolečkem nahoru - rychlost 2
NumpadRight::Send {WheelUp 2}
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;posun kolečkem dolu - rychlost 2
NumpadLeft::Send {Wheeldown 2}
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;levé tlačítko
*NumpadHome::
   If (A_PriorHotKey = A_ThisHotKey) ;these are built in variables
   return
MouseClick, left,,, 1, 0, D  ; Hold down the left mouse button.
return
*NumpadHome up::MouseClick, left,,, 1, 0, U  ; Release the mouse button.
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;pravé tlačítko
*NumpadPgUp::
   If (A_PriorHotKey = A_ThisHotKey) ;these are built in variables
   return
MouseClick, right,,, 1, 0, D  ; Hold down the right mouse button.
return
*NumpadPgUp up::MouseClick, right,,, 1, 0, U  ; Release the mouse button.
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;prostřední tlačítko
*NumpadUp::
   If (A_PriorHotKey = A_ThisHotKey) ;these are built in variables
   return
MouseClick, middle,,, 1, 0, D  ; Hold down the middle mouse button.
return
*NumpadUp up::MouseClick, middle,,, 1, 0, U  ; Release the mouse button.
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;přepínač pozic
$NumpadIns::
count++
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;střed
If count=1
x := (A_ScreenWidth // 2)
y := (A_ScreenHeight // 2)
mousemove, x, y
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;pravá
If count=2
x := (A_ScreenWidth // 1.003)
y := (A_ScreenHeight // 2)
mousemove, x, y
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;levá - vypnuto
;If count=3
;x := (A_ScreenWidth // -1)
;y := (A_ScreenHeight // 2)
;mousemove, x, y
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;pravá nahoře - pokud je zde ve Win7 umístěn hlavní panel ( s automatickým skrýváním nebo vždy nahoře ), tak kurzor najede na tlačítko "zobrazit plochu". Pokud si MS opraví Win11 a znovu umožní zobrazit skrytý panel i najetím do míst kde jsou tray ikony, tak to bez úprav půjde i zde
If count=3
{
x := (A_ScreenWidth // 1)
y := (A_ScreenHeight // -1)
mousemove, x, y
count:=0
}
return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;4-té tlačítko myši
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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;klávesa menu ( kontextová nabídka ) - zobrazit/skrýt hlavní panel bez nabídky start ( panel musí být nastaven na automatické skrývání ) - přepínač. Ve Win11 zřejmě nefunguje ( bez nutnosti kliknout myší ) opětovné skrytí - problém může být i v mé "zastaralé" verzi Autohotkey 2020, protože příkaz "WinMinimize" provede stejnou věc jako "WinActivateBottom"
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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;levý WIN - hledat ( CTRL+F )
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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;pause - ukončit ( ALT+F4 ) - pokud "SC" a "VK" čísla odpovídají vaší klávesnici, tak půjdou vypnout např. i hry, které mají tyto klávesy "zablokované". Ve Win11 ale takový "Správce úloh" jít zavřít nemusí
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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;RControl+Numpad0 - obnovit / maximalizovat okno - přepínač
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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;levé+prostřední tlačítko myši - tažením myši ( kdekoli v okně - ne jenom přes title bar ) se přesunuje okno které není maximalizované. Prostřední tlačítko se nemusí držet celou dobu. ESC vrátí okno na původní pozici
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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;F12 zapne/vypne fullscreen - přepínač ( užitečné pro hry )
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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;F11 - zabrání kurzoru myši pohyb mimo aktivní okno - přepínač ( užitečné pro hry )
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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;AUTOHOTKEY-WindowSpy.ahk. Zapnout "ScrollLock", aktivovat okno do popředí "ALTGR+M, zavřít "ESC"
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
txtNotFrozen := "(ALTGR+M - aktivovat do popředí             ESC - zavřít)"
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
