*&---------------------------------------------------------------------*
*& Report z01_abapcds_01
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z01_abapcds_01.
PARAMETERS p_cntry TYPE s_country.
DATA customers TYPE TABLE OF s4d430_customer_with_revenue.

SELECT FROM s4d430_customer_with_revenue
 FIELDS *
 WHERE country = @p_cntry
 ORDER BY PRIMARY KEY
 INTO TABLE @customers
UP TO 250 ROWS.
IF sy-subrc <> 0.
  WRITE: 'Error: no data'.
ENDIF.

cl_demo_output=>display( customers ).
