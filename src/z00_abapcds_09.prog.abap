*&---------------------------------------------------------------------*
*& Report z00_abapcds_09
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z00_abapcds_09.

DATA bookings TYPE TABLE OF zc_00_booking.

SELECT FROM zc_00_booking
 FIELDS *
 ORDER BY flightdate DESCENDING
 INTO TABLE @bookings
 UP TO 250 ROWS.
IF sy-subrc <> 0.
  WRITE 'Error: no data'.
ENDIF.

cl_demo_output=>display( bookings ).
