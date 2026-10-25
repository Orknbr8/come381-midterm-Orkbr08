-- ============================================================
-- ÖDEV 2: seed.sql - Kurs Kayıt Sistemi Örnek Verileri
-- ============================================================

-- 1. Kategoriler
INSERT INTO categories (category_name) VALUES
('Bilgisayar Bilimleri'),
('Matematik'),
('Yazilim Muhendisligi'),
('Isletme ve Ekonomi');

-- 2. Eğitmenler
INSERT INTO instructors (first_name, last_name, email, phone) VALUES
('Ahmet', 'Yilmaz', 'ahmet.yilmaz@univ.edu', '05321112233'),
('Gizem', 'Turker', 'gizem.turker@univ.edu', '05332223344'),
('Caner', 'Erdem', 'caner.erdem@univ.edu', '05343334455'),
('Elif', 'Aydin', 'elif.aydin@univ.edu', '05354445566');

-- 3. Kurslar
INSERT INTO courses (course_code, title, category_id, credits) VALUES
('COME101', 'Programlamaya Giris', 1, 4),
('COME201', 'Veri Yapilari', 1, 4),
('COME381', 'Veritabani Sistemleri', 3, 3),
('MATH101', 'Kalkulus I', 2, 4),
('MATH102', 'Lineer Cebir', 2, 3),
('BUS101', 'Isletme Yonetimi', 4, 3);

-- 4. Eğitmen - Kurs Atamaları (M:N)
INSERT INTO instructor_courses (instructor_id, course_id, assigned_date) VALUES
(1, 1, '2026-09-15'),
(2, 3, '2026-09-15'),
(2, 2, '2026-09-16'),
(3, 4, '2026-09-15'),
(3, 5, '2026-09-16'),
(4, 6, '2026-09-15');

-- 5. Öğrenciler
INSERT INTO students (student_number, first_name, last_name, email) VALUES
('2024000001', 'Orkun', 'Bora', 'orkun.bora@std.univ.edu'),
('2024000002', 'Mehmet', 'Kaya', 'mehmet.kaya@std.univ.edu'),
('2024000003', 'Zeynep', 'Demir', 'zeynep.demir@std.univ.edu'),
('2024000004', 'Ece', 'Yildiz', 'ece.yildiz@std.univ.edu'),
('2024000005', 'Burak', 'Cetin', 'burak.cetin@std.univ.edu');

-- 6. Kurs Kayıtları (Enrollments)
INSERT INTO enrollments (student_id, course_id, status) VALUES
(1, 1, 'COMPLETED'),
(1, 2, 'ACTIVE'),
(1, 3, 'ACTIVE'),
(2, 1, 'COMPLETED'),
(2, 3, 'ACTIVE'),
(3, 3, 'ACTIVE'),
(3, 4, 'ACTIVE'),
(4, 6, 'ACTIVE'),
(5, 4, 'DROPPED');