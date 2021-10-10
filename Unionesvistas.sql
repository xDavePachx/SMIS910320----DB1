USE Northwind;

SELECT
	p.ProductName Producto, 
	c.CategoryName Categoria
FROM 
	products p
INNER JOIN Categories c
ON  p.CategoryID = c.CategoryID;


--- Creacion de vista 
--que muestre el nombre del producto categoria y proveedor ordenados por nombre de categoria
CREATE VIEW ListadoProductos 
AS

SELECT
	p.ProductName Producto, 
	c.CategoryName Categoria, 
	o.ContactName Proveedores
FROM 
	Products p
INNER JOIN Categories c
ON  p.CategoryID = c.CategoryID
INNER JOIN Customers o
ON CustomerID = o.CustomerID;



SELECT Producto, Categoria, Proveedores FROM ListadoProductos;



--Modificacion de vista 
-- de tal forma que muestre los nombres que estan incluidos o no en las ordenes
ALTER VIEW ListadoProductos 

AS

SELECT
	p.ProductName Producto, c.CategoryName Categoria, o.OrderID NumeroDeOrden
FROM 
	Products p
RIGHT JOIN [Order Details] o
ON  p.ProductID = o.ProductID
INNER JOIN Categories c
ON p.CategoryID = c.CategoryID;

SELECT Producto, Categoria, NumeroDeOrden FROM ListadoProductos