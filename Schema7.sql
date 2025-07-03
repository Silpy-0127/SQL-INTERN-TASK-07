--VIEW Active Customers

DROP VIEW IF EXISTS ActiveCustomers;

CREATE VIEW ActiveCustomers AS
SELECT 
    Customers.CustomerID,
    Customers.Name AS CustomerName,
    COUNT(Orders.OrderID) AS TotalOrders
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.CustomerID, Customers.Name
HAVING COUNT(Orders.OrderID) > 1;
SELECT * FROM ActiveCustomers;


--VIEW ProductSalesView
CREATE VIEW ProductSalesView AS
SELECT 
    Products.Name AS ProductName,
    SUM(OrderItems.Quantity) AS TotalQuantity,
    SUM(OrderItems.Price) AS TotalSales
FROM OrderItems
JOIN Products ON OrderItems.ProductID = Products.ProductID
GROUP BY Products.Name;
SELECT * FROM ProductSalesView ORDER BY TotalSales DESC;


--VIEW DeliveredOrders
CREATE VIEW DeliveredOrders AS
SELECT 
    Orders.OrderID,
    Customers.Name AS CustomerName,
    Orders.Status,
    Payments.PaymentMethod,
    Payments.Amount
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
JOIN Payments ON Payments.OrderID = Orders.OrderID
WHERE Orders.Status = 'Delivered';
SELECT * FROM DeliveredOrders;


--VIEW LowStockProducts
CREATE VIEW LowStockProducts AS
SELECT 
    Products.Name AS ProductName,
    Inventory.QuantityAvailable
FROM Inventory
JOIN Products ON Inventory.ProductID = Products.ProductID
WHERE Inventory.QuantityAvailable < 50;
SELECT * FROM LowStockProducts;


--VIEW SellersWithInventory
CREATE VIEW SellersWithInventory AS
SELECT 
    Sellers.SellerID,
    Sellers.Name AS SellerName,
    COUNT(DISTINCT Inventory.ProductID) AS ProductCount
FROM Sellers
JOIN Products ON Sellers.SellerID = Products.SellerID
JOIN Inventory ON Products.ProductID = Inventory.ProductID
GROUP BY Sellers.SellerID, Sellers.Name;
SELECT * FROM SellersWithInentory;


