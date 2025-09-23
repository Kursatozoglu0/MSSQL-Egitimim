--Basit bir uygulama 3 tablolu Deneyen ve ayn� sonu�lara ula�an herkese ba�ar�lar dilerim.

use [Banka Uygulamas�] 


select * from Musteriler
select * from Hesaplar
select * from Islemler

alter table Hesaplar add KullanilanBanka varchar(30);	
alter table musteriler drop column maas;
alter table Hesaplar alter column HesapBakiyesi decimal; --bu komut tablodaki veritipinin ad�n� de�i�tirir.

insert into Musteriler values (13,'Adem Al�k','Trabzon','Memur')
insert into Hesaplar values (11,'Asl� Kuru','Vadeli',72,'Akbank')
insert into Islemler values (5,'Asl� Kuru','10.07.2025')


select * from Musteriler where MusteriMeslek='Memur'
select * from Musteriler where MusteriMeslek='Memur' and MusteriSehir='K�r�ehir'
select * from Musteriler where MusteriMeslek='Futbolcu' or MusteriSehir='K�r�ehir'
select * from musteriler where MusteriSehir in('Sivas','Ankara')

select * from Hesaplar where HesapTuru like'%Y_%'
select musteriAdSoyad,MusteriMeslek from Musteriler;
select distinct MusteriMeslek from Musteriler

select * from Musteriler order by MusteriAdSoyad asc;
select * from Musteriler order by MusteriMeslek desc;

--2 de�er aras�ndaki veriyi listeler
select * from Hesaplar where HesapBakiyesi between 85000 or 100000;
select UPPER(MusteriAdSoyad) as 'M��teri Ad Soyad B�y�k Harf' from Musteriler
select lower(MusteriAdSoyad) as 'M��teri Ad Soyad k���k Harf' from Musteriler

select SUM(HesapBakiyesi) as 'Toplam Maa�' from Hesaplar 
select MAX(HesapBakiyesi) as 'En Y�ksek Maa�' from Hesaplar group by HesapBakiyesi
select Min(HesapBakiyesi) as 'En D���k Maa�' from Hesaplar group by HesapBakiyesi
select AVG(HesapBakiyesi) as 'Maa� Ortalamas�' from Hesaplar
select count(MusteriID) FROM Musteriler
select top(7) * from Musteriler

select MusteriSehir,COUNT(MusteriSehir) as 'Hangi �ehirde Ka� M��teri Var' from Musteriler group by MusteriSehir;
select MusteriSehir,COUNT(MusteriSehir) as 'Hangi �ehirde Ka� M��teri Var' from Musteriler group by MusteriSehir order by MusteriSehir DESC;

SELECT KullanilanBanka,min(HesapBakiyesi) as 'En d���k Maa�l� Ki�i',
MAX (HesapBakiyesi) as 'En Y�ksek modelli ara� markas�' 
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



--2 tablo aras�nda da ortak olan verileri'sut�nlar�' getirir.
select	MusteriAdSoyad from Musteriler
intersect
select MusteriAdiSoyad from Hesaplar
--2 tablo aras�nda da ortak olmayan verileri'sut�nlar�' getirir.
select	MusteriAdSoyad from Musteriler
except
select MusteriAdiSoyad from Hesaplar







