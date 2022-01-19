@AbapCatalog.sqlViewName: 'ZI00DEMO13'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Demo 13: Path Expressions'
define view ZI_00_Demo13
  as select from ZI_00_Demo12
{
  key Carrid,
  key Connid,
      Cityfrom,
      Cityto,
      _Carrier.carrname,
      _Flights
}
