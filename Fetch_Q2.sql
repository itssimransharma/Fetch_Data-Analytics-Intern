--Question 1
SELECT NAME
FROM BRANDS B
LEFT JOIN RECEIPT_ITEMS RI
ON B.BARCODE = RI.BARCODE
INNER JOIN RECEIPTS R
ON RI.Reward_Receipt_ID = R.ID
WHERE MONTH = 6
GROUP BY B.NAME
ORDER BY SUM(R.PURCHASE_DATE) DESC
LIMIT 1;

--Question 2
SELECT U.ID
FROM USERS U
INNER JOIN RECEIPTS R
ON U.ID = R.USER_ID
WHERE MONTH(R.PURACHASE_DATE) = 8
GROUP BY U.ID
ORDER BY SUM(R.TOTAL_SPENT) DESC
LIMIT 1;

--Question 3
SELECT U.ID
FROM USERS U
INNER JOIN RECEIPTS R
ON U.ID = R.USER_ID
INNER JOIN ON RECEIPT ITEMS RI
ON R.ID =  RI.REWARDS_RECEIPT_ID
ORDER BY CAST(RI.TOTAL_SPENT AS DECIMAL(7,2))/RI.QUANTITY_PURCHASED DESC
LIMIT 1;

--Question 4
SELECT RI.DESCRIPTION
FROM RECEIPT_ITEMS RI
ORDER BY CAST(RI.TOTAL_SPENT AS DECIMAL(7,2))/RI.QUANTITY_PURCHASED DESC
LIMIT 1;

----Question 5
SELECT MONTH(R.DATE_SCANNED), COUNT(DISTINCT R.USER_ID)
FROM RECEIPTS R
GROUP BY MONTH(R.DATE_SCANNED);
