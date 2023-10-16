--to get bonus for each branch

CREATE OR REPLACE Procedure Dist_bonus(v_city_id number,v_city_bonus number)
is

BRANCH_COUNT number(5);

begin
    SELECT COUNT(*)
    INTO BRANCH_COUNT
    FROM BRANCHES
    WHERE city_id=v_city_id;
    
    update branches
 set BRANCH_BONUS=v_city_bonus/branch_count 
    where city_id=v_CITY_ID;

end;
show error;