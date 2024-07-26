SELECT *
FROM prod.users
WHERE UserID IS NULL;
GO
SELECT UserID, COUNT(*) as Count
FROM prod.users
GROUP BY UserID
HAVING COUNT(*) > 1;
GO
SELECT *
FROM prod.users
WHERE PurchaseTotal IS NULL;
GO

