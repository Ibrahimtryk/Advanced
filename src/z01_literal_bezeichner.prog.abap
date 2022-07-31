**&---------------------------------------------------------------------*
**& Report Z01_LITERAL_BEZEICHNER
**&---------------------------------------------------------------------*
**&
**&---------------------------------------------------------------------*
REPORT Z01_LITERAL_BEZEICHNER.
*
*data gv_prog type program value 'Y01_P1'.
*"call transaction gv_prog.
*
*
*submit (gv_prog) and return.
*
*data gv_where type string value ` carrid = 'AA'.`.
*data gv_tab type string value 'SPFLI'.
*
*data gv_fl type string value 'Carrid Connid cityfrom'.
*data gt_fl type TABLE OF string.
*append ` carrid` to gt_fl.
*APPEND ` connid` to gt_fl.
*
*
*select (gt_fl) from (gv_tab) into gs_spfli
*  where (gv_where).
*
*gv_prog  = 'EASTER_GET_DATE'.
*call function gv_prog.
*
*gv_prog = 'FACTORY'.
*cl_salv_table=>(gv_prog).
*
*
*sort gt_spfli  by (gv_sort) ASCENDING.
