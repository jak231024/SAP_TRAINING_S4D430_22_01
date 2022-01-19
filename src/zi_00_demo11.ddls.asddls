@AbapCatalog.sqlViewName: 'ZI00DEMO11'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Demo 11: Environment System Fields'
define view ZI_00_Demo11
  with parameters
    CarrierID    : s_carr_id,
    ConnectionID : s_conn_id,
    @Environment.systemField: #SYSTEM_DATE  
    Deadline     : abap.dats
  as select from ZI_00_Demo10( CarrierID: $parameters.CarrierID, ConnectionID: $parameters.ConnectionID)
{
  key Carrid,
  key Connid,
  key Fldate,
      Price,
      Currency,
      Planetype,
      Seatsmax,
      Seatsocc,
      Paymentsum,
      SeatsmaxB,
      SeatsoccB,
      SeatsmaxF,
      SeatsoccF
}
where
  Fldate > $parameters.Deadline
