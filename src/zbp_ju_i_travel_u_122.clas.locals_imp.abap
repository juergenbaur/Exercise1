CLASS lhc_travel DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR travel RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE travel.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE travel.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE travel.

    METHODS read FOR READ
      IMPORTING keys FOR READ travel RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK travel.

    METHODS rba_Booking FOR READ
      IMPORTING keys_rba FOR READ travel\_Booking FULL result_requested RESULT result LINK association_links.

    METHODS cba_Booking FOR MODIFY
      IMPORTING entities_cba FOR CREATE travel\_Booking.

    METHODS set_status_booked FOR MODIFY
      IMPORTING keys FOR ACTION travel~set_status_booked RESULT result.

ENDCLASS.

CLASS lhc_travel IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD create.
 DATA lt_messages   TYPE /dmo/if_flight_legacy=>tt_message.
    DATA ls_travel_in  TYPE /dmo/travel.
    DATA ls_travel_out TYPE /dmo/travel.

    LOOP AT entities ASSIGNING FIELD-SYMBOL(<fs_travel_create>).

      ls_travel_in = CORRESPONDING #( <fs_travel_create> MAPPING FROM ENTITY USING CONTROL ).

      CALL FUNCTION '/DMO/FLIGHT_TRAVEL_CREATE'
        EXPORTING
          is_travel   = CORRESPONDING /dmo/if_flight_legacy=>ts_travel_in( ls_travel_in )
        IMPORTING
          es_travel   = ls_travel_out
          et_messages = lt_messages.

      IF lt_messages IS INITIAL.
        INSERT VALUE #( %cid = <fs_travel_create>-%cid  travelid = ls_travel_out-travel_id )
                       INTO TABLE mapped-travel.
      ELSE.
        zju_cl_travel_auxiliary=>handle_travel_messages(
          EXPORTING
            iv_cid       = <fs_travel_create>-%cid
            it_messages  = lt_messages
          CHANGING
            failed       = failed-travel
            reported     = reported-travel ).
      ENDIF.

    ENDLOOP.
  ENDMETHOD.

  METHOD update.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

  METHOD rba_Booking.
  ENDMETHOD.

  METHOD cba_Booking.
  ENDMETHOD.

  METHOD set_status_booked.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZJU_I_TRAVEL_U_122 DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZJU_I_TRAVEL_U_122 IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.
  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
