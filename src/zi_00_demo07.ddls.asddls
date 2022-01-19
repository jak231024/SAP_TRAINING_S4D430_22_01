@AbapCatalog.sqlViewName: 'ZI00DEMO07'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Demo 07: Aggregations'
define view ZI_00_Demo07
  as select from sflight
{
  key carrid                                               as CarrierID,
  key connid                                               as ConnectionID,
      count(*)                                             as NumberOfFlights,
      count(distinct planetype)                            as NumberOfDifferentPlanetypes,
      sum(seatsocc)                                        as TotalNumberOfOccupiedSeats,
      sum(seatsmax)                                        as TotalNumberOfMaximumSeats,
      sum(paymentsum)                                      as TotalPaymentsum,
      avg(price as abap.dec(16,2))                         as AverageFlightPrice,
      min(seatsocc)                                        as MinimumNumberOfOccupiedSeats,
      max(seatsocc)                                        as MaximumNumberOfOccupiedSeats,
      sum(case when seatsocc = seatsmax then 1 else 0 end) as NumberOfBookedUpFlights,
      sum(case when seatsocc = 0 then 1 else 0 end)        as NumberOfEmptyFlights
}
group by
  carrid,
  connid
having sum(paymentsum) > 5000000
