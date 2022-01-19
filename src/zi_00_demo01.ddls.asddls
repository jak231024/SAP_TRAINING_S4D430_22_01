@AbapCatalog.sqlViewName: 'ZI00DEMO01' // Name der SQL-View, max. 16 Zeichen
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Demo 01: Projections'
define view ZI_00_Demo01 // Name der CDS-View, max. 30 Zeichen
  as select from scarr
{
  key carrid   as CarrierId,
      carrname as CarrierName,
      currcode as CurrencyCode,
      url      as URL
}
