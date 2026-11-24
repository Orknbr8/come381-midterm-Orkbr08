-- Q1: Fiyatı 50 TL'den yüksek ürünleri pahalıdan ucuza sırala.
-- Ne işe yarar: Kafenin en yüksek fiyatlı ürünlerini belirleyerek menü fiyatlandırmasını analiz etmeyi sağlar.
SELECT name, price
FROM product
WHERE price > 50
ORDER BY price DESC;

-- Q2: 'YBS' bölümündeki müşterilerin adlarını alfabetik olarak sırala.
-- Ne işe yarar: Yönetim Bilişim Sistemleri bölümünden gelen müşteri kitlesini listeleyerek bölüme özel kampanya planlamaya yardımcı olur.
SELECT full_name
FROM customer
WHERE department = 'YBS'
ORDER BY full_name ASC;

-- Q3: Sipariş numarasını, sipariş tarihini ve müşterinin adını listele.
-- Ne işe yarar: Hangi siparişin ne zaman ve kim tarafından verildiğini tek tabloda birleştirerek sipariş takibini kolaylaştırır.
SELECT o.order_id, o.order_date, c.full_name
FROM orders o
INNER JOIN customer c ON c.customer_id = o.customer_id
ORDER BY o.order_id;

-- Q4: Sipariş edilen kalemin ürün adını ve adedini listele.
-- Ne işe yarar: Verilen siparişlerin içerik detaylarını ve hangi üründen kaç adet satıldığını görmeyi sağlar.
SELECT oi.order_id, p.name, oi.quantity
FROM order_item oi
INNER JOIN product p ON p.product_id = oi.product_id
ORDER BY oi.order_id;

-- Q5: Her müşterinin toplam kaç siparişi olduğunu müşteri adıyla listele.
-- Ne işe yarar: En sık sipariş veren sadık müşterileri tespit ederek müşteri sadakat programları oluşturmaya yardımcı olur.
SELECT c.full_name, COUNT(o.order_id) AS siparis_sayisi
FROM customer c
INNER JOIN orders o ON o.customer_id = c.customer_id
GROUP BY c.customer_id, c.full_name
ORDER BY siparis_sayisi DESC;

-- Q6: Her ürün kategorisinin ortalama fiyatını bul.
-- Ne işe yarar: Kategoriler arası fiyat dengesini karşılaştırarak yeni ürünlerin fiyat stratejisini belirlemeyi sağlar.
SELECT category, ROUND(AVG(price), 2) AS ortalama_fiyat
FROM product
GROUP BY category
ORDER BY ortalama_fiyat DESC;
