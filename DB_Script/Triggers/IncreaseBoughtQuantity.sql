CREATE TRIGGER IncreaseBoughtQuantity
ON orderProducts
AFTER INSERT
AS
BEGIN
  UPDATE products
  SET boughtQuantity = boughtQuantity + inserted.quantity
  FROM products
  INNER JOIN inserted ON products.id = inserted.productId
END
