START transaction;

USE `accidinfo`;
ALTER TABLE PERSONNE MODIFY N°PERS VARCHAR(20), MODIFY ADRESSE TEXT;
ALTER TABLE VEHICULE MODIFY N°VEH VARCHAR(20);
ALTER TABLE CONDUCTEUR MODIFY N°PERS VARCHAR(20), MODIFY N°VEH VARCHAR(20);
ALTER TABLE ACCIDENT MODIFY N°ACC VARCHAR(20);
ALTER TABLE VEHPART MODIFY N°ACC VARCHAR(20),MODIFY N°VEH VARCHAR(20), MODIFY N°COND VARCHAR(20);
ALTER TABLE BLESSE MODIFY N°ACC VARCHAR(20),MODIFY N°PERS VARCHAR(20), MODIFY N°VEH VARCHAR(20);

commit ;