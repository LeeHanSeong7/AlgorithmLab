SELECT ID, (
        SELECT COUNT(*)
          FROM ECOLI_DATA T2
         WHERE T2.PARENT_ID = T1.ID
    ) AS CHILD_COUNT
  FROM ECOLI_DATA T1;