CREATE TRIGGER UpdateProductRate 
ON rates
AFTER INSERT
AS 
BEGIN
  UPDATE p
  SET p.rate = r.avgRate
  FROM products p
  INNER JOIN 
  (
    SELECT productId, AVG(star) AS avgRate
    FROM rates 
    GROUP BY productId
  ) r 
  ON p.id = r.productId
END