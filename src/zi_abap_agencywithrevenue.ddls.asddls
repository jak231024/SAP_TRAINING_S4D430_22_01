@AbapCatalog.sqlViewName: 'ZIABAPAGREV'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Composite View: Agency with Revenue'
define view ZI_ABAP_AgencyWithRevenue
  as select from ZI_ABAP_BookingWithAgency
{
  key ID,
      Name,
      Street,
      Postcode,
      City,
      Country,
      sum(Amount)                      as TotalAmount,
      CurrencyCode,
      avg(DaysAhead as abap.dec(16,2)) as AverageDaysAhead
}
group by
  ID,
  Name,
  Street,
  Postcode,
  City,
  Country,
  CurrencyCode
