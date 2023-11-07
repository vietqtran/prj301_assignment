CREATE TRIGGER trg_InsertUserCart
ON [users]
AFTER INSERT
AS
BEGIN
    INSERT INTO [carts] ([userId])
    SELECT id
    FROM INSERTED;
END;
