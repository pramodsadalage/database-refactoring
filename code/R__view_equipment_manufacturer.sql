CREATE OR REPLACE VIEW v_equipment_manufacturer
AS
SELECT
  e.equipmentid,
  e.description,
  m.name as manufacturer_name
FROM equipment e, manufacturer m
WHERE e.manufacturerid = m.manufacturerid
;
