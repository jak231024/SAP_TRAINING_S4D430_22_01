@AbapCatalog.sqlViewName: 'ZI00DEMO12'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Demo 12: Associations'
define view ZI_00_Demo12
  as select from spfli as Connection
  association [1] to scarr   as _Carrier on  Connection.carrid = _Carrier.carrid
  association [*] to sflight as _Flights on  Connection.carrid = _Flights.carrid
                                         and Connection.connid = _Flights.connid
{
  key Connection.carrid   as Carrid,
  key Connection.connid   as Connid,
      Connection.cityfrom as Cityfrom,
      Connection.cityto   as Cityto,
      _Carrier,
      _Flights
}
