AHK soubor v archivu se dá otevřít v poznámkovém bloku ( nebo pokud je Autohotkey v PC nainstalován, tak rovnou spustit jako obyčejný EXE soubor ). Skript nemá - kromě funkce "WindowSpy" - žádné uživatelské rozhraní. AHK obsahuje pár funkčních skriptů jako jsou

-klávesa menu ( kontextová nabídka ) - zobrazit/skrýt hlavní panel bez nabídky start ( panel musí být nastaven na automatické skrývání )

-levý WIN - hledat ( CTRL+F )

-pause - ukončit ( ALT+F4 )

-RControl+Numpad0 - obnovit/maximalizovat okno

-levé+prostřední tlačítko myši - tažením myši ( kdekoli v okně - ne jenom přes title bar ) se přesunuje okno které není maximalizované. Prostřední tlačítko se nemusí držet celou dobu

-F12 zapne/vypne fullscreen ( užitečné pro hry )

-F11 - zabrání kurzoru myši pohyb mimo aktivní okno ( užitečné pro hry )

-ScrollLock - informace o oknech ( WindowSpy )

-ovládání myši klávesnicí ( vypnout numerickou klávesnici ) - pohyb včetně šikmého (1235), levé+prostřední+pravé tlačítko včetně možnosti Drag and drop a dvojkliku (789), kolečko dolu+nahoru (46), pohyb kurzoru do tří určených pozic (0), 4-té tlačítko myši (.). Snadná úprava rychlosti+akcelerace+scrollingu ( změnou hodnot v kódu )

-otáčení kolečka myši na "titlebar" mění velikost okna

-pozastavení/pokračování (suspend) procesů klávesovým přepínačem

*malý postřeh - pokud je ve Windows zapnutý UAC, tak zřejmě dojde k zásadnímu omezení aplikace tím, že se bude spouštět s nižšími právy (elevation medium), čímž bude (jakýkoli) skript fungovat jenom někde. Přes program "Winaero Tweaker" by mělo jít UAC opravdu vypnout a tím pádem užívat "elevation high"
