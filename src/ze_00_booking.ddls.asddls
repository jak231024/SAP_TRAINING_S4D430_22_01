@AbapCatalog.sqlViewAppendName: 'ZE00BOOKING'
@EndUserText.label: 'Extension View: Booking'
extend view ZI_00_Booking with ZE_00_Booking
  association [1] to stravelag as _TravelAgency on _TravelAgency.agencynum = sbook.agencynum
{
  sbook.custtype as CustomerType,
  sbook.smoker   as IsSmoker,
  _TravelAgency
}
