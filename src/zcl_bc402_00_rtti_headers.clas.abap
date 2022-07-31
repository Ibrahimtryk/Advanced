class ZCL_BC402_00_RTTI_HEADERS definition
  public
  create public .

public section.

*"* public components of class ZCL_BC402_00_RTTI_HEADERS
*"* do not include other source files here!!!
  class-methods WRITE_HEADERS
    importing
      !IV_TABNAME type CSEQUENCE
    exceptions
      TYPE_NOT_FOUND
      NO_STRUCTURE
      NO_DDIC_TYPE .
protected section.
*"* protected components of class CL_BC402_DYS_GENERIC_WRITE
*"* do not include other source files here!!!
private section.
*"* private components of class CL_BC402_DYS_RTTI_HEADERS
*"* do not include other source files here!!!
ENDCLASS.



CLASS ZCL_BC402_00_RTTI_HEADERS IMPLEMENTATION.


METHOD write_headers.

  DATA lo_type TYPE REF TO cl_abap_typedescr.
  DATA lo_struct TYPE REF TO cl_abap_structdescr.
  DATA lt_fieldlist TYPE ddfields.
  FIELD-SYMBOLS <fs_flist> LIKE LINE OF lt_fieldlist.

  CALL METHOD cl_abap_typedescr=>describe_by_name
    EXPORTING
      p_name         = iv_tabname " Typename
    RECEIVING
      p_descr_ref    = lo_type   " Referenz auf Beschreibungsobjekt
    EXCEPTIONS
      type_not_found = 1.
  IF sy-subrc <> 0.
    RAISE type_not_found.
  ENDIF.
  CASE lo_type->kind.
    WHEN 'S'.
      lo_struct ?= lo_type. "Down-Cast oder Narrowing Cast
      "lt_fieldlist = lo_struct->get_ddic_field_list( ).
      CALL METHOD lo_struct->get_ddic_field_list
        RECEIVING
          p_field_list = lt_fieldlist    " Liste der
        EXCEPTIONS
          not_found    = 1
          no_ddic_type = 2.
      CASE sy-subrc.
        WHEN 1.
          RAISE type_not_found.
        WHEN 2.
          RAISE no_ddic_type.
      ENDCASE.


      LOOP AT lt_fieldlist ASSIGNING <fs_flist>.
        WRITE <fs_flist>-reptext(<fs_flist>-outputlen).
      ENDLOOP.
      ULINE.
    WHEN OTHERS.
      RAISE no_structure.
  ENDCASE.




ENDMETHOD.
ENDCLASS.
