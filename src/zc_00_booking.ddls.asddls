@AbapCatalog.sqlViewName: 'ZC00BOOK'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Consumption View: Booking'
define view ZC_00_Booking
  with parameters
    @Environment.systemField: #SYSTEM_DATE
    Deadline : abap.dats
  as select from ZI_00_Booking
{
  key CarrierID,
  key ConnectionID,
  key FlightDate,
  key BookingID,
      CustomerID,
      LuggageWeight,
      LuggageWeightUnit,
      FlightClass,
      Amount,
      CurrencyCode,
      OrderDate,
      AgencyNumber,
      CounterID,
      DaysAhead
}
where
  FlightDate < $parameters.Deadline
