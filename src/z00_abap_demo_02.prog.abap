*&---------------------------------------------------------------------*
*& Report z00_abap_demo_02
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z00_abap_demo_02.

**********************************************************************
* Deklarationen
**********************************************************************
PARAMETERS p_carrid TYPE s_carr_id.
PARAMETERS p_connid TYPE s_conn_id.

DATA flights TYPE TABLE OF zi_00_flight.
DATA flight TYPE REF TO zi_00_flight.
DATA flight2 TYPE zi_00_flight.


**********************************************************************
* Eingabeprüfungen
**********************************************************************
AT SELECTION-SCREEN.

  SELECT FROM zi_00_flight
   FIELDS *
   WHERE carrid = @p_carrid AND connid = @p_connid
   INTO TABLE @flights.
  IF sy-subrc <> 0.
    MESSAGE e000(z00) WITH p_carrid p_connid.
  ENDIF.


**********************************************************************
* Hauptverarbeitung
**********************************************************************
START-OF-SELECTION.

  LOOP AT flights REFERENCE INTO flight WHERE carrid = 'LH'.
    flight->price = flight->price * '1.1'.
  ENDLOOP.

  SORT flights BY fldate ASCENDING price DESCENDING.

  IF line_exists( flights[ fldate = '20210108' ] ).
    flight2 = flights[ fldate = '20210108' ].
    WRITE: flight2-carrid, flight2-connid.
  ENDIF.

  DELETE flights WHERE price < 250 AND currency = 'EUR'.

  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      i_structure_name = 'ZI00FLIGHT'
    TABLES
      t_outtab         = flights.
