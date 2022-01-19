@AbapCatalog.sqlViewName: 'ZI00DEMO02'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Demo 02: Selections and Inner Joins'
define view ZI_00_Demo02
  as select from spfli   as Connection
    inner join   scarr   as Carrier on Connection.carrid = Carrier.carrid
    inner join   sflight as Flight  on  Connection.carrid = Flight.carrid
                                    and Connection.connid = Flight.connid
{
  key Flight.carrid       as Carrid,
  key Flight.connid       as Connid,
  key Flight.fldate       as Fldate,
      Carrier.carrname    as Carrname,
      Connection.cityfrom as Cityfrom,
      Connection.cityto   as Cityto
}
where
  fltype <> 'X' // Charterflüge ausblenden
