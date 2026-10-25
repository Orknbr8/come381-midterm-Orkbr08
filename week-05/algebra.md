\# İlişkisel Cebir ve Eşdeğer SQL Sorguları (Relational Algebra \& SQL)



Kurs Kayıt Sistemi üzerinde belirlenen 5 temel sorgunun ilişkisel cebir gösterimleri ve PostgreSQL karşılıkları aşağıda sunulmuştur.



\---



\### Sorgu 1: Kredisi 3'ten büyük olan kursların kodları ve başlıkları

\* \*\*İlişkisel Cebir:\*\*

$$\\pi\_{course\\\_code, title}(\\sigma\_{credits > 3}(courses))$$



\* \*\*Eşdeğer SQL:\*\*

```sql

SELECT course\_code, title

FROM courses

WHERE credits > 3;


SELECT s.first_name, s.last_name, c.course_code
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE e.status = 'ACTIVE';

SELECT c.title, c.course_code
FROM courses c
JOIN instructor_courses ic ON c.course_id = ic.course_id
JOIN instructors i ON ic.instructor_id = i.instructor_id
WHERE i.first_name = 'Gizem' AND i.last_name = 'Turker';

SELECT c.course_code, c.title
FROM courses c
JOIN categories cat ON c.category_id = cat.category_id
WHERE cat.category_name = 'Bilgisayar Bilimleri';

SELECT s.student_id, s.first_name, s.last_name
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id
WHERE e.enrollment_id IS NULL;