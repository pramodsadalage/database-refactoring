CREATE TABLE equipment (
  equipmentid NUMBER(18) NOT NULL,
  description VARCHAR2(200) NOT NULL,
  starting_miles NUMBER(18),
  service_interval_miles NUMBER(18) NOT NULL,
  service_interval_duration NUMBER(2) NOT NULL,
  service_interval_duration_unit VARCHAR2(10) NOT NULL,
  acquired_date DATE NOT NULL,
  acquired_by VARCHAR2(30) NOT NULL,
  acquired_from VARCHAR2(30) NOT NULL,
  location VARCHAR2(240) NOT NULL,
  serial_NUMBER VARCHAR2(60) NOT NULL,
  notes VARCHAR2(4000),
  manufacturer VARCHAR2(30) NOT NULL,
  equipmentstatus VARCHAR2(10) NOT NULL,
  CONSTRAINT pk_equipment
         PRIMARY KEY (equipmentid)
)
;

CREATE SEQUENCE s_equipment
    START WITH 1000000
;

--SAMPLE Data to so that refactorings make sense

INSERT INTO equipment (
equipmentid,description,starting_miles,service_interval_miles,service_interval_duration,
service_interval_duration_unit,acquired_date,acquired_by,acquired_from,
serial_number,manufacturer,equipmentstatus,notes,location
)
VALUES
(s_equipment.nextval,'JCB radial lift 135 skid steer', 18,5000, 3, 'Months', to_date('09/01/2016','MM/DD/YYYY'), 'JOHN DANIEL','PARKER JCB','55SWF4KB5GU167138','JCB','New',
'The small platform JCB radial lift 135 skid steer,side door entry','202 E Randolph St. Chicago IL 60601'
)
;
INSERT INTO equipment (
equipmentid,description,starting_miles,service_interval_miles,service_interval_duration,
service_interval_duration_unit,acquired_date,acquired_by,acquired_from,
serial_number,manufacturer,equipmentstatus,notes,location
)
VALUES
(s_equipment.nextval,'Core IC Cushion Forklift', 7,4000, 3, 'Months', to_date('09/01/2016','MM/DD/YYYY'), 'REENA GRAHAM' ,'Atlas Toyota Material Handling', '1FT8W3DT6GEC67986','Toyota','New',
'Toyota’s Core IC Cushion Forklift is one of the most popular forklifts in North America. Warehousing and distribution applications','202 E Randolph St. Chicago IL 60601'
)
;
INSERT INTO equipment (
equipmentid,description,starting_miles,service_interval_miles,service_interval_duration,
service_interval_duration_unit,acquired_date,acquired_by,acquired_from,
serial_number,manufacturer,equipmentstatus,notes,location
)
VALUES
(s_equipment.nextval,'VNL 430 The specialty haul sleeper', 34,10000, 3, 'Months', to_date('09/01/2016','MM/DD/YYYY'), 'PAUL MARKER','M and K Truck Centers','4V4NC9EH1HN971656','Volvo','New',
'A versatile and affordable sleeper tractor, the VNL 430 is specially designed for the demands of long-distance bulk haul and specialty applications.','202 E Randolph St. Chicago IL 60601'
)
;
INSERT INTO equipment (
equipmentid,description,starting_miles,service_interval_miles,service_interval_duration,
service_interval_duration_unit,acquired_date,acquired_by,acquired_from,
serial_number,manufacturer,equipmentstatus,notes,location
)
VALUES
(s_equipment.nextval,'340AJ Articulating Boom Lifts', 4,1000, 6, 'Months', to_date('09/01/2016','MM/DD/YYYY'), 'CHARLES DAVIS','National Lift Truck' ,'19XFC2F53GE057360','JLG','New',
'Environmentally-friendly Tier 4 diesel engine, Industry-leading terrainability','202 E Randolph St. Chicago IL 60601'
)
;
INSERT INTO equipment (
equipmentid,description,starting_miles,service_interval_miles,service_interval_duration,
service_interval_duration_unit,acquired_date,acquired_by,acquired_from,
serial_number,manufacturer,equipmentstatus,notes,location
)
VALUES
(s_equipment.nextval,'HL 757-9A', 40,3000, 6, 'Months', to_date('09/01/2016','MM/DD/YYYY'), 'ANDY SLOCKET','Martin Implement','5NPD84LF8HH019461','Hyundai','New',
'Proven, reliable, fuel efficient, low emission, low noise Cummins Tier 4 Interim & EU Stage IIIB
QSB6.7 engine','202 E Randolph St. Chicago IL 60601'
)
;
INSERT INTO equipment (
equipmentid,description,starting_miles,service_interval_miles,service_interval_duration,
service_interval_duration_unit,acquired_date,acquired_by,acquired_from,
serial_number,manufacturer,equipmentstatus,notes,location
)
VALUES
(s_equipment.nextval,'136Li', 0,0, 6, 'Months', to_date('09/01/2016','MM/DD/YYYY'), 'JULIE BLOCK','RUSSO POWER EQUIPMENT','84LF8HH01','Husqvarna','New',
'Lightweight, comfortable and easy to use battery chainsaw.','202 E Randolph St. Chicago IL 60601'
)
;

INSERT INTO equipment (
equipmentid,description,starting_miles,service_interval_miles,service_interval_duration,
service_interval_duration_unit,acquired_date,acquired_by,acquired_from,
serial_number,manufacturer,equipmentstatus,notes,location
)
VALUES
(s_equipment.nextval,'M&HCV CONSTRUCK', 440,10000, 6, 'Months', to_date('09/01/2016','MM/DD/YYYY'), 'JACK FINK','SIYON MOTORS', '3VW2B7AJ4HM211291','Tata Motors','New',
'A host of heavy duty features that ensure excellent performance under difficult conditions and significant reduction in cost of ownership.','202 E Randolph St. Chicago IL 60601'
)
;
