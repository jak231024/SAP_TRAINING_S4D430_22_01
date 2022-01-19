@AbapCatalog.sqlViewAppendName: 'ZE00DEMO14'
@EndUserText.label: 'Demo 14: View Extensions'
extend view ZI_00_Demo02 with ZE_00_Demo14
  association [*] to sbook as _Bookings on  Flight.carrid = _Bookings.carrid
                                        and Flight.connid = _Bookings.connid
                                        and Flight.fldate = _Bookings.fldate
{
  Connection.countryfr as Countryfr,
  Connection.countryto as Countryto,
  _Bookings
}
