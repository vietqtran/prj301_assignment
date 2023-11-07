CREATE TRIGGER trg_check_insert_cart_product
ON cartProducts
INSTEAD OF INSERT
AS
BEGIN
  DECLARE @productId BIGINT
  DECLARE @cartId BIGINT
  DECLARE @sizeId BIGINT
  DECLARE @quantity INT
  DECLARE @shopId BIGINT

  DECLARE insertCursor CURSOR FOR
  SELECT productId, cartId, sizeId, quantity, shopId
  FROM inserted;

  OPEN insertCursor;
  FETCH NEXT FROM insertCursor INTO @productId, @cartId, @sizeId, @quantity, @shopId;

  WHILE @@FETCH_STATUS = 0
  BEGIN
    IF EXISTS (
      SELECT 1
      FROM cartProducts
      WHERE productId = @productId
        AND cartId = @cartId
        AND sizeId = @sizeId
    )
    BEGIN
      UPDATE cartProducts
      SET quantity = quantity + @quantity
      WHERE productId = @productId
        AND cartId = @cartId
        AND sizeId = @sizeId;
    END
    ELSE
    BEGIN
      INSERT INTO cartProducts (productId, cartId, shopId, quantity, sizeId)
      VALUES (@productId, @cartId, @shopId, @quantity, @sizeId);
    END;

    FETCH NEXT FROM insertCursor INTO @productId, @cartId, @sizeId, @quantity, @shopId;
  END;

  CLOSE insertCursor;
  DEALLOCATE insertCursor;
END;
