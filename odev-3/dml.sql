\set VERBOSITY verbose
BEGIN;

-- Önce: Sıcak İçecek fiyatları
SELECT name, price
FROM product
WHERE category = 'Sıcak İçecek'
ORDER BY product_id;

-- Komut 1: Sıcak İçecek fiyatlarını 5 TL artır
UPDATE product
SET price = price + 5
WHERE category = 'Sıcak İçecek';

-- Sonra: Sıcak İçecek fiyatları (5 TL artmış hali)
SELECT name, price
FROM product
WHERE category = 'Sıcak İçecek'
ORDER BY product_id;

-- Komut 2: Var olmayan 999 numaralı ürünü bir siparişe ekle (23503 hatası verecek)
INSERT INTO order_item (order_id, product_id, quantity)
VALUES (1, 999, 1);

ROLLBACK;

-- ROLLBACK sonrası: Sıcak İçecek fiyatları (eski haline dönmüş hali)
SELECT name, price
FROM product
WHERE category = 'Sıcak İçecek'
ORDER BY product_id;
