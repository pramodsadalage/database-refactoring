CREATE TABLE equipmentusage (
equipmentusageid NUMBER(18) NOT NULL,
equipmentcategoryid NUMBER(18) NOT NULL,
name VARCHAR2(30) NOT NULL,
CONSTRAINT pk_equipmentusage PRIMARY KEY (equipmentusageid)
)
;

CREATE SEQUENCE s_equipmentusage
    START WITH 1
;
CREATE UNIQUE INDEX uidx_equipmentusage_cat_name
ON equipmentusage (equipmentcategoryid,name)
;

ALTER TABLE equipmentusage
  ADD (CONSTRAINT fk_equipmentusage_category FOREIGN KEY (equipmentcategoryid)
  REFERENCES equipmentcategory)
;

INSERT INTO equipmentusage (equipmentusageid,equipmentcategoryid,name)
VALUES
  (s_equipmentusage.nextval,
  (SELECT equipmentcategoryid FROM equipmentcategory where name='Transportation'),
  'Airports')
;
INSERT INTO equipmentusage (equipmentusageid,equipmentcategoryid,name)
VALUES
  (s_equipmentusage.nextval,
  (SELECT equipmentcategoryid FROM equipmentcategory where name='Transportation'),
  'Bridges')
;
INSERT INTO equipmentusage (equipmentusageid,equipmentcategoryid,name)
VALUES
  (s_equipmentusage.nextval,
  (SELECT equipmentcategoryid FROM equipmentcategory where name='Transportation'),
  'Dams')
;
INSERT INTO equipmentusage (equipmentusageid,equipmentcategoryid,name)
VALUES
  (s_equipmentusage.nextval,
  (SELECT equipmentcategoryid FROM equipmentcategory where name='Transportation'),
  'Highways;Road')
;

INSERT INTO equipmentusage (equipmentusageid,equipmentcategoryid,name)
VALUES
  (s_equipmentusage.nextval,
  (SELECT equipmentcategoryid FROM equipmentcategory where name='Industrial'),
  'Demolition')
;
INSERT INTO equipmentusage (equipmentusageid,equipmentcategoryid,name)
VALUES
  (s_equipmentusage.nextval,
  (SELECT equipmentcategoryid FROM equipmentcategory where name='Industrial'),
  'Scrap Handling')
;
INSERT INTO equipmentusage (equipmentusageid,equipmentcategoryid,name)
VALUES
  (s_equipmentusage.nextval,
  (SELECT equipmentcategoryid FROM equipmentcategory where name='Industrial'),
  'Steel Mill')
;
INSERT INTO equipmentusage (equipmentusageid,equipmentcategoryid,name)
VALUES
  (s_equipmentusage.nextval,
  (SELECT equipmentcategoryid FROM equipmentcategory where name='Industrial'),
  'Landfills')
;

INSERT INTO equipmentusage (equipmentusageid,equipmentcategoryid,name)
VALUES (s_equipmentusage.nextval,
  (SELECT equipmentcategoryid FROM equipmentcategory where name='Mining'),
  'Exploration and Development')
;
INSERT INTO equipmentusage (equipmentusageid,equipmentcategoryid,name)
VALUES (s_equipmentusage.nextval,
  (SELECT equipmentcategoryid FROM equipmentcategory where name='Mining'),
  'Loading')
;
INSERT INTO equipmentusage (equipmentusageid,equipmentcategoryid,name)
VALUES (s_equipmentusage.nextval,
  (SELECT equipmentcategoryid FROM equipmentcategory where name='Mining'),
  'Road Construction')
;
INSERT INTO equipmentusage (equipmentusageid,equipmentcategoryid,name)
VALUES (s_equipmentusage.nextval,
  (SELECT equipmentcategoryid FROM equipmentcategory where name='Mining'),
  'Timber Harvesting')
;

INSERT INTO equipmentusage (equipmentusageid,equipmentcategoryid,name)
VALUES (s_equipmentusage.nextval,
  (SELECT equipmentcategoryid FROM equipmentcategory where name='Food Processing'),
  'Mushroom Farming')
;
INSERT INTO equipmentusage (equipmentusageid,equipmentcategoryid,name)
VALUES (s_equipmentusage.nextval,
  (SELECT equipmentcategoryid FROM equipmentcategory where name='Food Processing'),
  'Freezer Operation')
;
INSERT INTO equipmentusage (equipmentusageid,equipmentcategoryid,name)
VALUES (s_equipmentusage.nextval,
  (SELECT equipmentcategoryid FROM equipmentcategory where name='Food Processing'),
  'Cold Storage')
;
INSERT INTO equipmentusage (equipmentusageid,equipmentcategoryid,name)
VALUES (s_equipmentusage.nextval,
  (SELECT equipmentcategoryid FROM equipmentcategory where name='Food Processing'),
  'Pickle;Brine Operation')
;

INSERT INTO equipmentusage (equipmentusageid,equipmentcategoryid,name)
VALUES (s_equipmentusage.nextval,
  (SELECT equipmentcategoryid FROM equipmentcategory where name='Waste'),
  'Transfer Station')
;
INSERT INTO equipmentusage (equipmentusageid,equipmentcategoryid,name)
VALUES (s_equipmentusage.nextval,
  (SELECT equipmentcategoryid FROM equipmentcategory where name='Waste'),
  'Landfill Operation')
;
INSERT INTO equipmentusage (equipmentusageid,equipmentcategoryid,name)
VALUES (s_equipmentusage.nextval,
  (SELECT equipmentcategoryid FROM equipmentcategory where name='Waste'),
  'Mill and Yard Operations')
;
INSERT INTO equipmentusage (equipmentusageid,equipmentcategoryid,name)
VALUES (s_equipmentusage.nextval,
  (SELECT equipmentcategoryid FROM equipmentcategory where name='Waste'),
  'Vegetable and Fruit Handling')
;

INSERT INTO equipmentusage (equipmentusageid,equipmentcategoryid,name)
VALUES (s_equipmentusage.nextval,
  (SELECT equipmentcategoryid FROM equipmentcategory where name='Construction'),
  'Fabrication Shop')
;
INSERT INTO equipmentusage (equipmentusageid,equipmentcategoryid,name)
VALUES (s_equipmentusage.nextval,
  (SELECT equipmentcategoryid FROM equipmentcategory where name='Construction'),
  'Tunelling')
;
INSERT INTO equipmentusage (equipmentusageid,equipmentcategoryid,name)
VALUES (s_equipmentusage.nextval,
  (SELECT equipmentcategoryid FROM equipmentcategory where name='Construction'),
  'Cement Processing')
;
INSERT INTO equipmentusage (equipmentusageid,equipmentcategoryid,name)
VALUES (s_equipmentusage.nextval,
  (SELECT equipmentcategoryid FROM equipmentcategory where name='Construction'),
  'Stone Processing')
;
