@AbapCatalog.sqlViewName: 'ZI00BOOKCUST'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Composite View: Booking with Customer'
define view ZI_00_BookingWithCustomer
  as select from ZI_00_Booking  as Booking
    inner join   ZI_00_Customer as Customer on Booking.CustomerID = Customer.ID
{
  key CarrierID,
  key ConnectionID,
  key FlightDate,
  key BookingID,
      @Semantics.quantity.unitOfMeasure: 'LuggageWeightUnit'
      LuggageWeight,
      LuggageWeightUnit,
      FlightClass,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      Amount,
      CurrencyCode,
      OrderDate,
      AgencyNumber,
      CounterID,
      CustomerID,
      Name,
      Street,
      Postcode,
      City,
      Country,
      Discount,
      DaysAhead
}
