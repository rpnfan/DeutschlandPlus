; DeutschlandPlus 1.0
; 2022-12-10
; Versionssyntax: major.minorLaufendeNummer

; Der Strichpunkt ist das Kommentarzeichen - Entfernen, wenn eine Zeile wieder aktiv sein soll!

; =================== allgemeine Einstellungen ==============

; Caps-Lock wird als Modifier genutzt:
; CapsLock-Funktion trotzdem bei einfachem Drücken beibehalten!

/* ; uncomment block - begin
keepCapslockFunction:
sc03a::
    GetKeyState, CapsToggleState, CapsLock, T
    if CapsToggleState = D
    {
	SetCapsLockState, off
    }
    else
    {
	SetCapsLockState, on
    }
    return
*/ ; uncomment block - end

; =====================================================
; ===================== HOTKEYS =======================
; =====================================================
; Alle AltGr-Zeichen über CapsLock verfügbar machen, sowie alle AltGr-Zeichen der linken Hand auf der rechten Hand verfügbar und nicht zuletzt den Steuerblock (Pfeile usw.) auch auf der rechten Hand in Grundstellung nutzbar.


; --- Bewegungshotkeys ------
; Trick mit Sendmovekey berücksichtigt auch Shift und Ctrl-Key-Combos
sc03a & h::Sendmovekey("{Left}")
sc03a & l::Sendmovekey("{Right}")
sc03a & j::Sendmovekey("{Down}")
sc03a & k::Sendmovekey("{Up}")

sc03a & i::Sendmovekey("{PgUp}")
sc03a & ,::Sendmovekey("{PgDn}")
sc03a & n::Sendmovekey("{Home}")  ; Home = Pos1
sc03a & -::Sendmovekey("{End}")

Sendmovekey(thekey)
{
  mod=
  if GetKeyState("Shift")
    mod=+
  if GetKeyState("Control")
    mod=%mod%^
  Send %mod%%thekey%
  return
}


; ----Löschen-Tasten und ESC -----
sc03a & BS::Send {Delete}	; vorwärts löschen
sc03a & u::Send {Delete}	; Delete als _u_ndo
sc03a & Space::Send {ESC}
sc03a & z::Send {Ins} ; Einfügen-Taste (Insert)
sc03a & ö::Send {Backspace} ; Quadrat - Merkhilfe: 3 Punkte auf der .-Taste

; ---- Zeichen ----
sc03a & o::Send {€} ; Euro
sc03a & e::Send {€} ; Euro
sc03a & ä::Send {@} ; @
sc03a & q::Send {@} ; @
sc03a & +::Send {~} ; Tilde
sc03a & 7::Send {{} ; geschweifte Klammer öffnen
sc03a & 0::Send {}} ; geschweifte Klammer schließen
sc03a & 8::Send {[} ; eckige Klammer öffnen
sc03a & 9::Send {]} ; eckige Klammer schließen
sc03a & ß::Send {\} ; Backslash
sc03a & m::Send {µ} ; mu
sc03a & 2::Send {²} ; Quadrat - 
sc03a & ´::Send {²} ; Quadrat - Merkhilfe: 2 Striche auf der Akzenttaste
sc03a & 3::Send {³} ; Kubik
sc03a & .::Send {³} ; Kubik - Merkhilfe: 3 Punkte auf der Taste
sc03a & <::Send {|} ; Strich (engl.: bar)

; folgend größer bzw. kleiner und Pipe, um das auf amerikanischer (ANSI-) Tastatur erreichen zu können, da die <-Taste neben der linken Umschalttaste fehlt
; wer das nicht braucht, da er immer mit deutscher (ISO-) Tastatur tippt kann die drei Tasten anders belegen
sc03a & p::Send {<} ; kleiner als
sc03a & ü::Send {>} ; größer als
sc03a & '::Send {|} ; Strich (engl.: bar)

; Alt-Tab mit Enter
sc03a & Enter:: AltTab

; beliebige Unicode, HTLM, json usw. Zeichen und entsprechende Kodierungen
; "Any-key"
OpenURL(u) {
	WinActivate, Program Manager
	Run %u%
	return
}
sc03a & RShift:: OpenURL("https://www.amp-what.com") ; "Any-Key"



; =================================================================
; ========================== Hotstrings ===========================
; =================================================================
; Hotstrings geben ein oder mehrere Zeichen aus. 
; Syntax:
; :*:Kürzel::Auflösungstext
; :*: → * wird sofort aufgelöst, ohne Ende-Zeichen, wie Return, Tab, Space, [ usw.
; :?: → ? wird auch aufgelöst, wenn Ausdruck _in_ einem Wort vorkommt

; Zeichen-Hotstrings

; Anführungszeichen
; doppelt
:*?:ada#::{U+201E} ; „ Anführungszeichen Deutsch, Anfang (99)
:*?:ade#::{U+201C} ; “ Anführungszeichen Deutsch, Ende (66)
:*?:aea#::{U+201C} ; “ Anführungszeichen Englisch, Anfang (66)  = Deutsch Ende
:*?:aee#::{U+201D} ; ”  Anführungszeichen Englisch, Ende (99)
; einfach
:*?:eda#::{U+201A} ; ‚ Anführungszeichen Deutsch, Anfang (9)
:*?:ede#::{U+2018} ; ‘ Anführungszeichen Deutsch, Ende (6)
:*?:eea#::{U+2018} ; ‘ Anführungszeichen Englisch, Anfang (6) = Deutsch Ende
:*?:eee#::{U+2019} ; ’ Anführungszeichen Englisch, Ende (9)

; doppelt - mit Kürzelalternative
:*?:"da#::{U+201E} ; „ Anführungszeichen Deutsch, Anfang (99)
:*?:"de#::{U+201C} ; “ Anführungszeichen Deutsch, Ende (66)
:*?:"ea#::{U+201C} ; “ Anführungszeichen Englisch, Anfang (66)  = Deutsch Ende
:*?:"ee#::{U+201D} ; ”  Anführungszeichen Englisch, Ende (99)
; einfach - mit Kürzelalternative
:*?:'da#::{U+201A} ; ‚ Anführungszeichen Deutsch, Anfang (9)
:*?:'de#::{U+2018} ; ‘ Anführungszeichen Deutsch, Ende (6)
:*?:'ea#::{U+2018} ; ‘ Anführungszeichen Englisch, Anfang (6) = Deutsch Ende
:*?:'ee#::{U+2019} ; ’ Anführungszeichen Englisch, Ende (9) 

; Guillemets - Anführungszeichen
:*?:>>#::» ; » Anführungszeichen 
:*?:<<#::« ; «  Anführungszeichen 
; Guillemets einfach
:*?:>#::› ; › Anführungszeichen 
:*?:<#::‹ ; ‹ Anführungszeichen 

; Apostroph
:*?:apo#::{U+2BC} ; ’ Apostroph  apo# ist ’ne Abkürzung, die sich jeder merken kann ;-)

; Bindestriche und Leerzeichen
:*?:n-#::– ; Gedankenstrich – Halbgeviertstrich, en dash
:*?:2-#::– ; Gedankenstrich – Halbgeviertstrich, en dash
:*?:nb-#::{U+2011} ; non-breaking hyphen, nicht trennbarer Bindestrich
:*?:nt-#::{U+2011} ; non-breaking hyphen, nicht trennbarer Bindestrich
:*?:g-#::{U+2011} ; non-breaking hyphen, nicht trennbarer Bindestrich, geschützer Bindestrich
:*?:m-#::— ; langer Gedankenstrich, Geviertstrich, em dash (nur im englischen und spanischen)
:*?:3-#::— ; langer Gedankenstrich, Geviertstrich, em dash (nur im englischen und spanischen)
:*?:s-#::{U+AD} ; soft hyphen, unsichtbare vorgeschlagene Trennstelle, weiches Trennzeichen
:*?:gl#::{U+A0} ; geschütztes Leerzeichen - non-breaking space
:*?:nbs#::{U+A0} ; geschütztes Leerzeichen - non-breaking space
:*?:nbn#::{U+202F} ; geschütztes schmales Leerzeichen - narrow non-breaking space (Non-Breaking-Narrow)
:*?:gsl#::{U+202F} ; geschütztes schmales Leerzeichen - narrow non-breaking space (Geschützes Schmales Leerzeichen)

; hochgestellte Zahlen und Zeichen
:*?:^0#::{U+2070} ; hochgestellt 0
:*?:^1#::{U+00B9} ; hochgestellt 1
:*?:^2#::{U+00B2} ; hochgestellt 2
:*?:^3#::{U+00B3} ; hochgestellt 3
:*?:^4#::{U+2074} ; hochgestellt 4
:*?:^5#::{U+2075} ; hochgestellt 5
:*?:^6#::{U+2076} ; hochgestellt 6
:*?:^7#::{U+2077} ; hochgestellt 7
:*?:^8#::{U+2078} ; hochgestellt 8
:*?:^9#::{U+2079} ; hochgestellt 9
:*?:^+#::{U+207A} ; hochgestellt +


; Trema auf i und e (für Niederländisch)
:*?:i#::ï
:*?:e#::ë
:*?:y#::ÿ


; Unicode-Zeichen können auf folgende Weise realisiert werden:
; Herzchen, Smileys usw. gibt es auch als Unicode, brauch' ich nie und hab' ich mir gespart... einfach entsprechend erweitern wer Zeichen vermisst und mit für ihm sinnigen Kürzel belegen! :-)

; Brüche
:*?:12#::{U+00BD} ; ½
:*?:13#::{U+2153} ; ⅓
:*?:23#::{U+2154} ; ⅔
:*?:14#::{U+00BC} ; ¼
:*?:34#::{U+00BE} ; ¾
:*?:15#::{U+2155} ; ⅕
:*?:25#::{U+2156} ; ⅖
:*?:35#::{U+2157} ; ⅗
:*?:45#::{U+2158} ; ⅘
:*?:18#::{U+215B} ; ⅛
:*?:38#::{U+215C} ; ⅜ 
:*?:58#::{U+215D} ; ⅝
:*?:78#::{U+215E} ; ⅞

; Pfeile und Gleichheiten
:*?:->::{U+2192} ; Pfeil
:*?:ar#::{U+2192} ; Pfeil (Arrow right)
:*?:al#::{U+2190} ; Pfeil links (Arrow left)
:*?:<-::{U+2190} ; Pfeil links
:*?:=>::{U+21D2} ; Doppelpfeil
:*?:dr#::{U+21D2} ; Doppelpfeil (double [arrow] right)
:*?:<=::{U+21D0} ; Doppelpfeil links
:*?:dl#::{U+21D0} ; Doppelpfeil (double [arrow] right)
:*?:_>::{U+21E8 } ; Weißer Pfeil
:*?:wa#::{U+21E8 } ; Weißer Pfeil (white arrow)
:*?:lra::{U+2194} ; left right arrow
:*?:lral::{U+27F7} ; left right arrow long
:*?:lrda::{U+21DF} ; left right double arrow
:*?:>=::{U+2265} ; greater or equal
:*?:<=::{U+2264} ; smaller or equal
:*?:!=#::{U+2260} ; unequal

; ============================= Allchars-Zeichen ========================
; alle möglichen Mathe- und typografischen Zeichen. Nach Lust und Laune erweitern oder ändern... :-)

; Lines and Dots
:*?:s-#::­
:*?:^_#::¯
:*?:-,#::¬ 
:*?:*.#::• ; bullet dick
:*?:..#::· ; bullet mini


;Math
:*?:xx#::×
:*?:div#::÷
:*?::-#::÷
:*?:-:#::÷
:*?:%%#::‰ ; Promille
:*?:%0#::‰ ; Promille
:*?:prom#::‰ ; Promille
:*?:+-#::±
:*?:pm#::±
:*?:-+#::± ; minus / plus sign
:*?:mp#::∓ ; minus / plus sign
:*?:,u#::∓
:*?:dg#::° ; degree 
:*?:deg#::° ; degree
:*?:grad#::° ; Grad
:*?:mu#::µ
:*?:neg#::{U+D27} ; - negative Zahl, z.B. ˗3
:*?:min#::{U+2212} ; −  minus, z.B. 2 − 3 = ˗1
:*?:prime#::{U+2032} ; ′ prime, z.B. der Farbwert u′v′ beträgt …

; Punctation Marks
:*?:3.#::…  ; (3 Punkte als ein Zeichen, nicht trennbar!)
:*?:sp#::   ; (geschütztes?) Leerzeichen

; ============================= Allchars-End ===============================

; ========= Klammern auf der Grundreihe ==============
; Folgende Zeilen auskommentieren, wenn man die Klammern und Backslash als Drei-Buchstabenkürzel auf der Grundreihe tippen will. Sehr praktisch zum programmieren oder für LaTeX. Normalerweise kommen die Buchstabenkombis nicht in Wörtern vor. Falls doch, kann man z. B. f [leer] uu tippen und dann das Leer per Hand löschen... Wer im FKK-Verein ist, braucht natürlich dann doch auch ein anderes Kürzel ,-)
; :*?:fuu::[
; :*?:fii::]
; :*?:fll::\
; :*?:fjj::{{}
; :*?:fkk::{}}



; ============ F-Tasten =============
; Man kann sich sogar nicht nur Zeichen, sondern auch z. B. die F-Tasten über eine Buchstabenfolge zaubern, für Tastaturen ohne F-Reihe, wer es braucht ... bitte auskommentieren
; F-Tasten-Hotstrings
/* ; uncomment block - begin
:*?:f1#::{F1}
:*?:f2#::{F2}
:*?:f3#::{F3}
:*?:f4#::{F4}
:*?:f5#::{F5}
:*?:f6#::{F6}
:*?:f7#::{F7}
:*?:f8#::{F8}
:*?:f9#::{F9}
:*?:f10#::{F10}
:*?:f11#::{F11}
:*?:f12#::{F12}
*/ ; uncomment block - end

; ============================ Hotstrings (lang) =====================

; Text-Hotstrings
:*:sigd#::
(
Mit freundlichem Gruß
Michael Mustermann
)
return

:*:sige#::
(
Best regards
John Doe
)
return

; Gaaaanz langer Hotstring - Beispiel
:*:langbeispiel#::
(
Sehr geehrte  

das ist ein langer Beispieltext mit Returns. Donec lobortis risus sed justo tempor, eget ultricies massa pulvinar. Phasellus ultricies eleifend purus id condimentum. Morbi vitae tempor eros. Nullam vitae eleifend nisi. Vestibulum lacinia luctus diam, id mollis ipsum ultrices at. Vivamus ut mauris vel nisl convallis lacinia quis sit amet nibh. Duis consequat sit amet nisl non bibendum. Fusce semper sed odio nec efficitur. Maecenas a quam quis tellus fringilla viverra. Aenean elementum lectus nec lectus venenatis, vel facilisis libero ullamcorper. Duis eros leo, iaculis sed pharetra sit amet, vehicula at justo. Nam placerat vel sem sit amet fermentum. Pellentesque tincidunt tristique velit, vitae ultrices dui vulputate et. Nulla leo diam, sagittis a sem non, suscipit egestas mi.

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris pulvinar ipsum ex, at posuere eros commodo sit amet. Nunc nec suscipit mauris, a pellentesque velit. Cras scelerisque fringilla purus. Donec commodo consectetur mi non tempus. Nunc placerat ligula et ligula sagittis feugiat. Sed nec quam ipsum. Maecenas faucibus imperdiet dui at pellentesque. Vivamus sed risus at lectus ultricies fermentum quis eget turpis. Praesent a euismod turpis. Donec sed purus semper, iaculis nibh in, porta tortor. Pellentesque a elementum velit, a luctus tortor. Donec bibendum lectus nec pharetra tincidunt. Aenean at mollis neque, ut ultrices arcu.
)
return






; vim: set nowrap tw=0 syn=ahk:
