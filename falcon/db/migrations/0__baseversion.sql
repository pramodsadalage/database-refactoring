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
  serial_NUMBER VARCHAR2(60) NOT NULL,
  notes VARCHAR2(4000),
  CONSTRAINT pk_equipment
         PRIMARY KEY (equipmentid)
)
;

CREATE SEQUENCE s_equipment
    START WITH 1000000
;
