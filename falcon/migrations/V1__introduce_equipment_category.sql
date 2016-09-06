CREATE TABLE equipmentcategory (
equipmentcategoryid NUMBER(18) NOT NULL,
name VARCHAR2(30) NOT NULL,
CONSTRAINT pk_equipmentcategory PRIMARY KEY (equipmentcategoryid)
)
;
CREATE SEQUENCE s_equipmentcategory
    START WITH 1
;

INSERT INTO EQUIPMENTCATEGORY (EQUIPMENTCATEGORYID,NAME)
VALUES (s_equipmentcategory.nextval,'Construction')
;
--
INSERT INTO EQUIPMENTCATEGORY (EQUIPMENTCATEGORYID,NAME)
VALUES (s_equipmentcategory.nextval,'Industrial')
;
--
INSERT INTO EQUIPMENTCATEGORY (EQUIPMENTCATEGORYID,NAME)
VALUES (s_equipmentcategory.nextval,'Food Processing')
;
--
INSERT INTO EQUIPMENTCATEGORY (EQUIPMENTCATEGORYID,NAME)
VALUES (s_equipmentcategory.nextval,'Waste')
;
--
INSERT INTO EQUIPMENTCATEGORY (EQUIPMENTCATEGORYID,NAME)
VALUES (s_equipmentcategory.nextval,'Mining')
;
--
INSERT INTO EQUIPMENTCATEGORY (EQUIPMENTCATEGORYID,NAME)
VALUES (s_equipmentcategory.nextval,'Transportation')
;
