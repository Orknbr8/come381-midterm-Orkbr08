\# Silme Politikaları (ON DELETE Policies)



Kurs Kayıt Sistemi veritabanında yer alan tüm yabancı anahtarlar (Foreign Keys) ve veri bütünlüğünü korumak adına belirlenen silme politikaları aşağıda detaylandırılmıştır.



\---



\## 1. Yabancı Anahtar ve Politika Tablosu



| Tablo | Sütun | Referans Tablo | Referans Sütun | ON DELETE Politikası |

| :--- | :--- | :--- | :--- | :--- |

| `courses` | `category\_id` | `categories` | `category\_id` | \*\*RESTRICT\*\* |

| `instructor\_courses` | `instructor\_id` | `instructors` | `instructor\_id` | \*\*CASCADE\*\* |

| `instructor\_courses` | `course\_id` | `courses` | `course\_id` | \*\*CASCADE\*\* |

| `enrollments` | `student\_id` | `students` | `student\_id` | \*\*CASCADE\*\* |

| `enrollments` | `course\_id` | `courses` | `course\_id` | \*\*RESTRICT\*\* |



\---



\## 2. Politika Gerekçeleri ve Analiz



\### 1. `courses.category\_id` -> RESTRICT

Bir kurs kategorisi (örneğin "Bilgisayar Mühendisliği") altında tanımlı dersler bulunurken kategorinin kazara silinmesi engellenmelidir. Kategori silinmek istendiğinde veritabanı hata vererek veri kaybını önler.



\### 2. `instructor\_courses.instructor\_id` ve `course\_id` -> CASCADE

`instructor\_courses` tablosu M:N (Çoktan Çoğa) ilişkiyi çözen bir köprü tablodur. Sistemden bir eğitmen veya ders çıkarıldığında, bu eşleşme kaydının sistemde boşta (orphan) kalmaması için otomatik olarak silinmesi en doğru yaklaşımdır.



\### 3. `enrollments.student\_id` -> CASCADE

Bir öğrenci okuldan veya platformdan kaydını tamamen sildirdiğinde, o öğrenciye ait kayıt hareketlerinin de otomatik olarak temizlenmesi amaçlanmıştır.



\### 4. `enrollments.course\_id` -> RESTRICT

Aktif veya geçmişte derse kaydolmuş öğrencilerin bulunduğu bir kursun doğrudan silinmesi akademik geçmiş ve transkript verilerini bozar. Bu nedenle bir kurs, ancak ona kayıtlı hiçbir öğrenci kalmadığında silinebilir.



