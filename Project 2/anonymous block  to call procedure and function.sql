-- anonymous block  to call procedure and function
---------------------------------------------------------------------------------
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