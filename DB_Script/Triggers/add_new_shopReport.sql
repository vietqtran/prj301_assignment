CREATE TRIGGER add_new_shopReport
ON shops
AFTER INSERT
AS 
BEGIN
  INSERT INTO shopReports (shopId) 
  SELECT id 
  FROM inserted
END
