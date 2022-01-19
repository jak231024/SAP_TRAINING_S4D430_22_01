*&---------------------------------------------------------------------*
*& Report z00_abap_demo_01
*&---------------------------------------------------------------------*
*& Demo 01: Grundlegende Sprachelemente
*&---------------------------------------------------------------------*
REPORT z00_abap_demo_01.

**********************************************************************
* Datentypen und Datenobjekte
**********************************************************************
DATA carrier TYPE c LENGTH 3.
DATA carrier2 TYPE s_carr_id.
DATA number TYPE i.
DATA today TYPE d. "YYYYMMDD
DATA packaged_number TYPE p LENGTH 16 DECIMALS 2. "16*2 - 1 = 31 Ziffern

carrier = 'LH'.
number = 42.
today = '20220119'.
packaged_number = '3.14'.

PARAMETERS p_carrid TYPE s_carr_id.

* Ausgabe
WRITE: 'Carrier:', carrier.
WRITE: / p_carrid.

**********************************************************************
* Mathematische Operatoren und Numerische Funktionen
**********************************************************************
DATA result TYPE i.
DATA result_p TYPE p LENGTH 16 DECIMALS 4.

result = 5 + 3.
WRITE: / result.

result = 5 - 3.
WRITE: / result.

result = 5 * 3.
WRITE: / result.

result_p = 5 / 3.
WRITE: / result_p.

result = 5 DIV 3.
WRITE: / result.

result = 5 MOD 3.
WRITE: / result.

result = result + 1.
ADD '4.4' TO result_p.
WRITE: / result_p.

WRITE: sqrt( 64 ).

**********************************************************************
* Zeichenkettenfunktionen
**********************************************************************
DATA text1 TYPE string.
DATA text2 TYPE string.
DATA text3 TYPE string.

text1 = 'Hallo'.
text2 = 'Welt'.
text3 = text1 && | | && text2.
WRITE: / text3.
WRITE: / |{ text1 } { text2 } { sy-datlo DATE = ISO }|.

**********************************************************************
* Kontrollstrukturen
**********************************************************************
DATA flight_date TYPE s_date.

flight_date = sy-datlo. "sy-datum

IF NOT ( flight_date >= '20220101' AND flight_date <= '20221231' ) OR carrier <> 'LH'.
ELSE.
ENDIF.

CASE carrier.
  WHEN 'LH' OR 'Lh' OR 'Lh' OR 'lh'.
    WRITE: / 'Lufthansa'.
  WHEN OTHERS.
    WRITE: / 'others'.
ENDCASE.

number = 0.

IF number IS INITIAL. "IF number = 0.
ENDIF.

* int i = 0;
* while(i < 10) {
*   sysout(i);
*   i++;
* }
DO 10 TIMES.
  WRITE sy-index.
ENDDO.

WHILE sy-index < 10.
  WRITE sy-index.
ENDWHILE.
