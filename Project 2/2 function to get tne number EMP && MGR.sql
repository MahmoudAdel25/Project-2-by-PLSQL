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

show errors;