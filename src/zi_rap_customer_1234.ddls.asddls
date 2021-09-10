@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Customer BO view'
@Metadata.allowExtensions: true
define view entity ZI_RAP_Customer_1234
  as select from /DMO/I_Customer as Customer
{
  key CustomerID,
      FirstName,
      LastName,
      Title,
      Street,
      PostalCode,
      City,
      CountryCode,
      PhoneNumber,
      EMailAddress,
      /* Associations */
      _Country

}
