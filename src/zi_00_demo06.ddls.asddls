@AbapCatalog.sqlViewName: 'ZI00DEMO06'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Demo 06: Built-In Functions'
define view ZI_00_Demo06
  as select from sflight
    inner join   spfli on  sflight.carrid = spfli.carrid
                       and sflight.connid = spfli.connid
{
  /*
   * Numerische Funktionen
   */
  5.0 / 3.0                                                as Fltp1,
  div(5, 3)                                                as Div1,
  mod(5, 3)                                                as Mov1,
  division(5, 3, 4)                                        as Division1,
  price                                                    as Price,
  round(price, 1)                                          as Round1,
  round(price, 0)                                          as Round2,
  round(price, -1)                                         as Round3,
  fltp_to_dec(1.345435 as abap.dec(16,2))                  as FltpToDec1,
  /*
   * Zeichenkettenfunktionen
   */
  concat_with_space('Hallo', 'Welt', 1)                    as ConcatWithSpace1,
  substring('Hallo Welt', 7, 4)                            as Substring1,
  length('1  ')                                            as Length1SS,
  length('  3')                                            as LengthSS3,
  length(' ')                                              as LengthS,
  /*
   * Währungs- und Einheitenumrechnung
   */
  @Semantics.quantity.unitOfMeasure: 'OldDistanceUnit'
  distance                                                 as OldDistance,
  distid                                                   as OldDistanceUnit,
  @Semantics.quantity.unitOfMeasure: 'NewDistanceUnit'
  unit_conversion(
    quantity => distance,
    source_unit => distid,
    target_unit => cast('KM' as abap.unit) )               as NewDistance,
  cast('KM' as abap.unit)                                  as NewDistanceUnit,
  price                                                    as OldPrice,
  currency                                                 as OldCurrencyCode,
  currency_conversion(
    amount => price,
    source_currency => currency,
    target_currency => cast('EUR' as abap.cuky),
    exchange_rate_date => fldate )                         as NewPrice,
  cast('EUR' as abap.cuky)                                 as NewCurrencyCode,
  /*
   * Datums- und Zeitfunktionen
   */
  cast('20220118' as abap.dats)                            as Today,
  dats_add_days(cast('20220118' as abap.dats), 30, 'FAIL') as Date1

}
