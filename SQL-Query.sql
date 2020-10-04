--NO 1 berhasil
SELECT cs.CustomerName, cs.CustomerPhone
FROM Customers cs, SalesTransactions st, DetailSalesTransaction dst
WHERE cs.CustomerID = st.CustomerID AND st.SalesID = dst.SalesID
AND DATEPART(YEAR,SalesTransactionDate) LIKE '2019'
GROUP BY CustomerName, CustomerPhone
HAVING SUM(QuantitySandwich) > 3

--NO 2 berhasil
SELECT s.StaffName,  [TransactionCount] = COUNT(SalesID)
FROM Customers cs, Staffs s, SalesTransactions st
WHERE cs.CustomerID = st.CustomerID AND s.StaffID = st.StaffID AND cs.CustomerName LIKE 'T%' AND DATEPART(MONTH,cs.CustomerDateOfBirth) > 9
GROUP BY StaffName

--NO 3 berhasil
SELECT [Chef] = LOWER(c.ChefName), [AverageSandwichPerTransaction] = AVG(dst.QuantitySandwich)
FROM Chefs c, SalesTransactions st, DetailSalesTransaction dst
WHERE c.ChefID = st.ChefID AND st.SalesID = dst.SalesID AND 
c.ChefExperience NOT LIKE 'Beginner'
GROUP BY ChefName
HAVING SUM(dst.QuantitySandwich) > 3

--NO 4 berhasil
SELECT [Code] = RIGHT(v.VendorID,3), [Company] = REPLACE(v.VendorName,'Company','Co.'),
[MinimumItemPrice] = MIN(i.IngredientPrice), [MaximumItemPrice] = MAX(i.IngredientPrice)
FROM Vendors v, PurchaseTransactions pt, DetailPurchaseTransaction dpt, Ingredients i
WHERE v.VendorID = pt.VendorID AND pt.PurchaseID = dpt.PurchaseID AND dpt.IngredientID = i.IngredientID
AND v.VendorEmail LIKE '%@gmail.com' AND v.VendorName LIKE '% % %'
GROUP BY v.VendorID, VendorName

--NO 5 berhasil
SELECT [FirstAndLastName] = LEFT(s.StaffName,1) + RIGHT(s.StaffName,1), s.StaffSalary 
FROM Staffs s, Customers cs, SalesTransactions st, (
	SELECT AVERAGE = AVG(s.StaffSalary)
	FROM Staffs s
) AS X 
WHERE s.StaffID = st.StaffID AND cs.CustomerID = st.CustomerID AND 
CustomerGender LIKE 'Female' AND StaffSalary > AVERAGE 

--NO 6 berhasil
SELECT cs.CustomerName, DATEDIFF(YEAR,CustomerDateOfBirth,GETDATE()) AS [CustomerAge], sw.SandwichName, CAST(QuantitySandwich AS VARCHAR) + ' Piece(s)' AS [Quantity]
FROM Customers cs, SalesTransactions st, DetailSalesTransaction dst, Sandwichs sw, (
	SELECT AVG(DATEDIFF(YEAR,CustomerDateOfBirth,GETDATE())) AS AVERAGE
	FROM Customers 
) AS A
WHERE cs.CustomerID = st.CustomerID AND st.SalesID = dst.SalesID AND dst.SandwichID = sw.SandwichID 
AND QuantitySandwich < 5 AND DATEDIFF(YEAR,CustomerDateOfBirth,GETDATE()) > A.AVERAGE
GROUP BY CustomerName, CustomerDateOfBirth, SandwichName, QuantitySandwich


--NO 7 berhasil
SELECT [Price] = MIN(SandwichPrice), SandwichName 
FROM Sandwichs sw, DetailSalesTransaction dst, (
	SELECT sw.SandwichName AS NameSandwich
	FROM DetailSalesTransaction dst, Sandwichs sw
	WHERE sw.SandwichID = dst.SandwichID 
	GROUP BY SandwichName
	HAVING SUM(QuantitySandwich) BETWEEN 5 AND 25
) AS S
WHERE sw.SandwichID = dst.SandwichID AND SandwichName LIKE S.NameSandwich AND SandwichName LIKE '% %'
GROUP BY SandwichName
ORDER BY Price ASC

--NO 8 berhasil
SELECT StaffName, [Salary] = 'Rp' + CAST(CAST(StaffSalary AS INT) AS VARCHAR), [GenderFirstChar] = LEFT(StaffGender,1)
FROM Staffs, (
	SELECT MIN(StaffSalary) AS MINIMAL,
	AVG(StaffSalary) AS AVERAGE
	FROM Staffs
	WHERE StaffGender LIKE 'Male'
) AS G
WHERE StaffSalary > G.MINIMAL AND StaffSalary < G.AVERAGE

--NO 9 berhasil
BEGIN TRAN
CREATE VIEW StaffSalesStatistic
AS
SELECT s.StaffName, sw.SandwichName, [SalesCount] = COUNT(dst.SalesID), [SalesTotal] = SUM(dst.QuantitySandwich)
FROM Staffs s, Sandwichs sw, SalesTransactions st, DetailSalesTransaction dst
WHERE sw.SandwichID = dst.SandwichID AND s.StaffID = st.StaffID AND st.SalesID = dst.SalesID AND sw.SandwichName LIKE '% %'
GROUP BY StaffName, SandwichName
HAVING SUM(dst.QuantitySandwich) > 1

SELECT * FROM StaffSalesStatistic

--NO 10 berhasil
BEGIN TRAN
CREATE VIEW VendorStatistic
AS
SELECT VendorName, [PriceRange] = MAX(i.IngredientPrice)-MIN(i.IngredientPrice), [MinimumItemPurchased] = MIN(dpt.QuantityIngredient),
[MaximumItemPurchased] = MAX(QuantityIngredient)
FROM Vendors v, PurchaseTransactions pt, DetailPurchaseTransaction dpt, Ingredients i
WHERE v.VendorID = pt.VendorID AND pt.PurchaseID = dpt.PurchaseID AND dpt.IngredientID = i.IngredientID AND v.VendorAddress NOT LIKE '%Gold%'
GROUP BY VendorName
HAVING MAX(i.IngredientPrice)-MIN(i.IngredientPrice) > 0

SELECT * FROM VendorStatistic