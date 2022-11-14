@AbapCatalog.sqlViewName: 'ZJUISUPP_U_122'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Supplement view - CDS data model'

define view ZJU_I_BookSupp_U_122
  as select from /dmo/book_suppl as BookingSupplement

  association        to parent ZJU_I_BOOK_U_122 as _Booking        on  $projection.TravelID  = _Booking.TravelID
                                                                   and $projection.BookingID = _Booking.BookingID
  association [1..1] to ZJU_I_TRAVEL_U_122      as _Travel         on  $projection.TravelID  = _Travel.TravelID  
  association [1..1] to /DMO/I_Supplement       as _Product        on  $projection.SupplementID = _Product.SupplementID
  association [1..*] to /DMO/I_SupplementText   as _SupplementText on  $projection.SupplementID = _SupplementText.SupplementID

{
  key BookingSupplement.travel_id             as TravelID,

  key BookingSupplement.booking_id            as BookingID,

  key BookingSupplement.booking_supplement_id as BookingSupplementID,

      BookingSupplement.supplement_id         as SupplementID,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingSupplement.price                 as Price,

      @Semantics.currencyCode: true
      BookingSupplement.currency_code         as CurrencyCode,

//      _Booking.LastChangedAt                  as LastChangedAt,

      /* Associations */
      _Booking,
      _Travel,
      _Product,
      _SupplementText
}
