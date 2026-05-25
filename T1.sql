USE ProjectTasks

BEGIN TRAN

UPDATE Tasks 
SET TSId = 3
WHERE TaskId=1
--x lock for T1 aquired

--waits for x lock for T2
UPDATE Tasks
SET [Title]='some task 2'
WHERE TaskId=2

ROLLBACK
COMMIT

--prevention:
--db manages deadlocks automatically and rolls back
--the least expensive transaction, so the other one can commit
--as a user, keep order of updates T1,then T2 in both transactions