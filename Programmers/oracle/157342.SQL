SELECT *
  FROM (
    SELECT CAR_ID, ROUND( SUM(END_DATE-START_DATE+1)/COUNT(*),1) AS AVERAGE_DURATION
      FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
     GROUP BY CAR_ID
 )
 WHERE AVERAGE_DURATION >= 7
 ORDER BY 2 DESC ,1 DESC;