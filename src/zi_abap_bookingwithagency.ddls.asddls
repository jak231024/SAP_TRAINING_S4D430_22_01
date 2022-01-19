@AbapCatalog.sqlViewName: 'ZIABAPBOOKAG'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Compositve View: Booking with Agency'
define view ZI_ABAP_BookingWithAgency
  as select from ZI_00_Booking  as Booking
    inner join   ZI_ABAP_Agency as Agency on Booking.AgencyNumber = Agency.ID
{
  key CarrierID,
  key ConnectionID,
  key FlightDate,
  key BookingID,
      currency_conversion(
        amount => Amount,
        source_currency => CurrencyCode,
        target_currency => cast('USD' as abap.cuky),
        exchange_rate_date => OrderDate ) as Amount,
      cast('USD' as abap.cuky)            as CurrencyCode,
      DaysAhead,
      ID,
      Name,
      Street,
      Postcode,
      City,
      Country
}
