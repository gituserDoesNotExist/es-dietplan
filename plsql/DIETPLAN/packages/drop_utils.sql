CREATE OR REPLACE PACKAGE DIETPLAN.DROP_UTILS AS 

  procedure drop_table_safely(table_name varchar2);
  procedure drop_sequence_safely(sequence_name varchar2);
  procedure drop_object_type_safely(object_name varchar2);
  
   END drop_utils;
/
