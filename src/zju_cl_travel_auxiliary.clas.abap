CLASS zju_cl_travel_auxiliary DEFINITION
 INHERITING FROM cl_abap_behv
  PUBLIC
  FINAL
  CREATE PUBLIC .


  PUBLIC SECTION.

    TYPES tt_travel_failed              TYPE TABLE FOR FAILED   ZJU_I_TRAVEL_U_122.
    TYPES tt_travel_mapped              TYPE TABLE FOR MAPPED   ZJU_I_TRAVEL_U_122.
    TYPES tt_travel_reported            TYPE TABLE FOR REPORTED ZJU_I_TRAVEL_U_122.

    CLASS-METHODS handle_travel_messages
      IMPORTING
        iv_cid       TYPE string   OPTIONAL
        iv_travel_id TYPE /dmo/travel_id OPTIONAL
        it_messages  TYPE /dmo/t_message
      CHANGING
        failed       TYPE tt_travel_failed
        reported     TYPE tt_travel_reported.


  PRIVATE SECTION.

    CLASS-DATA obj TYPE REF TO zju_cl_travel_auxiliary.

    CLASS-METHODS get_message_object
      RETURNING VALUE(r_result) TYPE REF TO zju_cl_travel_auxiliary.
ENDCLASS.

CLASS zju_cl_travel_auxiliary IMPLEMENTATION.

  METHOD handle_travel_messages.

    LOOP AT it_messages INTO DATA(ls_message) WHERE msgty = 'E' OR msgty = 'A'.
      APPEND VALUE #( %cid = iv_cid  travelid = iv_travel_id )
             TO failed.

      APPEND VALUE #( %msg      = get_message_object( )->new_message( id       = ls_message-msgid
                                               number   = ls_message-msgno
                                               severity = if_abap_behv_message=>severity-error
                                               v1       = ls_message-msgv1
                                               v2       = ls_message-msgv2
                                               v3       = ls_message-msgv3
                                               v4       = ls_message-msgv4 )
                      %key-TravelID = iv_travel_id
                      %cid          = iv_cid
                      TravelID      = iv_travel_id )
             TO reported.
    ENDLOOP.

  ENDMETHOD.


  METHOD get_message_object.

    IF obj IS INITIAL.
      CREATE OBJECT obj.
    ENDIF.
    r_result = obj.

  ENDMETHOD.
ENDCLASS.
