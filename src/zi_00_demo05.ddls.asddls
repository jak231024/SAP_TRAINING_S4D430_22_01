@AbapCatalog.sqlViewName: 'ZI00DEMO05'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Demo 05: Arithmetic Expressions and Type Casts'
define view ZI_00_Demo05
  as select from sflight
{
  seatsmax                                 as SeatsMaxEC,
  seatsmax_b                               as SeatsMaxBC,
  seatsmax_f                               as SeatsMaxFC,
  seatsmax + seatsmax_b + seatsmax_f       as SeatsMaxTotal,
  seatsocc                                 as SeatsOccupiedEC,
  seatsmax - seatsocc                      as SeatsFreeEC,
  price                                    as OldPrice,
  price * 2                                as DoublePrice,
  cast(price as abap.fltp) * 1.1           as NewPrice,
  ( cast(seatsocc as abap.fltp)
   / cast(seatsmax as abap.fltp) ) * 100.0 as OccupancyRate,
  //cast(1.1 as abap.dec(16,2))              as Decimal1
  @EndUserText.label: 'Airline Code'
  @EndUserText.quickInfo: 'Airline Code'
  'LH '                                    as Char1,
  cast('LH ' as s_carr_id)                 as CarrierId
}
