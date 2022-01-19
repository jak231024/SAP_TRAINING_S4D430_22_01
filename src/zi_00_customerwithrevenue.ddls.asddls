@AbapCatalog.sqlViewName: 'ZI00CUSTREV'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Composite View: Customer with Revenue'
define view ZI_00_CustomerWithRevenue
  as select from ZI_00_BookingWithCustomer
{
  key CustomerID                       as ID,
      Name,
      Street,
      Postcode,
      City,
      Country,
      @EndUserText.label: 'Total Amount'
      @EndUserText.quickInfo: 'Total Amount'
      sum(Amount)                      as TotalAmount,
      CurrencyCode,
      @EndUserText.label: 'Average Days Ahead'
      @EndUserText.quickInfo: 'Average Days Ahead'
      avg(DaysAhead as abap.dec(16,2)) as AverageDaysAhead
}
group by
  CustomerID,
  Name,
  Street,
  Postcode,
  City,
  Country,
  CurrencyCode
having sum(Amount) > 30000
