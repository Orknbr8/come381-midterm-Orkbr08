# come381-midterm-Orkbr08



\# COME 381 - Midterm Project: Kurs Kayit Sistemi



Bu proje kapsaminda universite duzeyinde bir Kurs Kayit Yonetim Sistemi modellenmistir. Sistemde ogrenciler, kurslar, egitmenler, kurs kategorileri ve kayit islemleri yer almaktadir.



Bir egitmenin birden fazla kurs verebilmesi ve bir kursun birden fazla egitmen tarafindan yurutulebilmesi adina `instructors` ile `courses` tablolari arasinda M:N iliski kurgulanmis ve bu yapi `instructor\_courses` ara tablosuyla cozulmustur.



Veri tutarliligini saglamak amaciyla; egitmen silindiginde atama kayitlari CASCADE ile silinirken, ogrencilerin kayitli oldugu aktif kurslarin ve temel kurs kategorilerinin yanlislikla sistemden silinmesini engellemek icin RESTRICT silme politikalari tercih edilmistir.

