@AbapCatalog.sqlViewName: 'ZI00DEMO09'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Demo 09: UNION and UNION ALL'
define view ZI_00_Demo09
  as select from scustom as Customer
{
  key id   as ID,
      name as Name,
      city as City
}
where
  city = 'Berlin'
union select from sbook   as Booking
  inner join          scustom as Customer on Customer.id = Booking.customid
{
  key id   as ID,
      name as Name,
      city as City
}
where
     agencynum = '00000087'
  or agencynum = '00000105'
