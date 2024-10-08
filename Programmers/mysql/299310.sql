WITH MAX_INFO AS (
SELECT YEAR(DIFFERENTIATION_DATE) AS YEAR, MAX(SIZE_OF_COLONY) AS SIZE
  FROM ECOLI_DATA
 GROUP BY YEAR(DIFFERENTIATION_DATE)
)
SELECT YEAR(DIFFERENTIATION_DATE) AS YEAR,
        (
            SELECT SIZE - SIZE_OF_COLONY
              FROM MAX_INFO
             WHERE YEAR = YEAR(DIFFERENTIATION_DATE)
        ) AS YEAR_DEV,
        ID
  FROM ECOLI_DATA
 ORDER BY YEAR, YEAR_DEV;