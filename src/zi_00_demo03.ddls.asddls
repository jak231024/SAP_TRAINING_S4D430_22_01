@AbapCatalog.sqlViewName: 'ZI00DEMO03'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Demo 03: Annotations'
define view ZI_00_Demo03
  as select from sflight
{
  key carrid     as Carrid,
  key connid     as Connid,
  key fldate     as Fldate,
      @Semantics.amount.currencyCode: 'Currency'
      price      as Price,
      currency   as Currency,
      planetype  as Planetype,
      seatsmax   as Seatsmax,
      seatsocc   as Seatsocc,
      @Semantics.amount.currencyCode: 'Currency'
      paymentsum as Paymentsum
}

// für Beträge bzw. Währungen: @Semantics.amount.currencyCode: <Feld>
// für Mengen bzw. Einheiten: @Semantics.quantity.unitOfMeasure: <Feld>
