
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

CREATE OR REPLACE PROCEDURE dist_bonus_mgr (v_BRANCH_BONUS  NUMBER, v_branch_id   NUMBER)
IS
   v_fun   NUMBER (10);
BEGIN
   v_fun := count_mgr (v_branch_id);

   UPDATE branch_employees
      SET EMPLOYEE_BONUS = v_BRANCH_BONUS * 0.5 / v_fun
    WHERE branch_id = v_branch_id AND employee_position = 'MGR';
END;

show errors;