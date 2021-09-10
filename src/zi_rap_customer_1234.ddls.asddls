@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Customer BO view'
@Metadata.allowExtensions: true
define view entity ZI_RAP_Customer_1234
  as select from scustom as Customer
{
  key id    as CustomerID,
      name  as FirstName,
      city  as City,

      email as EMailAddress


}
