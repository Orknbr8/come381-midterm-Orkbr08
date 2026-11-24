## Deney 1
`SELECT COUNT(*), COUNT(phone) FROM customer;`

* **Tahminim:** `COUNT(*)` tablodaki tüm müşterilerin toplam sayısını verirken, `COUNT(phone)` yalnızca telefon numarası girilmiş (NULL olmayan) müşterileri sayacağı için daha küçük bir sayı çıkacaktır.
* **Sonuç:** ``
* **Yorum:** Tahminim tuttu. SQL'de `COUNT(*)` satır bazlı çalışıp `NULL` değerleri de sayarken, `COUNT(sütun_adı)` fonksiyonu `NULL` olan satırları yok sayar.

## Deney 2
`SELECT AVG(age), SUM(age) / COUNT(*) FROM customer;`

* **Tahminim:** `AVG(age)` yaş bilgisi boş (`NULL`) olan müşterileri hesaba katmadan ortalama alırken, `SUM(age) / COUNT(*)` toplam yaşı tüm müşteri sayısına böleceği için `AVG(age)` değerinden daha düşük bir sonuç çıkacaktır.
* **Sonuç:** ``
* **Yorum:** Tahminim tuttu. `AVG()` fonksiyonu `NULL` değerleri paydaya dahil etmezken, `COUNT(*)` tüm satırları saydığı için `NULL` değerleri 0 gibi işleme katarak ortalamayı aşağı çekti.
