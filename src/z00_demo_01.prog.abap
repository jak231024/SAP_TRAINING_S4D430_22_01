*&---------------------------------------------------------------------*
*& Report z00_demo_01
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z00_demo_01.

PARAMETERS p_cukey TYPE s_currcode.

DATA carriers TYPE TABLE OF zi_00_demo01.

SELECT FROM zi_00_demo01
 FIELDS *
 WHERE currencycode = @p_cukey
 ORDER BY PRIMARY KEY
 INTO TABLE @carriers.
IF sy-subrc <> 0.
  WRITE: 'Error: no data'.
ENDIF.

cl_demo_output=>display( carriers ).
