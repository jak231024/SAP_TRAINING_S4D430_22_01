@AbapCatalog.sqlViewName: 'ZI00DEMO15'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Demo 15: Authorization Checks'
define view ZI_00_Demo15
  as select from ZI_00_Demo01
{
  key CarrierId,
      CarrierName,
      CurrencyCode,
      URL
}
