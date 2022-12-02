CLASS lhc_bookingsupplement DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE bookingsupplement.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE bookingsupplement.

    METHODS read FOR READ
      IMPORTING keys FOR READ bookingsupplement RESULT result.

    METHODS rba_Travel FOR READ
      IMPORTING keys_rba FOR READ bookingsupplement\_Travel FULL result_requested RESULT result LINK association_links.

ENDCLASS.

CLASS lhc_bookingsupplement IMPLEMENTATION.

  METHOD update.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD rba_Travel.
  ENDMETHOD.

ENDCLASS.
