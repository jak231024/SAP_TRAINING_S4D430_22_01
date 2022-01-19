@AbapCatalog.sqlViewName: 'ZI00CUSTOMER'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Basic View: Customer'
define view ZI_00_Customer
  as select from scustom
{
  key id                                            as ID,
      @EndUserText.label: 'Name'
      @EndUserText.quickInfo: 'Name'
      concat_with_space(form, name, 1)              as Name,
      street                                        as Street,
      postcode                                      as Postcode,
      city                                          as City,
      country                                       as Country,
      @EndUserText.label: 'Discount (Factor)'
      @EndUserText.quickInfo: 'Discount (Factor)'
      division(cast(discount as abap.int2), 100, 2) as Discount
}
