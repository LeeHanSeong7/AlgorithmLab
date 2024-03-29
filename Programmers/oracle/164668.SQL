WITH SALES AS (
    SELECT WRITER_ID, SUM(PRICE) AS TOTAL_SALES
      FROM USED_GOODS_BOARD
     WHERE STATUS = 'DONE'
     GROUP BY WRITER_ID
    HAVING SUM(PRICE) >= 700000
)
SELECT T1.USER_ID,	T1.NICKNAME, TOTAL_SALES
  FROM USED_GOODS_USER T1, SALES
 WHERE SALES.WRITER_ID = T1.USER_ID
 ORDER BY 3;