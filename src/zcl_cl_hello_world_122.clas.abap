class ZCL_CL_HELLO_WORLD_122 definition
  public
  create public .

public section.
* https://github.com/wpoclava/abap-exercises-codejam
  interfaces IF_HTTP_SERVICE_EXTENSION .
protected section.
private section.
ENDCLASS.



CLASS ZCL_CL_HELLO_WORLD_122 IMPLEMENTATION.


  method IF_HTTP_SERVICE_EXTENSION~HANDLE_REQUEST.

*  REsponse->set_text( | Hello World | ).
DATA(lt_params) = request->get_form_fields(  ).
READ TABLE lt_params REFERENCE INTO DATA(lr_params) WITH KEY name = 'cmd'.
  IF sy-subrc <> 0.
    response->set_status( i_code = 400
                     i_reason = 'Bad request').
    RETURN.
  ENDIF.
  CASE lr_params->value.
      WHEN `hello`.
        response->set_text( |Hello World! | ).
      WHEN `timestamp`.
        response->set_text( |Hello World! application executed by {
                             cl_abap_context_info=>get_user_technical_name( ) } | &&
                              | on { cl_abap_context_info=>get_system_date( ) DATE = ENVIRONMENT } | &&
                              | at { cl_abap_context_info=>get_system_time( ) TIME = ENVIRONMENT } | ).
       when `bankdetails`.
    response->set_text( new zcl_api_hub_manager_122(  )->get_bank_details( ) ).
      WHEN OTHERS.
      response->set_status( i_code = 400 i_reason = 'Bad request').
  ENDCASE.


  endmethod.
ENDCLASS.
