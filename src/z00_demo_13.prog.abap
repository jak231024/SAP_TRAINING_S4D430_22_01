*&---------------------------------------------------------------------*
*& Report z00_demo_13
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z00_demo_13.

SELECT FROM zi_00_demo12
 FIELDS carrid, connid, cityfrom, cityto, \_carrier-carrname
 INTO TABLE @DATA(connections).
IF sy-subrc <> 0.
  WRITE 'Error: no data'.
ENDIF.

cl_demo_output=>display( connections ).
