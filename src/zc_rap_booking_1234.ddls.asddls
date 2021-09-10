@EndUserText.label: 'Booking BO projection view'
@AccessControl.authorizationCheck: #CHECK
@Search.searchable: true
@Metadata.allowExtensions: true
define view entity ZC_RAP_BOOKING_1234
  as projection on ZI_RAP_Booking_1234 as Booking
{
  key BookingUUID,
      TravelUUID,
      @Search.defaultSearchElement: true

      BookingID,
      BookingDate,
      @Consumption.valueHelpDefinition: [{ entity : {name: 'ZI_RAP_Customer_1234', element: 'CustomerID'  } }]
      @ObjectModel.text.element: ['CustomerName']
      @Search.defaultSearchElement: true
      CustomerID,
      _Customer.FirstName as CustomerName,
      @ObjectModel.text.element: ['CarrierName']
      CarrierID,
      _Carrier.carrname      as CarrierName,
      ConnectionID,
      FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'

      FlightPrice,
      @Consumption.valueHelpDefinition: [{entity: {name: 'I_Currency', element: 'Currency' }}]

      CurrencyCode,
      CreatedBy,
      LastChangedBy,
      LocalLastChangedAt,
      /* Associations */
      _Carrier,
      _Currency,
      _Customer,
      _Travel : redirected to parent ZC_RAP_Travel_1234
}
