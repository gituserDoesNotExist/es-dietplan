set serveroutput on;

declare
h number;
th number;
myxml clob := '<ROWSET> <ROW> <PROCEDURE_T> <VERS_MAJOR>1</VERS_MAJOR> <VERS_MINOR>1 </VERS_MINOR> <OBJ_NUM>21942</OBJ_NUM> <TYPE_NUM>7</TYPE_NUM> <SCHEMA_OBJ> <OBJ_NUM>21942</OBJ_NUM> <OWNER_NUM>49</OWNER_NUM> <OWNER_NAME>DIETPLAN</OWNER_NAME> <NAME>MYPROC2</NAME> <NAMESPACE>1</NAMESPACE> <TYPE_NUM>7</TYPE_NUM> <TYPE_NAME>PROCEDURE</TYPE_NAME> <CTIME>2019-04-14 14:21:54</CTIME> <MTIME>2019-04-14 14:21:54</MTIME> <STIME>2019-04-14 14:21:54</STIME> <STATUS>1</STATUS> <FLAGS>0</FLAGS> <SPARE1>6</SPARE1> <SPARE2>65535</SPARE2> <SPARE3>49</SPARE3> <OWNER_NAME2>DIETPLAN</OWNER_NAME2> </SCHEMA_OBJ> <SOURCE_LINES> <SOURCE_LINES_ITEM> <OBJ_NUM>21942</OBJ_NUM> <LINE>1</LINE> <PRE_NAME>0</PRE_NAME> <POST_NAME_OFF>18</POST_NAME_OFF> <POST_KEYW>11</POST_KEYW> <PRE_NAME_LEN>0</PRE_NAME_LEN> <SOURCE>procedure MYPROC2 (nr in number) </SOURCE> </SOURCE_LINES_ITEM> <SOURCE_LINES_ITEM> <OBJ_NUM>21942</OBJ_NUM> <LINE>2</LINE> <PRE_NAME>0</PRE_NAME> <POST_NAME_OFF>0</POST_NAME_OFF> <POST_KEYW>0</POST_KEYW> <PRE_NAME_LEN>0</PRE_NAME_LEN> <SOURCE>is </SOURCE> </SOURCE_LINES_ITEM> <SOURCE_LINES_ITEM> <OBJ_NUM>21942</OBJ_NUM> <LINE>3</LINE> <PRE_NAME>0</PRE_NAME> <POST_NAME_OFF>0</POST_NAME_OFF> <POST_KEYW>0</POST_KEYW> <PRE_NAME_LEN>0</PRE_NAME_LEN> <SOURCE>begin </SOURCE> </SOURCE_LINES_ITEM> <SOURCE_LINES_ITEM> <OBJ_NUM>21942</OBJ_NUM> <LINE>4</LINE> <PRE_NAME>0</PRE_NAME> <POST_NAME_OFF>0</POST_NAME_OFF> <POST_KEYW>0</POST_KEYW> <PRE_NAME_LEN>0</PRE_NAME_LEN> <SOURCE>dbms_output.put_line(); </SOURCE> </SOURCE_LINES_ITEM> <SOURCE_LINES_ITEM> <OBJ_NUM>21942</OBJ_NUM> <LINE>5</LINE> <PRE_NAME>0</PRE_NAME> <POST_NAME_OFF>0</POST_NAME_OFF> <POST_KEYW>0</POST_KEYW> <PRE_NAME_LEN>0</PRE_NAME_LEN> <TRAILING_NL>N</TRAILING_NL> <SOURCE>end;</SOURCE> </SOURCE_LINES_ITEM> </SOURCE_LINES> </PROCEDURE_T></ROW> </ROWSET>';
res boolean;
errs    sys.ku$_SubmitResults := sys.ku$_SubmitResults();
begin
h := dbms_metadata.openw('PROCEDURE');
th := DBMS_METADATA.add_transform(h,'DDL');

res := dbms_metadata.put(h,myxml,0,errs);
end;