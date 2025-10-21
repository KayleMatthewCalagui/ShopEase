DELIMITER $$

CREATE TRIGGER trg_calc_price_subtotal
BEFORE INSERT ON Order_Item
FOR EACH ROW
BEGIN
    DECLARE unit_price DECIMAL(10,2);
    SELECT p.unit_price INTO unit_price 
    FROM Product p 
    WHERE p.product_id = NEW.product_id;
    SET NEW.price_subtotal = unit_price * NEW.quantity;
END$$

DELIMITER ;
