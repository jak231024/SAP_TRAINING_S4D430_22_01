@AbapCatalog.sqlViewName: 'ZC00BOOKCUST'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Consumption View: Booking with Customer'
define view ZC_00_BookingWithCustomer
  as select from ZI_00_CustomerWithBookings
{
  key _Bookings.CarrierID,
  key _Bookings.ConnectionID,
  key _Bookings.FlightDate,
  key _Bookings.BookingID,
      _Bookings.LuggageWeight,
      _Bookings.LuggageWeightUnit,
      _Bookings.FlightClass,
      _Bookings.Amount,
      _Bookings.CurrencyCode,
      _Bookings.OrderDate,
      _Bookings.AgencyNumber,
      _Bookings.CounterID,
      _Bookings.DaysAhead,
      _Bookings.CustomerID,
      Name,
      Street,
      Postcode,
      City,
      Country,
      Discount
}
