-- ============================================================
-- ÖDEV 2: Kurs Kayıt Sistemi - Kısıtlar (Constraints)
-- ============================================================

-- 1. Kurs Kredisi Kontrolü (1 ile 30 arasında olmalı)
ALTER TABLE courses
ADD CONSTRAINT chk_course_credits_range
CHECK (credits >= 1 AND credits <= 30);

-- 2. Öğrenci Numarası Formatı (Tam 10 haneli rakam olmalı)
ALTER TABLE students
ADD CONSTRAINT chk_student_number_format
CHECK (student_number ~ '^[0-9]{10}$');

-- 3. Öğrenci E-posta Formatı (@ ve . içermeli)
ALTER TABLE students
ADD CONSTRAINT chk_student_email_format
CHECK (email ~ '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$');

-- 4. Eğitmen E-posta Formatı (@ ve . içermeli)
ALTER TABLE instructors
ADD CONSTRAINT chk_instructor_email_format
CHECK (email ~ '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$');

-- 5. Eğitmen Telefon Numarası Formatı (En az 10 karakter olmalı)
ALTER TABLE instructors
ADD CONSTRAINT chk_instructor_phone_length
CHECK (LENGTH(phone) >= 10);

-- 6. Kurs Kodu Büyük Harf Formatı (En az 3 büyük harf veya rakam)
ALTER TABLE courses
ADD CONSTRAINT chk_course_code_uppercase
CHECK (course_code = UPPER(course_code));

-- 7. Kayıt Durumu Kontrolü (Sadece izin verilen değerler)
ALTER TABLE enrollments
ADD CONSTRAINT chk_enrollment_status_valid
CHECK (status IN ('ACTIVE', 'COMPLETED', 'DROPPED'));

-- 8. Kategori Adı Boş Olamaz Kontrolü
ALTER TABLE categories
ADD CONSTRAINT chk_category_name_not_empty
CHECK (LENGTH(TRIM(category_name)) > 0);

-- 9. Eğitmen Ad ve Soyad Boş Olamaz
ALTER TABLE instructors
ADD CONSTRAINT chk_instructor_name_not_empty
CHECK (LENGTH(TRIM(first_name)) > 0 AND LENGTH(TRIM(last_name)) > 0);

-- 10. Öğrenci Ad ve Soyad Boş Olamaz
ALTER TABLE students
ADD CONSTRAINT chk_student_name_not_empty
CHECK (LENGTH(TRIM(first_name)) > 0 AND LENGTH(TRIM(last_name)) > 0);