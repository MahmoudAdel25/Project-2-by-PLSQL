--to get bonus for each branch

CREATE OR REPLACE PROCEDURE Dist_bonus (v_city_id NUMBER, v_city_bonus NUMBER)
IS
   BRANCH_COUNT   NUMBER (5);
BEGIN
   SELECT COUNT (*)
     INTO BRANCH_COUNT
     FROM BRANCHES
    WHERE city_id = v_city_id;

   UPDATE branches
      SET BRANCH_BONUS = v_city_bonus / branch_count
    WHERE city_id = v_CITY_ID;
END;
-----------------------------------------------------------------------------------------------------
-- to get the number of emp

CREATE OR REPLACE FUNCTION count_emp (v_branch_id NUMBER)
   RETURN NUMBER
IS
   v_count_emp   NUMBER;
BEGIN
   SELECT COUNT (EMPLOYEE_POSITION)
     INTO v_count_emp
     FROM Branch_employees
    WHERE branch_id = v_branch_id AND employee_position = 'EMP';

   RETURN v_count_emp;
END;

---------------------------------------------------------------------
-- to get the number of  mgr

CREATE OR REPLACE FUNCTION count_mgr (v_branch_id NUMBER)
   RETURN NUMBER
IS
   v_count_mgr   NUMBER;
BEGIN
   SELECT COUNT (EMPLOYEE_POSITION)
     INTO v_count_mgr
     FROM Branch_employees
    WHERE branch_id = v_branch_id AND employee_position = 'MGR';

   RETURN v_count_mgr;
END;
 --------------------------------------------------------------------------------------------------
 
-- to update the each EMP

CREATE OR REPLACE PROCEDURE dist_bonus_emp  (v_BRANCH_BONUS NUMBER, v_branch_id NUMBER)
IS
   v_fun   NUMBER (10);
BEGIN
   v_fun := count_emp (v_branch_id);

   UPDATE branch_employees
      SET EMPLOYEE_BONUS = v_BRANCH_BONUS * 0.5 / v_fun
    WHERE branch_id = v_branch_id AND employee_position = 'EMP';
END;


-- to update the each mgr

CREATE OR REPLACE PROCEDURE dist_bonus_mgr (v_BRANCH_BONUS NUMBER, v_branch_id NUMBER)
IS
   v_fun   NUMBER (10);
BEGIN
   v_fun := count_mgr (v_branch_id);

   UPDATE branch_employees
      SET EMPLOYEE_BONUS = v_BRANCH_BONUS * 0.5 / v_fun
    WHERE branch_id = v_branch_id AND employee_position = 'MGR';
END;


-- anonymous block  to call procedure and function
-----------------------------------------------------------------------------------

DECLARE
   CURSOR city_cursor
   IS
      SELECT * FROM cities;

   CURSOR dis_bon
   IS
      SELECT * FROM branches;
BEGIN
   FOR record_id IN city_cursor
   LOOP
      Dist_bonus (record_id.city_id, record_id.city_bonus);
   END LOOP;

   FOR cal_rec IN dis_bon
   LOOP
      dist_bonus_mgr (cal_rec.BRANCH_BONUS, cal_rec.branch_id);
      dist_bonus_emp (cal_rec.BRANCH_BONUS, cal_rec.branch_id);
   END LOOP;
END;