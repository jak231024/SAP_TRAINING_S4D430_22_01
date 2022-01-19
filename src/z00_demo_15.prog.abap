*&---------------------------------------------------------------------*
*& Report z00_demo_15
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z00_demo_15.

DATA carriers TYPE TABLE OF scarr.

SELECT FROM scarr
 FIELDS *
 INTO TABLE @carriers.
IF sy-subrc <> 0.
  WRITE 'Error: no data'.
ENDIF.

LOOP AT carriers INTO DATA(carrier).

  AUTHORITY-CHECK OBJECT 'S_CARRID'
      ID 'CARRID' FIELD carrier-carrid
      ID 'ACTVT' FIELD '03'.
  IF sy-subrc <> 0.
    DELETE carriers INDEX sy-tabix.
  ENDIF.

ENDLOOP.

cl_demo_output=>display( carriers ).
