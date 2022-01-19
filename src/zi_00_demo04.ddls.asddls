@AbapCatalog.sqlViewName: 'ZI00DEMO04'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Demo 04: Literals and Cases'
define view ZI_00_Demo04
  as select from sbook
{
  bookid       as BookingID,
  'Hallo Welt' as String1,
  42           as Integer1,
  0.1          as FloatingPointNumber1,
  cancelled    as CancelledCode,
  case cancelled
    when 'X' then 'Cancelled'
    when '' then 'Booked'
    else ''
  end          as CancelledText,
  class        as FlightClass,
  luggweight   as LuggageWeight,
  wunit        as LuggageWeightUnit,
  case when class = 'F' then ''
       when wunit = 'KG' and luggweight > 25 then 'X'
       when wunit = 'LB' and luggweight > 44 then 'X'
       else ''
  end          as ExcessLuggage
}
