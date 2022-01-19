@AbapCatalog.sqlViewName: 'ZI00BOOKING'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Basic View: Booking'
define view ZI_00_Booking
  as select from sbook
{
  key carrid                                as CarrierID,
  key connid                                as ConnectionID,
  key fldate                                as FlightDate,
  key bookid                                as BookingID,
      customid                              as CustomerID,
      luggweight                            as LuggageWeight,
      wunit                                 as LuggageWeightUnit,
      @EndUserText.label: 'Flight Class'
      @EndUserText.quickInfo: 'Flight Class'
      case class
        when 'C' then 'Business'
        when 'Y' then 'Economy'
        when 'F' then 'First'
        else ''
      end                                   as FlightClass,
      @EndUserText.label: 'Amount'
      @EndUserText.quickInfo: 'Amount'
      currency_conversion(
        amount => forcuram,
        source_currency => forcurkey,
        target_currency => cast('USD' as abap.cuky),
        exchange_rate_date => order_date )  as Amount,
      @EndUserText.label: 'Currency Code'
      @EndUserText.quickInfo: 'Currency Code'
      cast('USD' as abap.cuky)              as CurrencyCode,
      order_date                            as OrderDate,
      agencynum                             as AgencyNumber,
      counter                               as CounterID,
      @EndUserText.label: 'Days Ahead'
      @EndUserText.quickInfo: 'Days Ahead'
      dats_days_between(order_date, fldate) as DaysAhead
}
where
  cancelled <> 'X'
