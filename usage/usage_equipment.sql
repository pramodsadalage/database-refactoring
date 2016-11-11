INSERT INTO equipment (equipmentid,description,starting_miles,service_interval_miles,service_interval_duration, service_interval_duration_unit,acquired_date,acquired_by,acquired_from,serial_number,notes, manufacturer,equipmentstatus,manufacturerid,equipmentstatusid,fueltypeid,location)
VALUES
(s_equipment.nextval,'TEST-ME-TO-ACCESS',0,0,6,'Months',
SYSDATE,'TEST', 'TEST','TEST_ME_TOO_ACCESS','Light','MANN','New',7,1,2,
'202 E Randolph St. Chicago IL 60601')
;

SELECT
equipmentid,
description,
starting_miles,
service_interval_miles,
service_interval_duration,
service_interval_duration_unit,
acquired_date,
acquired_by,
acquired_from,
serial_number,
notes,
manufacturer,
equipmentstatus,
manufacturerid,
equipmentstatusid,
fueltypeid
FROM
equipment
WHERE
serial_number = 'TEST_ME_TOO_ACCESS'
;

DELETE FROM equipment WHERE serial_number = 'TEST_ME_TOO_ACCESS'
;
