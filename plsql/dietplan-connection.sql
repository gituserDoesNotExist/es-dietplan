set serveroutput on;

DECLARE
h number;
th number;
doc clob;
begin
h := dbms_metadata.open('PACKAGE_BODY');

DBMS_METADATA.SET_FILTER(h,'SCHEMA','DIETPLAN');
DBMS_METADATA.SET_FILTER(h,'NAME','OBJECT_TYPE_TEST');

th := dbms_metadata.add_transform(h,'MODIFY');

doc := dbms_metadata.fetch_clob(h);

dbms_output.put_line('hello world');

dbms_metadata.close(h);

dbms_output.put_line(doc);

end;
