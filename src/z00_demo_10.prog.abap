*&---------------------------------------------------------------------*
*& Report z00_abapcds_10
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z00_demo_10.

PARAMETERS p_carrid TYPE s_carr_id.
PARAMETERS p_connid TYPE s_conn_id.

DATA flights TYPE TABLE OF zi_00_demo10.

SELECT FROM zi_00_demo10( carrierid = @p_carrid, connectionid = @p_connid )
 FIELDS *
 INTO TABLE @flights.
IF sy-subrc <> 0.
  WRITE: 'Error: no data'.
ENDIF.

cl_demo_output=>display( flights ).
