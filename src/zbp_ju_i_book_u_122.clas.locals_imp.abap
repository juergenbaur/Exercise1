CLASS lhc_booking DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE booking.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE booking.

    METHODS read FOR READ
      IMPORTING keys FOR READ booking RESULT result.

    METHODS rba_Booksupplement FOR READ
      IMPORTING keys_rba FOR READ booking\_Booksupplement FULL result_requested RESULT result LINK association_links.

    METHODS rba_Travel FOR READ
      IMPORTING keys_rba FOR READ booking\_Travel FULL result_requested RESULT result LINK association_links.

    METHODS cba_Booksupplement FOR MODIFY
      IMPORTING entities_cba FOR CREATE booking\_Booksupplement.

ENDCLASS.

CLASS lhc_booking IMPLEMENTATION.

  METHOD update.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD rba_Booksupplement.
  ENDMETHOD.

  METHOD rba_Travel.
  ENDMETHOD.

  METHOD cba_Booksupplement.
  ENDMETHOD.

ENDCLASS.
