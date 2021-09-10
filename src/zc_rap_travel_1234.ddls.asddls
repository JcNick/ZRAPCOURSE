@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Travel BO projection view'
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity ZC_RAP_Travel_1234
  as projection on ZI_RAP_Travel_1234 as Travel
{
  key TravelUUID,
      @Search.defaultSearchElement: true
      TravelID,
      @Search.defaultSearchElement: true
      AgencyID,
      @Consumption.valueHelpDefinition: [{entity: {name: 'ZI_RAP_Customer_1234',element: 'CustomerID' } }]
      @ObjectModel.text.element:['CustomerName']
      @Search.defaultSearchElement: true
      CustomerID,
      _Customer.FirstName as CustomerName,
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'

      TotalPrice,
      @Consumption.valueHelpDefinition: [{entity: {name: 'I_Currency',element: 'Currency' } }]
      CurrencyCode,
      Description,
      TravelStatus,
      CreatedBy,
      CreatedAt,
      LastChangedBy,
      LastChangedAt,
      LocalLastChangedAt,
      
      /* Associations */
      
      _Booking : redirected to composition child ZC_RAP_BOOKING_1234,
      _Currency,
      _Customer
}
