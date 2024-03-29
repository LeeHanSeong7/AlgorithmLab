WITH FRAME AS (
    SELECT DISTINCT CAR_ID
      FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
)
SELECT FRAME.CAR_ID, DECODE(T1.HISTORY_ID, NULL, '대여 가능', '대여중') AS AVAILABILITY
  FROM FRAME, (
    SELECT CAR_ID, HISTORY_ID
      FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
     WHERE TO_DATE('2022-10-16','YYYY-MM-DD') BETWEEN START_DATE AND END_DATE 
  ) T1
 WHERE FRAME.CAR_ID = T1.CAR_ID(+)
 ORDER BY 1 DESC