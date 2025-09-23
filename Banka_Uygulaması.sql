--Basit bir uygulama 3 tablolu Deneyen ve ayný sonuçlara ulaþan herkese baþarýlar dilerim.

use [Banka Uygulamasý] 


select * from Musteriler
select * from Hesaplar
select * from Islemler

alter table Hesaplar add KullanilanBanka varchar(30);	
alter table musteriler drop column maas;
alter table Hesaplar alter column HesapBakiyesi decimal; --bu komut tablodaki veritipinin adýný deðiþtirir.

insert into Musteriler values (13,'Adem Alýk','Trabzon','Memur')
insert into Hesaplar values (11,'Aslý Kuru','Vadeli',72,'Akbank')
insert into Islemler values (5,'Aslý Kuru','10.07.2025')


select * from Musteriler where MusteriMeslek='Memur'
select * from Musteriler where MusteriMeslek='Memur' and MusteriSehir='Kýrþehir'
select * from Musteriler where MusteriMeslek='Futbolcu' or MusteriSehir='Kýrþehir'
select * from musteriler where MusteriSehir in('Sivas','Ankara')

select * from Hesaplar where HesapTuru like'%Y_%'
select musteriAdSoyad,MusteriMeslek from Musteriler;
select distinct MusteriMeslek from Musteriler

select * from Musteriler order by MusteriAdSoyad asc;
select * from Musteriler order by MusteriMeslek desc;

--2 deðer arasýndaki veriyi listeler
select * from Hesaplar where HesapBakiyesi between 85000 or 100000;
select UPPER(MusteriAdSoyad) as 'Müþteri Ad Soyad Büyük Harf' from Musteriler
select lower(MusteriAdSoyad) as 'Müþteri Ad Soyad küçük Harf' from Musteriler

select SUM(HesapBakiyesi) as 'Toplam Maaþ' from Hesaplar 
select MAX(HesapBakiyesi) as 'En Yüksek Maaþ' from Hesaplar group by HesapBakiyesi
select Min(HesapBakiyesi) as 'En Düþük Maaþ' from Hesaplar group by HesapBakiyesi
select AVG(HesapBakiyesi) as 'Maaþ Ortalamasý' from Hesaplar
select count(MusteriID) FROM Musteriler
select top(7) * from Musteriler

select MusteriSehir,COUNT(MusteriSehir) as 'Hangi Þehirde Kaç Müþteri Var' from Musteriler group by MusteriSehir;
select MusteriSehir,COUNT(MusteriSehir) as 'Hangi Þehirde Kaç Müþteri Var' from Musteriler group by MusteriSehir order by MusteriSehir DESC;

SELECT KullanilanBanka,min(HesapBakiyesi) as 'En düþük Maaþlý Kiþi',
MAX (HesapBakiyesi) as 'En Yüksek modelli araç markasý' 
from Hesaplar
Group by KullanilanBanka

select MusteriAdSoyad,MusteriMeslek,KullanilanBanka,HesapBakiyesi from Musteriler,Hesaplar where Musteriler.MusteriAdSoyad=Hesaplar.MusteriAdiSoyad

select MusteriAdSoyad,MusteriSehir,MusteriMeslek,KullanilanBanka from Musteriler M1 inner join Hesaplar H2
ON
M1.MusteriAdSoyad=H2.MusteriAdiSoyad

select MusteriAdSoyad,MusteriSehir,MusteriMeslek,KullanilanBanka from Musteriler M1 left outer join Hesaplar H2
ON
M1.MusteriAdSoyad=H2.MusteriAdiSoyad

select MusteriAdSoyad,MusteriSehir,MusteriMeslek,KullanilanBanka from Musteriler M1 right outer join Hesaplar H2
ON
M1.MusteriAdSoyad=H2.MusteriAdiSoyad

select MusteriAdSoyad,MusteriSehir,MusteriMeslek,KullanilanBanka from Musteriler M1 full outer join Hesaplar H2
ON
M1.MusteriAdSoyad=H2.MusteriAdiSoyad

select MusteriAdiSoyad, AVG(HesapBakiyesi) from Hesaplar where KullanilanBanka='Akbank' group by MusteriAdiSoyad 
select MusteriAdiSoyad, SUM(HesapBakiyesi) from Hesaplar group by MusteriAdiSoyad having SUM(HesapBakiyesi)>50
select MusteriAdiSoyad, max(HesapBakiyesi) from Hesaplar group by MusteriAdiSoyad having Max(HesapBakiyesi)<50
select MusteriAdiSoyad, MIN(HesapBakiyesi) from Hesaplar group by MusteriAdiSoyad having MIN(HesapBakiyesi)>50



--2 tablo arasýnda da ortak olan verileri'sutünlarý' getirir.
select	MusteriAdSoyad from Musteriler
intersect
select MusteriAdiSoyad from Hesaplar
--2 tablo arasýnda da ortak olmayan verileri'sutünlarý' getirir.
select	MusteriAdSoyad from Musteriler
except
select MusteriAdiSoyad from Hesaplar







