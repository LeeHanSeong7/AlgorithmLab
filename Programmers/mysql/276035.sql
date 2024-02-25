SELECT DISTINCT ID, EMAIL, FIRST_NAME, LAST_NAME
  FROM DEVELOPERS D, SKILLCODES S
 WHERE S.CODE & D.SKILL_CODE != 0
   AND S.CATEGORY = 'Front End'
 ORDER BY ID;