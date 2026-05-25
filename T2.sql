USE ProjectTasks

BEGIN TRAN

UPDATE Tasks
SET TSId = 3
WHERE TaskId=2
--x lock for T2 aquired

--waits for x lock for T1
UPDATE Tasks
SET Title='some task 1'
WHERE TaskId=1

ROLLBACK
COMMIT