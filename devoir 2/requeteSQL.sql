START transaction;

USE `accidinfo`;
-- Q1
with BMW as (select 'BMW' as MARQUE)
SELECT NOM, PRENOM,ACC_DATE FROM 
BMW JOIN VEHICULE USING(MARQUE)
JOIN BLESSE USING(N°VEH)
JOIN ACCIDENT USING(N°ACC)
JOIN PERSONNE USING(N°PERS)
WHERE DEPT=75 AND GRAVITE='Fatale';

-- Q2
SELECT * 
FROM PERSONNE
where exists (SELECT N°PERS FROM BLESSE WHERE BLESSE.N°PERS=PERSONNE.N°PERS)
AND not exists (
SELECT N°ACC FROM VEHPART WHERE VEHPART.N°COND=PERSONNE.N°PERS 
AND N°ACC NOT IN(
SELECT N°ACC FROM BLESSE
WHERE BLESSE.N°PERS=PERSONNE.N°PERS));

-- Q3
SELECT NOM, PRENOM,AGE 
FROM PERSONNE 
JOIN BLESSE USING(N°PERS)
JOIN ACCIDENT USING(N°ACC)
WHERE GRAVITE='Grave' 
AND (ACC_DATE BETWEEN '2023-02-14 00:00:00' AND '2023-02-14 23:59:59');

-- Q4
select count(DISTINCT N°ACC),DEPT from
ACCIDENT join BLESSE using(N°ACC)
join VEHICULE using(N°VEH)
WHERE (ACC_DATE BETWEEN '2022-01-01' AND '2023-01-01') 
AND MARQUE='volkswagen'
AND GRAVITE='Fatale' 
GROUP BY DEPT;

commit ;