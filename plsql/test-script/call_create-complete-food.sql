set serveroutput on;

declare
 food_id varchar2(20);
begin
    api.create_complete_food(food_id,'apple',201,100,200);
end;
