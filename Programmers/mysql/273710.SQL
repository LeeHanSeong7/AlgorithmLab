SELECT I.ITEM_ID AS ITEM_ID, I.ITEM_NAME AS ITEM_NAME
  FROM ITEM_TREE T, ITEM_INFO I
 WHERE I.ITEM_ID = T.ITEM_ID
   AND PARENT_ITEM_ID IS NULL
 ORDER BY 1;
 