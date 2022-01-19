@AbapCatalog.sqlViewName: 'ZI00DEMO08'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Demo 08: Outer Joins'
define view ZI_00_Demo08
  as select from    spfli
  //    inner join   scarr on spfli.carrid = scarr.carrid
    left outer join scarr on spfli.carrid = scarr.carrid
  //    right outer join scarr on spfli.carrid = scarr.carrid
{
  key spfli.carrid   as Carrid,
  key spfli.connid   as Connid,
      scarr.carrname as Carrname,
      spfli.cityfrom as Cityfrom,
      spfli.cityto   as Cityto
}
union select from  spfli
  right outer join scarr on spfli.carrid = scarr.carrid
{
  key spfli.carrid   as Carrid,
  key spfli.connid   as Connid,
      scarr.carrname as Carrname,
      spfli.cityfrom as Cityfrom,
      spfli.cityto   as Cityto
}
