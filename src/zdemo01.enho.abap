CLASS LCL_ZDEMO01 DEFINITION.
PUBLIC SECTION.
CLASS-DATA OBJ TYPE REF TO LCL_ZDEMO01. "#EC NEEDED
DATA CORE_OBJECT TYPE REF TO CL_SALV_TABLE . "#EC NEEDED
 INTERFACES  IOW_ZDEMO01.
  METHODS:
   CONSTRUCTOR IMPORTING CORE_OBJECT
     TYPE REF TO CL_SALV_TABLE OPTIONAL.
ENDCLASS.
CLASS LCL_ZDEMO01 IMPLEMENTATION.
METHOD CONSTRUCTOR.
  ME->CORE_OBJECT = CORE_OBJECT.
ENDMETHOD.

METHOD IOW_ZDEMO01~REFRESH.
*"------------------------------------------------------------------------*
*" Declaration of Overwrite-method, do not insert any comments here please!
*"
*"methods REFRESH
*"  importing
*"    !S_STABLE type LVC_S_STBL optional
*"    !REFRESH_MODE type SALV_DE_CONSTANT optional
*"  preferred parameter S_STABLE .
*"------------------------------------------------------------------------*

ENDMETHOD.
ENDCLASS.
