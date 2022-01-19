@AbapCatalog.sqlViewName: 'ZI00CUSTBOOK'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Composite view: Customer with Bookings'
define view ZI_00_CustomerWithBookings
  as select from ZI_00_Customer as Customer
  association [*] to ZI_00_Booking as _Bookings on _Bookings.CustomerID = Customer.ID
{
  key Customer.ID,
      Customer.Name,
      Customer.Street,
      Customer.Postcode,
      Customer.City,
      Customer.Country,
      Customer.Discount,
      _Bookings
}
