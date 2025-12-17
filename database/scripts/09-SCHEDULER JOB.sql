-- Create a Scheduler Job to run procedure cleanup_old_data automatically (runs every 1st of the Month at 2 AM)
BEGIN
   DBMS_SCHEDULER.create_job (
      job_name        => 'JOB_CLEANUP_OLD_DATA',
      job_type        => 'STORED_PROCEDURE',
      job_action      => 'STORM_PKG.CLEANUP_OLD_DATA',
      start_date      => SYSTIMESTAMP,
      repeat_interval => 'FREQ=MONTHLY;BYHOUR=2;BYMINUTE=0;BYSECOND=0',
      enabled         => TRUE,
      comments        => 'Daily cleanup of old sensor and log data'
   );
END;
/

-- test job (manually)
BEGIN
   DBMS_SCHEDULER.run_job('JOB_CLEANUP_OLD_DATA');
END;
/

-- disable the job
BEGIN
   DBMS_SCHEDULER.disable('JOB_CLEANUP_OLD_DATA');
END;
/

-- drop the job
BEGIN
   DBMS_SCHEDULER.drop_job('JOB_CLEANUP_OLD_DATA');
END;
/

-- Check that the job was created
set serveroutput on;
SELECT job_name
FROM user_scheduler_jobs

WHERE job_name = 'JOB_CLEANUP_OLD_DATA';

