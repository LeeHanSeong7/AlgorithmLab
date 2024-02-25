SELECT *
  FROM ITEM_INFO;

ITEM_ID	ITEM_NAME	RARITY	PRICE
0	ITEM_A	RARE	10000
1	ITEM_B	RARE	9000
2	ITEM_C	LEGEND	11000
3	ITEM_D	RARE	10000
4	ITEM_E	RARE	12000

SELECT *
  FROM ITEM_TREE;


ITEM_ID	PARENT_ITEM_ID
0	null
1	0
2	0
3	1
4	1;

SELECT ITEM_ID, ITEM_NAME, RARITY
  FROM ITEM_INFO
 WHERE ITEM_ID IN (
    SELECT ITEM_ID
      FROM ITEM_TREE
     WHERE PARENT_ITEM_ID IN (
        SELECT ITEM_ID
          FROM ITEM_INFO
         WHERE RARITY = 'RARE'
     )
 )
 ORDER BY 1 DESC;