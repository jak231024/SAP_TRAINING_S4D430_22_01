@AbapCatalog.sqlViewName: 'ZIABAPAGENCY'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Basic View: Agency'
define view ZI_ABAP_Agency
  as select from stravelag
{
  key agencynum as ID,
      name      as Name,
      street    as Street,
      postcode  as Postcode,
      city      as City,
      country   as Country
}
