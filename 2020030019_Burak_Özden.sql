create schema Kutuphane;
use kutuphane;


create table uye(
uye_no int auto_increment,
uye_adı varchar(15),
uye_soyadı varchar(15),
cinsiyet varchar(5),
maıl_adres varchar(35),
dogum_tarihi date,
uyelik_tarihi date,
primary key(uye_no)
);

select * from uye;
insert into uye (uye_adı,uye_soyadı,cinsiyet,maıl_adres,dogum_tarihi,uyelik_tarihi)
	values
	("Chris","Hemsworth","Erkek","ChrisHemsworth@gmail.com",str_to_date('23-11-1980','%d-%m-%Y'),str_to_date('12-07-2021','%d-%m-%Y')),
	("Erkan","Petekkaya","Erkek","ErkanPetekkaya@gmail.com",str_to_date('25-08-1954','%d-%m-%Y'),str_to_date('04-11-20220','%d-%m-%Y')),
	("Furkan","Er","Erkek","FurkanEr@gmail.com",str_to_date('26-03-1979','%d-%m-%Y'),str_to_date('05-06-2016','%d-%m-%Y')),
	("Muhammed","Kodalak","Erkek","MuhammedKodalak@gmail.com",str_to_date('29-01-1963','%d-%m-%Y'),str_to_date('12-04-2019','%d-%m-%Y')),
	("Serdar","Aktolga","Erkek","SerdarAktolga@gmail.com",str_to_date('11-12-1997','%d-%m-%Y'),str_to_date('24-12-2014','%d-%m-%Y')),
	("Selana","Gomez","Kadın","SelanaGomez@gmail.com",str_to_date('16-02-1999','%d-%m-%Y'),str_to_date('25-03-2013','%d-%m-%Y')),
	("Leonardo","Dicaprio","ErkekLeonardo","Dicaprio@gmail.com",str_to_date('21-01-1989','%d-%m-%Y'),str_to_date('11-02-2020','%d-%m-%Y')),
	("Brie","Larson","Kadın","BrieLarson@gmail.com",str_to_date('24-07-1998','%d-%m-%Y'),str_to_date('30-11-2014','%d-%m-%Y')),
	("Elizabeth","Olsen","Kadın","ElizabethOlsen@gmail.com",str_to_date('30-05-2001','%d-%m-%Y'),str_to_date('07-04-2015','%d-%m-%Y')),
	("Scarlett","Johansson","KadınScarlett","ScarlettJohansson@gmail.com",str_to_date('26-08-2000','%d-%m-%Y'),str_to_date('29-09-2021','%d-%m-%Y')),
	("Arda","Yüksel","Erkek","ArdaYüksel@gmail.com",str_to_date('25-04-2002','%d-%m-%Y'),str_to_date('15-07-2020','%d-%m-%Y')),
	("Hande","Kalkan","Kadın","HandeKalkan@gmail.com",str_to_date('10-11-2000','%d-%m-%Y'),str_to_date('26-11-2018','%d-%m-%Y')),
	("Gamze","Üstün","Kadın","GamzeÜstün@gmail.com",str_to_date('12-01-1994','%d-%m-%Y'),str_to_date('12-08-2017','%d-%m-%Y')),
	("Orhan","Ova","Erkek","OrhanOva@gmail.com",str_to_date('14-06-1985','%d-%m-%Y'),str_to_date('18-02-2015','%d-%m-%Y')),
	("Feyza","Yayla","Kadın","FeyzaYayla@gmail.com",str_to_date('02-04-1956','%d-%m-%Y'),str_to_date('05-04-2021','%d-%m-%Y'));


create table log_uye(
uye_no int,
uye_adı varchar(15),
uye_soyadı varchar(15),
cinsiyet varchar(5),
maıl_adres varchar(35),
dogum_tarihi date,
uyelik_tarihi date,
log_islem VARCHAR(30),
log_tarih VARCHAR(20)
);


DELIMITER //
CREATE TRIGGER uye_After AFTER UPDATE
ON uye
FOR EACH ROW
BEGIN
  INSERT INTO 
 log_uye 
 (uye_no, uye_adı, uye_soyadı, cinsiyet,maıl_adres,dogum_tarihi,uyelik_tarihi,log_islem, log_tarih)
 VALUES 
 (NEW.uye_no, NEW.uye_adı, NEW.uye_soyadı, NEW.cinsiyet,NEW.maıl_adres,NEW.dogum_tarihi,NEW.uyelik_tarihi,
 'UPDATE SONRA', NOW());

END//
DELIMITER ;


select * from log_uye;
UPDATE `kutuphane`.`uye` SET `dogum_tarihi` = '1980-10-23' WHERE (`uye_no` = '1');
UPDATE `kutuphane`.`uye` SET `maıl_adres` = 'Furkan_Er@gmail.com' WHERE (`uye_no` = '3');
UPDATE `kutuphane`.`uye` SET `maıl_adres` = 'Leo_Dicaprio@gmail.com' WHERE (`uye_no` = '7');




create table kayıt (
kayıt_no int auto_increment,
uye_no int,
kitap_no int,
a_tarihi date,
t_tarihi date,
primary key(kayıt_no)
);

select * from kayıt;
insert into kayıt(kayıt_no,uye_no,kitap_no,a_tarihi,t_tarihi)
	values(301,1,1,str_to_date('10-06-2021','%d-%m-%Y'),str_to_date('15-06-2021','%d-%m-%Y'));
insert into kayıt(uye_no,kitap_no,a_tarihi,t_tarihi) 
	values
		(2,2,str_to_date('10-07-2021','%d-%m-%Y'),str_to_date('15-08-2021','%d-%m-%Y')),
		(3,3,str_to_date('10-07-2021','%d-%m-%Y'),str_to_date('15-08-2021','%d-%m-%Y')),
		(4,4,str_to_date('17-07-2021','%d-%m-%Y'),str_to_date('20-08-2021','%d-%m-%Y')),
		(5,5,str_to_date('16-07-2021','%d-%m-%Y'),str_to_date('21-08-2021','%d-%m-%Y')),
		(6,6,str_to_date('15-07-2021','%d-%m-%Y'),str_to_date('22-08-2021','%d-%m-%Y')),
		(7,7,str_to_date('14-07-2021','%d-%m-%Y'),str_to_date('23-08-2021','%d-%m-%Y')),
		(8,8,str_to_date('13-07-2021','%d-%m-%Y'),str_to_date('24-08-2021','%d-%m-%Y')),
		(9,9,str_to_date('12-07-2021','%d-%m-%Y'),str_to_date('25-08-2021','%d-%m-%Y')),
		(10,10,str_to_date('11-07-2021','%d-%m-%Y'),str_to_date('26-08-2021','%d-%m-%Y'));



DELIMITER //
CREATE PROCEDURE SakliYordam_kayıt()
BEGIN
	select kitap.kitap_adi, tur.tur_adi 
	from kitap
	INNER JOIN tur on kitap.tur_no = tur.tur_no;
END//
DELIMITER ;

call saklıyordam_kayıt;	


DROP PROCEDURE SakliYordam_kayıt;





create table kitap(	
kitap_no int auto_increment,
isbn_no varchar(13),
kitap_adi varchar(40),
satış_adet int,
yayın_no int,
yazar_no int,
tur_no int,
sayfa_sayisi int,
primary key(kitap_no)
);

select * from kitap;
insert into kitap (isbn_no,kitap_adi,satış_adet,yayın_no,yazar_no,tur_no,sayfa_sayisi)
	values
        ("9786257650588","Yıldız Tozu","2400","50","70","120","256"),
		("9786056862427","Mutluluk Beyinde Başlar","4530","51","71","121","344"),
		("9789754735567","Sevgi İle Yaşamak Farkına Varmaktır","11250","52","72","122","143"),
		("9789754735581","Çözüm Kişisel Gelişim","14240","53","73","123","160"),
		("9789754735574","Yarınlar Kimin","54240","54","74","124","203"),
		("9789754738858","Ümmühanın İstikbal Yıldızı","5430","55","75","125","124"),
		("9786057649416","Birim ","3730","56","76","126","254"),
		("9786053757818","Fahrenheit 451","8970","57","77","127","208"),
		("9786053757764","Artemis","84230","58","78","128","344"),
		("9786053758358","Bu Ölümsüz","14500","59","79","129","184"),
		("9786052314104","Fırtınaya Karşı","15400","60","80","130","222"),
		("9789754685091","Sırlar Kitabı","10000","61","81","126","256"),
		("9786052994054","Hayır Demenin Gücü","12500","62","82","126","240"),
		("9789754688115","Modern Beynin Evrimi","16900","63","83","131","271"),
		("9786052361450","Ikigai","19800","64","84","132","176"),
		("9789752430990","Bir Ömür Nasıl Yaşanır?","17000","65","85","133","288"),
		("9786056949500","Bilinçaltının Gücü","32500","66","86","126","288"),
		("9786053117308","Hayat Cesurlara Torpil Geçer","25000","67","87","126","256"),
		("9786052361610","Dönüşüm","12000","67","88","125","96"),
		("9786052361696","Bilinmeyen Bir Kadının Mektubu","8500","64","89","123","63"),
		("9786053600138","Beyaz Diş","14500","56","78","125","258"),
		("9789750719387","Hayvan Çiftliği","30000","62","89","132","152"),
		("9786053117728","Var mısın ki Yok Olmaktan Korkuyorsun?","13250","63","85","135","120"),
		("9789750731792","Mai ve Siyah Günümüz Türkçesiyle","7000","58","81","132","336"),
		("9786051715513","Kara Delikler","11000","66","82","134","75");


create table kitap_log(	
kitap_no int ,
isbn_no varchar(13),
kitap_adi varchar(40),
satış_adet int,
yayın_no int,
yazar_no int,
tur_no int,
sayfa_sayisi int,
log_islem VARCHAR(30),
log_tarih VARCHAR(20)
);


DELIMITER //
CREATE TRIGGER kitap_After AFTER UPDATE
ON kitap
FOR EACH ROW
BEGIN
  INSERT INTO 
 kitap_log 
 (kitap_no, isbn_no, kitap_adi, satış_adet, yayın_no,yazar_no,tur_no,sayfa_sayisi,log_islem, log_tarih)
 VALUES 
 (NEW.kitap_no, NEW.isbn_no, NEW.kitap_adi, NEW.satış_adet, NEW.yayın_no,NEW.yazar_no,NEW.tur_no,NEW.sayfa_sayisi,
 'UPDATE SONRA', NOW());

END//
DELIMITER ;


select * from kitap_log;
UPDATE `kutuphane`.`kitap` SET `satış_adet` = '12000' WHERE (`kitap_no` = '3');
UPDATE `kutuphane`.`kitap` SET `isbn_no` = '9789754735525' WHERE (`kitap_no` = '3');
UPDATE `kutuphane`.`kitap` SET `sayfa_sayisi` = '126' WHERE (`kitap_no` = '6');






create table yayınevi(
yayın_no int auto_increment,
yayınevi_adı varchar(30),
primary key (yayın_no)
);

select * from yayınevi;
insert into yayınevi values (50,"ketebe yayınları");
insert into yayınevi (yayınevi_adı)
	values 
			("Arkadya Yayınları"),
			("Toprak Kitap"),
			("Kum Kitap"),
			("Taş Kitap"),
			("Beyan Yayıncılık"),
			("nemesis kitap"),
			("ithaki yayınları"),
			("mediacat kitapları"),
			("omega"),
			("pegasus yayınları"),
			("indigo kitap"),
			("kronik kitap"),
			("diyojen yayıncılık"),
			("destek yayınları"),
			("iş bankası kültür yayınları"),
			("can yayınları"),
			("alfa yayınları");
									
									

create table yazar(
yazar_no int auto_increment,
yazar_adı varchar(15),
yazar_soyadı varchar(15),
primary key (yazar_no)
);

select * from yazar;
insert into yazar values (70,"Daniel","Gilbert");
insert into yazar (yazar_adı,yazar_soyadı)
	Values
		("Priscille","Sibley"),
		("Nuri","Gökalp"),
		("Franz","Kafka"),
		("Stefan ","Zweig"),
		("Jack","London"),
		("George ","Orwell"),
		("Deniz","Şimşek"),
		("Ray","Bradbury"),
		("Andy","Weir"),
		("Marshall","Goldsmith"),
		("Deepak","Chopra"),
		("James","Altucher"),
		("Gary","Small"),
		("Hector","Garcia"),
		("İlber","Ortaylı"),
		("Joseph","Murphy"),
		("Bircan","Yıldırım"),
		("El","Farabi"),
		("Halid Ziya","Uşaklıgil");


create table tur(
tur_no int auto_increment,
tur_adi varchar(15),
primary key(tur_no)
);

select * from tur;
insert into tur values (120,"Sağlık Başvuru");
insert into tur (tur_adi) 
	values
		("Roman"),
		("Mizah"),
		("Edebiyat"),
		("Korku"),
		("Şiir"),
		("Kişisel Gelişim"),
		("Ticaret"),
		("Girişimcilik"),
		("Eğitim"),
		("İş Dünyası "),
		("Genel Felsefe "),
		("Meditasyon "),
		("E-Ticaret"),
		("Klasik Romanlar"),
		("Popüler Bilim");




ALTER TABLE kutuphane.kayıt ADD CONSTRAINT fk_key_kayıt foreign key(uye_no) REFERENCES uye(uye_no);
ALTER TABLE kutuphane.kitap ADD CONSTRAINT fk_key_kitap foreign key(tur_no) REFERENCES tur(tur_no);


ALTER TABLE kutuphane.kayıt ADD CONSTRAINT fk_key_kayıt_kitap foreign key(kitap_no) REFERENCES kitap(kitap_no);
ALTER TABLE kutuphane.kitap ADD CONSTRAINT fk_key_kitap_yazar foreign key(yazar_no) REFERENCES yazar(yazar_no);
ALTER TABLE kutuphane.kitap ADD CONSTRAINT fk_key_kitap_yayınevi foreign key(yayın_no) REFERENCES yayınevi(yayın_no);



DELIMITER //
CREATE TRIGGER bir_kitap_eklendi BEFORE INSERT
ON kitap
FOR EACH ROW
BEGIN
  INSERT INTO kitap(kitap_adi) VALUES(CONCAT(NEW.kitap_adi, ' eklendi.'));
END//
DELIMITER ;


DELIMITER //
CREATE TRIGGER bir_uye_kaydoldu BEFORE INSERT
ON uye
FOR EACH ROW
BEGIN
  INSERT INTO uye(uye_adı) VALUES(CONCAT(NEW.uye_adı, ' eklendi.'));
END//
DELIMITER ;


DELIMITER $$
CREATE FUNCTION uye_bilgi(uye_id int)
RETURNS varchar(50)
DETERMINISTIC
BEGIN
	DECLARE uye_adı varchar(25);
    select ad INTO uye_adı from uye where uye_id=uye_id;
    return uye_adı;
END
$$ DELIMITER ;


DELIMITER $$
CREATE FUNCTION kitap_satıs(k int)
RETURNS int
DETERMINISTIC
BEGIN
	DECLARE satış_adet int;
    SELECT sum(adet) INTO satış_adet from kitap  where k=uye_adı;
    RETURN satış_adet;
END
$$ DELIMITER ;



#-------------------------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------------------------


#Kitabı Ödünç alan öğrencinin adı ve aldığı tarih görüntülenmektedir.
select kitap.kitap_adi,kayıt.uye_no,kayıt.a_tarihi
FROM kitap
JOIN kayıt ON kitap.kitap_no=kayıt.kitap_no;


#Kitapların hangi tür olduğu gösteriliyor.
create or replace VIEW kitap_ve_tur as
select kitap.kitap_adi, tur.tur_adi 
from kitap
INNER JOIN tur on kitap.tur_no = tur.tur_no;
select * from kitap_ve_tur;

#Kitapların yazarı ve türü gösteriliyor.
create VIEW kitap_yazar_tur  as
select kitap.kitap_adi, yazar.yazar_adı, yazar.yazar_soyadı, tur.tur_adi from kitap 
INNER JOIN yazar on kitap.yazar_no = yazar.yazar_no
INNER JOIN tur on kitap.tur_no = tur.tur_no;
select * from kitap_yazar_tur;


#isbn nosu ile kitabın adı ve yayınevi görüntüleniyor.
create or replace VIEW isbn_yayınevi as
select kitap.isbn_no , kitap.kitap_adi, yayınevi.yayınevi_adı from kitap
INNER JOIN yayınevi on kitap.yayın_no = yayınevi.yayın_no;
select * from isbn_yayınevi;

create or replace VIEW uye_kayıtno as
select kayıt.kayıt_no ,uye.uye_adı ,uye.uye_soyadı from kayıt
INNER JOIN uye on kayıt.uye_no = uye.uye_no;
select * from uye_kayıtno;

#Tüm Özellikler
SELECT * FROM kutuphane.kitap LEFT JOIN kutuphane.yayınevi ON
kitap.yayın_no=kitap.yayın_no;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# ÜYE TABLOSU  ---   ÜYE TABLOSU   ---   ÜYE TABLOSU   ---   ÜYE TABLOSU   ---    ÜYE TABLOSU   ---   ÜYE TABLOSU   ---   ÜYE TABLOSU   ---   ÜYE TABLOSU   ---   ÜYE TABLOSU    ---ÜYE TABLOSU
#Kitap ,yazar adı,ve tür bilgilerini getirir.
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
select kitap.kitap_adi,yazar.yazar_adı,yazar.yazar_soyadı,tur.tur_adi
FROM kitap
INNER JOIN kutuphane.yazar ON kitap.kitap_no = yazar.yazar_no
INNER JOIN kutuphane.tur ON kitap.tur_no = tur.tur_no;


# Cinsiyeti erkek olanların kayıtları listelenmiştir.
select * from uye where cinsiyet="erkek";


# İstenilen tarihte kayıt olan uyeler listelenmiştir.
select * from uye where uyelik_tarihi=str_to_date('30-11-2014','%d-%m-%Y');

# Üye adlarını alfabetik sıraya göre sıralar.
SELECT * FROM kutuphane.uye ORDER BY uye_adı;

# İstenilen uyeye ait bilgileri getirir.
select * from kutuphane.uye where uye_adı="Furkan" and uye_soyadı="Er";




#   KAYIT TABLOSU   ---   KAYIT TABLOSU   ---   KAYIT TABLOSU   ---   KAYIT TABLOSU   ---   KAYIT TABLOSU   ---   KAYIT TABLOSU   ---   KAYIT TABLOSU   ---   KAYIT TABLOSU   ---   KAYIT TABLOSU   ---
#Kitabı Ödünç alan öğrencinin adı ve aldığı tarih görüntülenmektedir.
select kitap.kitap_adi,kayıt.uye_no,kayıt.a_tarihi
FROM kitap
JOIN kayıt ON kitap.kitap_no=kayıt.kitap_no;


# Belirtilen tarihte alınan kitaplar listelenmiştir.
select * from kayıt where a_tarihi=str_to_date('10-07-2021','%d-%m-%Y')  ;

# Belirtilen tarihte kaç adet kitap alındığı görüntülenmektedir.
SELECT count(kayıt_no) FROM kutuphane.kayıt WHERE a_tarihi=str_to_date('10-06-2021','%d-%m-%Y') ;

#xxxxxxxxxxxxxxxxxxx
SELECT kutuphane.kitap FROM kitap 
INNER JOIN kayıt  ON
kitap.kitap_no = kayıt.kitap_no;
#xxxxxxxxxxxxxxxxxxxxx
SELECT * FROM kitap C INNER JOIN kayıt E ON
C.kitap_no=E.kitap_no INNER JOIN yayınevi
I ON I.yayınevi_adı=C.yayınevi_adı;


#Özellikler
SELECT * FROM kutuphane.yayınevi LEFT JOIN kutuphane.kitap ON
yayınevi.yayın_no=yayınevi.yayın_no;


#   KİTAP TABLOSU   ---   KİTAP TABLOSU   ---   KİTAP TABLOSU   ---   KİTAP TABLOSU   ---   KİTAP TABLOSU   ---   KİTAP TABLOSU   ---   KİTAP TABLOSU   ---   KİTAP TABLOSU   ---   KİTAP TABLOSU   ---



#Kitaplar ve türleri listelenmiştir.
create or replace VIEW kitap_türü as
select kitap.kitap_adi, tur.tur_adi 
from kitap
INNER JOIN tur on kitap.tur_no = tur.tur_no;

select * from kitap_türü;

#Kitapların yazarları ve türleri listelenmiştir.
create VIEW kitap_yazar_tür  as
select kitap.kitap_adi, yazar.yazar_adı, yazar.yazar_soyadı, tur.tur_adi from kitap 
INNER JOIN yazar on kitap.yazar_no = yazar.yazar_no
INNER JOIN tur on kitap.tur_no = tur.tur_no;
select * from kitap_yazar_tür;
	
#Kitapların sayfa sayısını verir.
create VIEW kitap_sayfa as select kitap_adi,sayfa_sayisi from kitap;
select * from kitap_sayfa;

# Hangi yazarın kaç tane kitap yazdığı görüntülenmektedir.
select yazar_no, count(*) as kitap_adı from kutuphane.kitap group by yazar_no;

# 56 nolu Yayınevinin kaç tane kitabı olduğu göstermektedir.
select count(kitap_adi) from kutuphane.kitap where yayın_no = "56";	

# Belirtilen aralığa ait kitap satışlarını listeler.
select * from kutuphane.kitap where satış_adet BETWEEN 5000 and 50000;

# "Kişisel Gelişim" türündeki kitapları listeler.
select * from kitap where tur_no in (select tur_no from tur where tur_adi="Kişisel Gelişim") ;
select * from kayıt kitap where tur_no="126";

