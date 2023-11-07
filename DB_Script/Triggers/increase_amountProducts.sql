CREATE TRIGGER increase_amountProducts 
ON products
AFTER INSERT
AS
BEGIN
  UPDATE shopReports
  SET amountProducts = amountProducts + 1
  WHERE shopId = (SELECT shopId FROM inserted)
END
