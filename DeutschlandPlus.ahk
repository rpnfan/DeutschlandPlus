; DeutschlandPlus Version 2
; 2022-12-12
; contact: rpnfan@gmail.com

; Der Strichpunkt ist das Kommentarzeichen - Entfernen, wenn eine Zeile wieder aktiv sein soll!
; Legende:
; + ergänzt
; - gelöscht
; ! Bugfix
; ~ geändert

; 2022-12-11    1.01    + Hilfe-Funktion mit F1 → Übersicht mit allen Kürzeln wird im Browser geöffnet.
;                       + zusätzliche hoch- und tiefgestellte Zeichen (minus, Buchstaben…)
;                       + weitere Zeichen (Währungen, Daumen-hoch usw.)
;                       ! arrows, minus/plus und µ korrigiert
;               2       + Griechische Buchstaben
;                       ~ Kürzel für Trema-Buchstaben nun mit ö als Abschluss statt #
;                       ! negative Zahl, z. B.  ˗3


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

; Funktion um URLs öffnen zu können
OpenURL(u) {
	WinActivate, Program Manager
	Run %u%
	return
}

; =====================================================
; ===================== HOTKEYS =======================
; =====================================================
; Alle AltGr-Zeichen über CapsLock verfügbar machen, sowie alle AltGr-Zeichen der linken Hand auf der rechten Hand verfügbar und nicht zuletzt den Steuerblock (Pfeile usw.) auch auf der rechten Hand in Grundstellung nutzbar.

sc03a & F1::OpenURL("DeutschlandPlus-Hilfe.html")	; F1-Kombi für Hilfe - Übersicht mit allen Kürzeln


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
sc03a & RShift:: OpenURL("https://www.amp-what.com") ; "Any-Key"



; =================================================================
; ========================== Hotstrings ===========================
; =================================================================
; Hotstrings geben ein oder mehrere Zeichen aus. 
; Syntax:
; :*:Kürzel::Auflösungstext
; :*: → * wird sofort aufgelöst, ohne Ende-Zeichen, wie Return, Tab, Space, [ usw.
; :?: → ? wird auch aufgelöst, wenn Ausdruck _in_ einem Wort vorkommt

#Hotstring c ; globale Option, bis ggf. wieder geändert c → case sensitive, Option r → raw output

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

:*?:eada#::{U+201A} ; ‚ Anführungszeichen Deutsch, Anfang (9)

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
:*?:^-#::{U+207B} ; hochgestellt minus
:*?:^=#::{U+207C} ; hochgestellt =
:*?:^(#::{U+207D} ; hochgestellt Klammer links
:*?:^)#::{U+207E} ; hochgestellt Klammer rechts

; hochgestellte Buchstaben
:*?:^a#::{U+1D43} ; hochgestellt a
:*?:^b#::{U+1D47} ; hochgestellt b
:*?:^c#::{U+1D9C} ; hochgestellt c
:*?:^d#::{U+1D48} ; hochgestellt d
:*?:^e#::{U+1D49} ; hochgestellt e
:*?:^f#::{U+1DA0} ; hochgestellt f
:*?:^g#::{U+1D4D} ; hochgestellt g
:*?:^h#::{U+02B0} ; hochgestellt h
:*?:^i#::{U+2071} ; hochgestellt i
:*?:^j#::{U+02B2} ; hochgestellt j
:*?:^k#::{U+1D4F} ; hochgestellt k
:*?:^l#::{U+02E1} ; hochgestellt l
:*?:^m#::{U+1D50} ; hochgestellt m
:*?:^n#::{U+207F} ; hochgestellt n
:*?:^o#::{U+1D52} ; hochgestellt o
:*?:^p#::{U+1D56} ; hochgestellt p
:*?:^q#::{U+107A5} ; hochgestellt q
:*?:^r#::{U+02B3} ; hochgestellt r
:*?:^s#::{U+02E2} ; hochgestellt s
:*?:^t#::{U+1D57} ; hochgestellt t
:*?:^u#::{U+1D58} ; hochgestellt u
:*?:^v#::{U+1D5B} ; hochgestellt v
:*?:^w#::{U+02B7} ; hochgestellt w
:*?:^x#::{U+02E3} ; hochgestellt x
:*?:^y#::{U+02B8} ; hochgestellt y
:*?:^z#::{U+1DBB} ; hochgestellt z

; Großbuchstaben werden -- warum auch immer -- als Kleinbuchstaben ausgegeben!?
:*?:^A#::{U+1D2C} ; hochgestellt A
:*?:^B#::{U+1D2D} ; hochgestellt B
:*?:^C#::{U+A7FD} ; hochgestellt C
:*?:^D#::{U+1D30} ; hochgestellt D
:*?:^E#::{U+1D31} ; hochgestellt E
:*?:^F#::{U+A7F3} ; hochgestellt F
:*?:^G#::{U+1D33} ; hochgestellt G
:*?:^H#::{U+1D34} ; hochgestellt H
:*?:^I#::{U+1D35} ; hochgestellt I
:*?:^J#::{U+1D36} ; hochgestellt J
:*?:^K#::{U+1D37} ; hochgestellt K
:*?:^L#::{U+1D38} ; hochgestellt L
:*?:^M#::{U+1D39} ; hochgestellt M
:*?:^N#::{U+1D3A} ; hochgestellt N
:*?:^O#::{U+1D3C} ; hochgestellt O
:*?:^P#::{U+1D3E} ; hochgestellt P
:*?:^Q#::{U+A74F} ; hochgestellt Q
:*?:^R#::{U+1D3F} ; hochgestellt R
; S fehlt
:*?:^T#::{U+1D40} ; hochgestellt T
:*?:^U#::{U+1D41} ; hochgestellt U
:*?:^V#::{U+2C7D} ; hochgestellt V
:*?:^W#::{U+1D42} ; hochgestellt W
; hochgestellt X fehlt
; hochgestellt Y fehlt
; hochgestellt Z fehlt

; tiefgestellte Zahlen und Buchstaben
:*?:_0#::{U+2080} ; tiefgestellt 0
:*?:_1#::{U+2081} ; tiefgestellt 1
:*?:_2#::{U+2082} ; tiefgestellt 2
:*?:_3#::{U+2083} ; tiefgestellt 3
:*?:_4#::{U+2084} ; tiefgestellt 4
:*?:_5#::{U+2085} ; tiefgestellt 5
:*?:_6#::{U+2086} ; tiefgestellt 6
:*?:_7#::{U+2087} ; tiefgestellt 7
:*?:_8#::{U+2088} ; tiefgestellt 8
:*?:_9#::{U+2089} ; tiefgestellt 9
:*?:_+#::{U+208A} ; tiefgestellt +
:*?:_-#::{U+208B} ; tiefgestellt -
:*?:_=#::{U+208C} ; tiefgestellt =
:*?:_(#::{U+208D} ; tiefgestellt (
:*?:_)#::{U+208E} ; tiefgestellt )
:*?:_+2#::{U+2A27} ; tiefgestellt +2

:*?:_a#::{U+2090} ; tiefgestellt a
:*?:_e#::{U+2091} ; tiefgestellt e
:*?:_i#::{U+1D62} ; tiefgestellt i
:*?:_h#::{U+2095} ; tiefgestellt h
:*?:_j#::{U+2C7C} ; tiefgestellt j
:*?:_k#::{U+2096} ; tiefgestellt k
:*?:_l#::{U+2097} ; tiefgestellt l
:*?:_m#::{U+2098} ; tiefgestellt m
:*?:_n#::{U+2099} ; tiefgestellt n
:*?:_o#::{U+2092} ; tiefgestellt o
:*?:_p#::{U+209a} ; tiefgestellt p
:*?:_r#::{U+1D63} ; tiefgestellt r
:*?:_s#::{U+209B} ; tiefgestellt s
:*?:_t#::{U+209C} ; tiefgestellt t
:*?:_u#::{U+1D64} ; tiefgestellt u
:*?:_v#::{U+1D65} ; tiefgestellt v
:*?:_x#::{U+2093} ; tiefgestellt x
:*?:_beta#::{U+1D66} ; tiefgestellt beta
:*?:_gamma#::{U+1D67} ; tiefgestellt gamma
:*?:_rho#::{U+1D68} ; tiefgestellt rho
:*?:_phi#::{U+1D69} ; tiefgestellt phi
:*?:_chi#::{U+1D6A} ; tiefgestellt chi


; Trema auf i und e (für Niederländisch)
:*?:iö::ï
:*?:eö::ë 
:*?:Iö::Ï
:*?:Eö::Ë
:*?:yö::ÿ

; ß als alternative Eingabemöglichkeit
; :*?:s#::ß

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

; Pfeile
:*?:->::{U+2192} ; Pfeil
:*?:ar#::{U+2192} ; Pfeil (Arrow right)
:*?:al#::{U+2190} ; Pfeil links (Arrow left)
:*?:<-::{U+2190} ; Pfeil links
:*?:=>::{U+21D2} ; Doppelpfeil
:*?:dr#::{U+21D2} ; Doppelpfeil (double [arrow] right)
:*?:dl#::{U+21D0} ; Doppelpfeil (double [arrow] left)
:*?:_>::{U+21E8 } ; Weißer Pfeil
:*?:wa#::{U+21E8 } ; Weißer Pfeil (white arrow)
:*?:lra#::{U+2194} ; left right arrow
:*?:lrda#::{U+21D4} ; left right double arrow
:*?:lraa#::{U+27F7} ; left right arrow long
:*?:lrdaa#::{U+27FA} ; left right double arrow long

;Math
:*?:>=#::{U+2265} ; greater or equal
:*?:<=#::{U+2264} ; smaller or equal
:*?:!=#::{U+2260} ; unequal
:*?:almost=#::{U+2248} ; approximately , almost equal
:*?:def#::{U+225D} ; equal to definition
:*?:almost=ra#::{U+2975} ; almost equal right arrow
:*?:not#::¬ ; not
:*?:xx#::×
:*?:div#::÷
:*?::-#::÷
:*?:-:#::÷
:*?:%%#::‰ ; Promille
:*?:%0#::‰ ; Promille
:*?:prom#::‰ ; Promille
:*?:+-#::±
:*?:pm#::±
:*?:-+#::∓ ; minus / plus sign
:*?:mp#::∓ ; minus / plus sign
:*?:,u#::µ
:*?:dg#::° ; degree 
:*?:deg#::° ; degree
:*?:grad#::° ; Grad
:*?:mu#::µ
:*?:neg#::{U+2D7} ; - negative Zahl, z.B. ˗3
:*?:min#::{U+2212} ; −  minus, z.B. 2 − 3 = ˗1
:*?:prime#::{U+2032} ; ′ prime, z.B. der Farbwert u′v′ beträgt …


; Währungen
:*?:pound#::{U+00A3} ; £ Pound (english)
:*?:yen#::{U+00A5} ;¥ Yen
:*?:curr#::{U+00A4} ;¤ Currency Allgemeines Währungssymbol
:*?:cent#::{U+00A2} ;¢ Centzeichen

; Lines and Dots
:*?:^_#::¯
:*?:-,#::¬ 
:*?:*.#::• ; bullet dick
:*?:..#::· ; bullet mini
:*?:3.#::…  ; (3 Punkte als ein Zeichen, nicht trennbar!)

; Verschiedenes
:*?:!#::{U+00A1} ; ¡ Umgekehrtes Ausrufezeichen
:*?:--#::{U+00A6} ; ¦ unterbrochener Strich
:*?:pg#::{U+00A7} ; § Paragraph
:*?:trema#::{U+00A8} ; ¨ Trema
:*?:reg#::{U+00AE} ; ® Registered Trademark
:*?:absatz#::{U+00B6} ; ¶ Absatzzeichen
:*?:klopapier#::{U+1F9FB} ; Toilettenpapier
:*?:co#::{U+A9} ; Copyright 

;Emoticons
:*?:dh#::{U+1F44D} ; Daumen hoch
:*?:tu#::{U+1F44D} ; thumbs up
:*?:hand#::{U+1F44B} ; hand waving
:*?::)#::{U+1F603} ; einfacher Smiley
:*?::-D#::{U+1F600} ; Grin
:*?::-D#::{U+1F603} ; Smiley
:*?::-(#::{U+2639} ; traurig, frowning face
:*?::-o#::{U+1F62E} ; offener Mund open mouth
:*?:rotfl#::{U+1F923} ; rolling on the floor laughing
:*?:;-)#::{U+1F609} ; Zwinkern (winking face)
:*?:corona#::{U+1F637} ; mit Maske
:*?:glasses#::{U+1F60E} ; mit Sonnenbrille (glasses)
:*?:thinking#::{U+1F914} ; thinking, nachdenklich
:*?:kiss#::{U+1F618} ; kiss - Kuss werfen


; Griechische Buchstaben
:*?:alpha#::{U+03B1} ; alpha
:*?:beta#::{U+03B2} ; beta
:*?:gamma#::{U+03B3} ; gamma
:*?:delta#::{U+03B4} ; delta
:*?:epsilon#::{U+03B5} ; epsilon
:*?:zeta#::{U+03B6} ; zeta
; eta → siehe unten
:*?:theta#::{U+03B8} ; theta
:*?:iota#::{U+03B9} ; iota
:*?:kappa#::{U+03BA} ; kappa
:*?:lambda#::{U+03BB} ; lambda
:*?:mu#::{U+03BC} ; mu
:*?:nu#::{U+03BD} ; nu
:*?:xi#::{U+03BE} ; xi
:*?:omicron#::{U+03BF} ; omicron
:*?:pi#::{U+03C0} ; pi
:*?:rho#::{U+03C1} ; rho
:*?:sigma#::{U+03C3} ; sigma
:*?:tau#::{U+03C4} ; tau
:*?:upsilon#::{U+03C5} ; upsilon
:*?:phi#::{U+03C6} ; phi
:*?:chi#::{U+03C7} ; chi
:*?:psi#::{U+03C8} ; psi
:*?:omega#::{U+03C9} ; omega

:*?:Alpha#::{U+0391} ; alpha - upper case
:*?:Beta#::{U+0392} ; beta
:*?:Gamma#::{U+0393} ; gamma
:*?:Delta#::{U+0394} ; delta
:*?:Epsilon#::{U+0395} ; epsilon
:*?:Zeta#::{U+0396} ; zeta
:*?:Eta#::{U+0397} ; eta
:*?:Theta#::{U+0398} ; theta
:*?:Iota#::{U+0399} ; iota
:*?:Kappa#::{U+039A} ; kappa
:*?:Lambda#::{U+039B} ; lambda  Λλ
:*?:Mu#::{U+039C} ; mu
:*?:Nu#::{U+039D} ; nu
:*?:Xi#::{U+039E} ; xi
:*?:Omicron#::{U+039F} ; omicron
:*?:Pi#::{U+03A0} ; pi
:*?:Rho#::{U+03A1} ; rho
:*?:Sigma#::{U+03A3} ; sigma
:*?:Tau#::{U+03A4} ; tau
:*?:Upsilon#::{U+03A5} ; upsilon
:*?:Phi#::{U+03A6} ; phi
:*?:Chi#::{U+03A7} ; chi
:*?:Psi#::{U+03A8} ; psi
:*?:Omega#::{U+03A9} ; omega

; eta hat sich hierher "verlaufen", damit es nicht andere Kürzel auslöst. Die Reihenfolge der Definition von Hotstrings ist nicht egal, sondern Teilhotstrings müssen _nach_ einem längerne Hotstring kommen.
:*?:eta#::{U+03B7} ; eta



; Unicode-Zeichen können mit {+xxxx} folgende Weise realisiert werden, siehe die vielen Beispiele im Skript
; Herzchen, Smileys usw. gibt es auch als Unicode, brauch' ich nie und hab' ich mir gespart... einfach entsprechend erweitern wer Zeichen vermisst und mit für ihm sinnigen Kürzel belegen! :-)


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


:*:sige#::
(
Best regards
John Doe
)


; Gaaaanz langer Hotstring - Beispiel
:*:langbeispiel#::
(
Sehr geehrte  

das ist ein langer Beispieltext mit Returns. Donec lobortis risus sed justo tempor, eget ultricies massa pulvinar. Phasellus ultricies eleifend purus id condimentum. Morbi vitae tempor eros. Nullam vitae eleifend nisi. Vestibulum lacinia luctus diam, id mollis ipsum ultrices at. Vivamus ut mauris vel nisl convallis lacinia quis sit amet nibh. Duis consequat sit amet nisl non bibendum. Fusce semper sed odio nec efficitur. Maecenas a quam quis tellus fringilla viverra. Aenean elementum lectus nec lectus venenatis, vel facilisis libero ullamcorper. Duis eros leo, iaculis sed pharetra sit amet, vehicula at justo. Nam placerat vel sem sit amet fermentum. Pellentesque tincidunt tristique velit, vitae ultrices dui vulputate et. Nulla leo diam, sagittis a sem non, suscipit egestas mi.

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris pulvinar ipsum ex, at posuere eros commodo sit amet. Nunc nec suscipit mauris, a pellentesque velit. Cras scelerisque fringilla purus. Donec commodo consectetur mi non tempus. Nunc placerat ligula et ligula sagittis feugiat. Sed nec quam ipsum. Maecenas faucibus imperdiet dui at pellentesque. Vivamus sed risus at lectus ultricies fermentum quis eget turpis. Praesent a euismod turpis. Donec sed purus semper, iaculis nibh in, porta tortor. Pellentesque a elementum velit, a luctus tortor. Donec bibendum lectus nec pharetra tincidunt. Aenean at mollis neque, ut ultrices arcu.
)


; =========== TODO ============
; fix i# und e# usw. als Teil eines anderen Hotstrings möglich!  
; ———– check out ———-
; Teile von Hotstrings zulassen
/* ; uncomment block - begin
#InputLevel 1
:*?X:--::Send {U+2013}	; En Dash, hostring is <hyphen><hyphen>
#InputLevel 0			; here redundant - but only if no other hotkeys or (non-auto-replace) hotstrings follow
:*?:–-::{U+2014}		; Em Dash, hotstring is <en dash><hyphen>
*/ ; uncomment block - end


; vim: set nowrap tw=0 syn=ahk:
