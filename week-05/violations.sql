-- ============================================================
-- ÖDEV 2: violations.sql - Kısıt İhlali Testleri
-- ============================================================

-- TEST 1: Kredi aralığı ihlali (0 kredi - Hata vermeli)
INSERT INTO courses (course_code, title, category_id, credits)
VALUES ('CENG101', 'Intro to CS', 1, 0);

-- TEST 2: Kredi aralığı ihlali (35 kredi - Hata vermeli)
INSERT INTO courses (course_code, title, category_id, credits)
VALUES ('CENG102', 'Advanced Algorithms', 1, 35);

-- TEST 3: Öğrenci numarası format ihlali (Harf içeriyor - Hata vermeli)
INSERT INTO students (student_number, first_name, last_name, email)
VALUES ('2024A00001', 'Ali', 'Yilmaz', 'ali@univ.edu');

-- TEST 4: Öğrenci numarası eksik hane (8 hane - Hata vermeli)
INSERT INTO students (student_number, first_name, last_name, email)
VALUES ('20240001', 'Can', 'Demir', 'can@univ.edu');

-- TEST 5: Öğrenci geçersiz e-posta formatı (@ işareti yok - Hata vermeli)
INSERT INTO students (student_number, first_name, last_name, email)
VALUES ('2024000002', 'Ayse', 'Kaya', 'ayse_at_univ.edu');

-- TEST 6: Eğitmen geçersiz e-posta formatı (.com / uzantı yok - Hata vermeli)
INSERT INTO instructors (first_name, last_name, email, phone)
VALUES ('Mehmet', 'Ozturk', 'mehmet@univ', '05551112233');

-- TEST 7: Eğitmen kısa telefon numarası (< 10 karakter - Hata vermeli)
INSERT INTO instructors (first_name, last_name, email, phone)
VALUES ('Zeynep', 'Celik', 'zeynep@univ.edu', '12345');

-- TEST 8: Kurs kodu küçük harf ihlali (Büyük harf zorunlu - Hata vermeli)
INSERT INTO courses (course_code, title, category_id, credits)
VALUES ('ceng201', 'Data Structures', 1, 4);

-- TEST 9: Geçersiz kayıt durumu (Status izin verilen listede değil - Hata vermeli)
INSERT INTO enrollments (student_id, course_id, status)
VALUES (1, 1, 'PENDING');

-- TEST 10: Boşluktan oluşan kategori adı ihlali (Trim kontrolü - Hata vermeli)
INSERT INTO categories (category_name)
VALUES (' ');

-- TEST 11 (SINIR TESTİ 1): Kredi alt sınır testi (1 kredi - BAŞARILI OLMALI)
-- (Sınırın çalıştığını doğrular)
-- INSERT INTO courses (course_code, title, category_id, credits) VALUES ('CENG100', 'Seminar', 1, 1);

-- TEST 12 (SINIR TESTİ 2): Kredi üst sınır testi (30 kredi - BAŞARILI OLMALI)
-- INSERT INTO courses (course_code, title, category_id, credits) VALUES ('CENG499', 'Capstone', 1, 30);

-- TEST 13 (NULL TESTİ): NULL kabul eden sütun testi
-- assigned_date varsayılan DEFAULT CURRENT_DATE alır, ancak açıkça NULL verildiğinde kısıt davranışı
INSERT INTO instructor_courses (instructor_id, course_id, assigned_date)
VALUES (9999, 9999, NULL);