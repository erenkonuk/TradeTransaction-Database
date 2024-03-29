
USE [Alım-Satım VT]
GO
/****** Object:  Synonym [dbo].[Borc_AlcakSyn]    Script Date: 1.06.2023 22:11:02 ******/
CREATE SYNONYM [dbo].[Borc_AlcakSyn] FOR [dbo].[Borc_Alcak]
GO
/****** Object:  Synonym [dbo].[ButceSyn]    Script Date: 1.06.2023 22:11:02 ******/
CREATE SYNONYM [dbo].[ButceSyn] FOR [dbo].[Butce]
GO
/****** Object:  Synonym [dbo].[DepolarSyn]    Script Date: 1.06.2023 22:11:02 ******/
CREATE SYNONYM [dbo].[DepolarSyn] FOR [dbo].[Depolar]
GO
/****** Object:  Synonym [dbo].[GarantiSyn]    Script Date: 1.06.2023 22:11:02 ******/
CREATE SYNONYM [dbo].[GarantiSyn] FOR [dbo].[Garanti]
GO
/****** Object:  Synonym [dbo].[IadelerSyn]    Script Date: 1.06.2023 22:11:02 ******/
CREATE SYNONYM [dbo].[IadelerSyn] FOR [dbo].[Iadeler]
GO
/****** Object:  Synonym [dbo].[MusterilerSyn]    Script Date: 1.06.2023 22:11:02 ******/
CREATE SYNONYM [dbo].[MusterilerSyn] FOR [dbo].[Musteriler]
GO
/****** Object:  Synonym [dbo].[PazarlamaFaaliyetleriSyn]    Script Date: 1.06.2023 22:11:02 ******/
CREATE SYNONYM [dbo].[PazarlamaFaaliyetleriSyn] FOR [dbo].[PazarlamaFaaliyetleri]
GO
/****** Object:  Synonym [dbo].[RaporlarSyn]    Script Date: 1.06.2023 22:11:02 ******/
CREATE SYNONYM [dbo].[RaporlarSyn] FOR [dbo].[Raporlar]
GO
/****** Object:  Synonym [dbo].[SatinalmalarSyn]    Script Date: 1.06.2023 22:11:02 ******/
CREATE SYNONYM [dbo].[SatinalmalarSyn] FOR [dbo].[Satinalmalar]
GO
/****** Object:  Synonym [dbo].[Satis_KanallariSyn]    Script Date: 1.06.2023 22:11:02 ******/
CREATE SYNONYM [dbo].[Satis_KanallariSyn] FOR [dbo].[Satis_Kanallari]
GO
/****** Object:  Synonym [dbo].[Satis_SorumlulariSyn]    Script Date: 1.06.2023 22:11:02 ******/
CREATE SYNONYM [dbo].[Satis_SorumlulariSyn] FOR [dbo].[Satis_Sorumlulari]
GO
/****** Object:  Synonym [dbo].[SatislarSyn]    Script Date: 1.06.2023 22:11:02 ******/
CREATE SYNONYM [dbo].[SatislarSyn] FOR [dbo].[Satislar]
GO
/****** Object:  Synonym [dbo].[SatisTipleriSyn]    Script Date: 1.06.2023 22:11:02 ******/
CREATE SYNONYM [dbo].[SatisTipleriSyn] FOR [dbo].[SatisTipleri]
GO
/****** Object:  Synonym [dbo].[SenaryolarSyn]    Script Date: 1.06.2023 22:11:02 ******/
CREATE SYNONYM [dbo].[SenaryolarSyn] FOR [dbo].[Senaryolar]
GO
/****** Object:  Synonym [dbo].[TahsilatlarSyn]    Script Date: 1.06.2023 22:11:02 ******/
CREATE SYNONYM [dbo].[TahsilatlarSyn] FOR [dbo].[Tahsilatlar]
GO
/****** Object:  Synonym [dbo].[TedarikcilerSyn]    Script Date: 1.06.2023 22:11:02 ******/
CREATE SYNONYM [dbo].[TedarikcilerSyn] FOR [dbo].[Tedarikciler]
GO
/****** Object:  Synonym [dbo].[Urun_GruplariSyn]    Script Date: 1.06.2023 22:11:02 ******/
CREATE SYNONYM [dbo].[Urun_GruplariSyn] FOR [dbo].[Urun_Gruplari]
GO
/****** Object:  Synonym [dbo].[UrunlerSyn]    Script Date: 1.06.2023 22:11:02 ******/
CREATE SYNONYM [dbo].[UrunlerSyn] FOR [dbo].[Urunler]
GO
/****** Object:  UserDefinedFunction [dbo].[BorcAlcakBul]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[BorcAlcakBul] (@Borc_Alcak_ID int)
RETURNS decimal
AS 
BEGIN
    DECLARE @BorcAlcakMiktari decimal;
    SELECT @BorcAlcakMiktari = Borc_Alcak_Miktari FROM Borc_Alcak WHERE Borc_Alcak_ID = @Borc_Alcak_ID;
    RETURN @BorcAlcakMiktari;
END;
GO
/****** Object:  UserDefinedFunction [dbo].[ButceBul]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ButceBul] (@Butce_ID int)
RETURNS int
AS 
BEGIN
    DECLARE @PlanlananSatisMiktari int;
    SELECT @PlanlananSatisMiktari = Planlanan_Satis_Miktari FROM Butce WHERE Butce_ID = @Butce_ID;
    RETURN @PlanlananSatisMiktari;
END;
GO
/****** Object:  UserDefinedFunction [dbo].[DepoAdiBul]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Depo ID'ye göre depo adı bulma (Scalar Function)
CREATE FUNCTION [dbo].[DepoAdiBul] (@Depo_ID int)
RETURNS nvarchar(255)
AS 
BEGIN
    DECLARE @DepoAdi nvarchar(255);
    SELECT @DepoAdi = Depo_Adi FROM Depolar WHERE Depo_ID = @Depo_ID;
    RETURN @DepoAdi;
END;

-- Depoları listeleme (Table-valued Function)

GO
/****** Object:  UserDefinedFunction [dbo].[DepoBul]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[DepoBul] (@Depo_ID int)
RETURNS nvarchar(255)
AS 
BEGIN
    DECLARE @DepoAdi nvarchar(255);
    SELECT @DepoAdi = Depo_Adi FROM Depolar WHERE Depo_ID = @Depo_ID;
    RETURN @DepoAdi;
END;
GO
/****** Object:  UserDefinedFunction [dbo].[FaaliyetBul]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[FaaliyetBul] (@Faaliyet_ID int)
RETURNS decimal
AS 
BEGIN
    DECLARE @FaaliyetButcesi decimal;
    SELECT @FaaliyetButcesi = Faaliyet_Butcesi FROM PazarlamaFaaliyetleri WHERE Faaliyet_ID = @Faaliyet_ID;
    RETURN @FaaliyetButcesi;
END;
GO
/****** Object:  UserDefinedFunction [dbo].[FiyatHesapla]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[FiyatHesapla] (@Urun_ID int)
RETURNS decimal
AS 
BEGIN
    DECLARE @Fiyat decimal;
    SELECT @Fiyat = Urun_Fiyati * Stok_Miktari FROM Urunler WHERE Urun_ID = @Urun_ID;
    RETURN @Fiyat;
END;
GO
/****** Object:  UserDefinedFunction [dbo].[GarantiBul]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GarantiBul] (@Garanti_ID int)
RETURNS date
AS 
BEGIN
    DECLARE @GarantiBitisTarihi date;
    SELECT @GarantiBitisTarihi = Garanti_Bitis_Tarihi FROM Garanti WHERE Garanti_ID = @Garanti_ID;
    RETURN @GarantiBitisTarihi;
END;
GO
/****** Object:  UserDefinedFunction [dbo].[IadeBul]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[IadeBul] (@Iade_ID int)
RETURNS int
AS 
BEGIN
    DECLARE @IadeMiktari int;
    SELECT @IadeMiktari = Iade_Miktari FROM Iadeler WHERE Iade_ID = @Iade_ID;
    RETURN @IadeMiktari;
END;
GO
/****** Object:  UserDefinedFunction [dbo].[MusteriBorcuHesapla]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[MusteriBorcuHesapla] (@Musteri_ID int)
RETURNS decimal
AS 
BEGIN
    DECLARE @Borc decimal;
    SELECT @Borc = SUM(Borc_Alcak_Miktari) FROM Borc_Alcak WHERE Musteri_ID = @Musteri_ID;
    RETURN @Borc;
END;
GO
/****** Object:  UserDefinedFunction [dbo].[RaporBul]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[RaporBul] (@Rapor_ID int)
RETURNS date
AS 
BEGIN
    DECLARE @Rapor_Tarihi date;
    SELECT @Rapor_Tarihi = Rapor_Tarihi FROM Raporlar WHERE Rapor_ID = @Rapor_ID;
    RETURN @Rapor_Tarihi;
END;
GO
/****** Object:  UserDefinedFunction [dbo].[SatinalmaBul]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SatinalmaBul] (@Satinalma_ID int)
RETURNS decimal
AS 
BEGIN
    DECLARE @ToplamFiyat decimal;
    SELECT @ToplamFiyat = Toplam_Fiyat FROM Satinalmalar WHERE Satinalma_ID = @Satinalma_ID;
    RETURN @ToplamFiyat;
END;
GO
/****** Object:  UserDefinedFunction [dbo].[SatisBul]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SatisBul] (@Satis_ID int)
RETURNS decimal
AS 
BEGIN
    DECLARE @ToplamFiyat decimal;
    SELECT @ToplamFiyat = Toplam_Fiyat FROM Satislar WHERE Satis_ID = @Satis_ID;
    RETURN @ToplamFiyat;
END;
GO
/****** Object:  UserDefinedFunction [dbo].[SatisKanaliBul]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SatisKanaliBul] (@Kanal_ID int)
RETURNS nvarchar(255)
AS 
BEGIN
    DECLARE @KanalAdi nvarchar(255);
    SELECT @KanalAdi = Kanal_Adi FROM Satis_Kanallari WHERE Kanal_ID = @Kanal_ID;
    RETURN @KanalAdi;
END;
GO
/****** Object:  UserDefinedFunction [dbo].[SatisSorumlusuBul]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SatisSorumlusuBul] (@Satis_Sorumlusu_ID int)
RETURNS nvarchar(510)
AS 
BEGIN
    DECLARE @SatisSorumlusu nvarchar(510);
    SELECT @SatisSorumlusu = Isim + ' ' + Soyisim FROM Satis_Sorumlulari WHERE Satis_Sorumlusu_ID = @Satis_Sorumlusu_ID;
    RETURN @SatisSorumlusu;
END;
GO
/****** Object:  UserDefinedFunction [dbo].[SatisTipiBul]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SatisTipiBul] (@Satis_Tipi_ID int)
RETURNS nvarchar(255)
AS 
BEGIN
    DECLARE @Satis_Tipi_Adi nvarchar(255);
    SELECT @Satis_Tipi_Adi = Satis_Tipi_Adi FROM SatisTipleri WHERE Satis_Tipi_ID = @Satis_Tipi_ID;
    RETURN @Satis_Tipi_Adi;
END;
GO
/****** Object:  UserDefinedFunction [dbo].[SatisTutariHesapla]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SatisTutariHesapla] (@Satis_ID int)
RETURNS decimal
AS 
BEGIN
    DECLARE @Tutar decimal;
    SELECT @Tutar = Toplam_Fiyat FROM Satislar WHERE Satis_ID = @Satis_ID;
    RETURN @Tutar;
END;
GO
/****** Object:  UserDefinedFunction [dbo].[SenaryoBul]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SenaryoBul] (@Senaryo_ID int)
RETURNS nvarchar(255)
AS 
BEGIN
    DECLARE @Senaryo_Adi nvarchar(255);
    SELECT @Senaryo_Adi = Senaryo_Adi FROM Senaryolar WHERE Senaryo_ID = @Senaryo_ID;
    RETURN @Senaryo_Adi;
END;
GO
/****** Object:  UserDefinedFunction [dbo].[TahsilatBul]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[TahsilatBul] (@Tahsilat_ID int)
RETURNS decimal
AS 
BEGIN
    DECLARE @TahsilatMiktari decimal;
    SELECT @TahsilatMiktari = Tahsilat_Miktari FROM Tahsilatlar WHERE Tahsilat_ID = @Tahsilat_ID;
    RETURN @TahsilatMiktari;
END;
GO
/****** Object:  UserDefinedFunction [dbo].[TedarikciAdiBul]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[TedarikciAdiBul] (@Tedarikci_ID int)
RETURNS nvarchar(255)
AS 
BEGIN
    DECLARE @TedarikciAdi nvarchar(255);
    SELECT @TedarikciAdi = Tedarikci_Adi FROM Tedarikciler WHERE Tedarikci_ID = @Tedarikci_ID;
    RETURN @TedarikciAdi;
END;
GO
/****** Object:  UserDefinedFunction [dbo].[TedarikciBul]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[TedarikciBul] (@Tedarikci_ID int)
RETURNS nvarchar(255)
AS 
BEGIN
    DECLARE @TedarikciAdi nvarchar(255);
    SELECT @TedarikciAdi = Tedarikci_Adi FROM Tedarikciler WHERE Tedarikci_ID = @Tedarikci_ID;
    RETURN @TedarikciAdi;
END;
GO
/****** Object:  UserDefinedFunction [dbo].[UrunGrubuAdiBul]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[UrunGrubuAdiBul] (@Urun_Grubu_ID int)
RETURNS nvarchar(255)
AS 
BEGIN
    DECLARE @UrunGrubuAdi nvarchar(255);
    SELECT @UrunGrubuAdi = Urun_Grubu_Adi FROM Urun_Gruplari WHERE Urun_Grubu_ID = @Urun_Grubu_ID;
    RETURN @UrunGrubuAdi;
END;
GO
/****** Object:  Table [dbo].[Musteriler]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Musteriler](
	[Musteri_ID] [int] NOT NULL,
	[Isim] [nvarchar](255) NOT NULL,
	[Soyisim] [nvarchar](255) NOT NULL,
	[Eposta] [nvarchar](255) NOT NULL,
	[Telefon_Numarasi] [nvarchar](20) NOT NULL,
	[Adres] [nvarchar](255) NOT NULL,
	[Musteri_Segmenti] [nvarchar](255) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Senaryolar]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Senaryolar](
	[Senaryo_ID] [int] NOT NULL,
	[Senaryo_Adi] [nvarchar](255) NOT NULL,
	[Senaryo_Aciklamasi] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[Musteri_Senaryo_View]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Musteri_Senaryo_View] AS
SELECT M.Musteri_ID, M.Isim, M.Soyisim, Se.Senaryo_Adi
FROM Musteriler M
CROSS JOIN Senaryolar Se;
GO
/****** Object:  Table [dbo].[Urunler]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Urunler](
	[Urun_ID] [int] NOT NULL,
	[Urun_Adi] [nvarchar](255) NOT NULL,
	[Urun_Aciklamasi] [nvarchar](max) NULL,
	[Urun_Fiyati] [decimal](18, 0) NOT NULL,
	[Stok_Miktari] [int] NOT NULL,
	[Urun_Grubu_ID] [int] NOT NULL,
	[Satis_Tipi_ID] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tedarikciler]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tedarikciler](
	[Tedarikci_ID] [int] NOT NULL,
	[Tedarikci_Adi] [nvarchar](255) NOT NULL,
	[Eposta] [nvarchar](255) NOT NULL,
	[Telefon_Numarasi] [nvarchar](20) NOT NULL,
	[Adres] [nvarchar](255) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Satinalmalar]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Satinalmalar](
	[Satinalma_ID] [int] NOT NULL,
	[Tedarikci_ID] [int] NOT NULL,
	[Urun_ID] [int] NOT NULL,
	[Depo_ID] [int] NOT NULL,
	[Satinalma_Tarihi] [date] NOT NULL,
	[Satinalma_Miktari] [int] NOT NULL,
	[Toplam_Fiyat] [decimal](18, 0) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Satislar]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Satislar](
	[Satis_ID] [int] NOT NULL,
	[Musteri_ID] [int] NOT NULL,
	[Urun_ID] [int] NOT NULL,
	[Satis_Sorumlusu_ID] [int] NOT NULL,
	[Kanal_ID] [int] NOT NULL,
	[Satis_Tarihi] [date] NOT NULL,
	[Satis_Miktari] [int] NOT NULL,
	[Toplam_Fiyat] [decimal](18, 0) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Musteri_Tedarikci_View]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Musteri_Tedarikci_View] AS
SELECT M.Musteri_ID, M.Isim, M.Soyisim, T.Tedarikci_Adi
FROM Musteriler M
FULL OUTER JOIN Satislar S ON M.Musteri_ID = S.Musteri_ID
FULL OUTER JOIN Urunler U ON S.Urun_ID = U.Urun_ID
FULL OUTER JOIN Satinalmalar SA ON U.Urun_ID = SA.Urun_ID
FULL OUTER JOIN Tedarikciler T ON SA.Tedarikci_ID = T.Tedarikci_ID;
GO
/****** Object:  View [dbo].[Satis_Tedarikci_View]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Satis_Tedarikci_View] AS
SELECT S.Satis_ID, S.Urun_ID, U.Urun_Adi, T.Tedarikci_Adi
FROM Satislar S
RIGHT OUTER JOIN Urunler U ON S.Urun_ID = U.Urun_ID
RIGHT OUTER JOIN Satinalmalar SA ON U.Urun_ID = SA.Urun_ID
RIGHT OUTER JOIN Tedarikciler T ON SA.Tedarikci_ID = T.Tedarikci_ID;
GO
/****** Object:  View [dbo].[Musteri_Satis_View]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Musteri_Satis_View] AS
SELECT M.Musteri_ID, M.Isim, M.Soyisim, S.Satis_ID, U.Urun_Adi
FROM Musteriler M
LEFT OUTER JOIN Satislar S ON M.Musteri_ID = S.Musteri_ID
LEFT OUTER JOIN Urunler U ON S.Urun_ID = U.Urun_ID;
GO
/****** Object:  View [dbo].[Satislar_Urunler_View]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Satislar_Urunler_View] AS
SELECT S.Satis_ID, S.Musteri_ID, U.Urun_Adi, S.Toplam_Fiyat
FROM Satislar S
INNER JOIN Urunler U ON S.Urun_ID = U.Urun_ID;
GO
/****** Object:  View [dbo].[Urun_Satis_Detay_View]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Urun_Satis_Detay_View] AS
SELECT U.Urun_Adi, S.Satis_ID, S.Toplam_Fiyat
FROM Urunler U
INNER JOIN Satislar S ON U.Urun_ID = S.Urun_ID
INNER JOIN Musteriler M ON S.Musteri_ID = M.Musteri_ID;
GO
/****** Object:  Table [dbo].[Satis_Sorumlulari]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Satis_Sorumlulari](
	[Satis_Sorumlusu_ID] [int] NOT NULL,
	[Isim] [nvarchar](255) NOT NULL,
	[Soyisim] [nvarchar](255) NOT NULL,
	[Eposta] [nvarchar](255) NOT NULL,
	[Telefon_Numarasi] [nvarchar](20) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Musteri_Satis_Detay_View]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Musteri_Satis_Detay_View] AS
SELECT M.Isim, M.Soyisim, S.Satis_ID, U.Urun_Adi
FROM Musteriler M
LEFT OUTER JOIN Satislar S ON M.Musteri_ID = S.Musteri_ID
LEFT OUTER JOIN Urunler U ON S.Urun_ID = U.Urun_ID
LEFT OUTER JOIN Satis_Sorumlulari SS ON S.Satis_Sorumlusu_ID = SS.Satis_Sorumlusu_ID;
GO
/****** Object:  Table [dbo].[Depolar]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Depolar](
	[Depo_ID] [int] NOT NULL,
	[Depo_Adi] [nvarchar](255) NOT NULL,
	[Depo_Adresi] [nvarchar](255) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Urun_Satinalma_Detay_View]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Urun_Satinalma_Detay_View] AS
SELECT U.Urun_Adi, SA.Satinalma_ID, T.Tedarikci_Adi, D.Depo_Adi
FROM Urunler U
RIGHT OUTER JOIN Satinalmalar SA ON U.Urun_ID = SA.Urun_ID
RIGHT OUTER JOIN Tedarikciler T ON SA.Tedarikci_ID = T.Tedarikci_ID
RIGHT OUTER JOIN Depolar D ON SA.Depo_ID = D.Depo_ID;
GO
/****** Object:  Table [dbo].[Urun_Gruplari]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Urun_Gruplari](
	[Urun_Grubu_ID] [int] NOT NULL,
	[Urun_Grubu_Adi] [nvarchar](255) NOT NULL,
	[Urun_Grubu_Aciklamasi] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[Full_Urun_Grup_View]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Full_Urun_Grup_View] AS
SELECT U.Urun_Adi, UG.Urun_Grubu_Adi
FROM Urunler U
FULL OUTER JOIN Urun_Gruplari UG ON U.Urun_Grubu_ID = UG.Urun_Grubu_ID;
GO
/****** Object:  View [dbo].[Cross_Urun_Grup_View]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Cross_Urun_Grup_View] AS
SELECT U.Urun_Adi, UG.Urun_Grubu_Adi
FROM Urunler U
CROSS JOIN Urun_Gruplari UG;
GO
/****** Object:  UserDefinedFunction [dbo].[UrunListele]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[UrunListele]()
RETURNS TABLE
AS 
RETURN
    SELECT * FROM Urunler;
GO
/****** Object:  UserDefinedFunction [dbo].[SatisListele]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SatisListele]()
RETURNS TABLE
AS 
RETURN
    SELECT * FROM Satislar;
GO
/****** Object:  UserDefinedFunction [dbo].[MusteriListele]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[MusteriListele]()
RETURNS TABLE
AS 
RETURN
    SELECT * FROM Musteriler;
GO
/****** Object:  UserDefinedFunction [dbo].[DepoListele]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[DepoListele]()
RETURNS TABLE
AS 
RETURN
    SELECT * FROM Depolar;
GO
/****** Object:  UserDefinedFunction [dbo].[TedarikciListele]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[TedarikciListele]()
RETURNS TABLE
AS 
RETURN
    SELECT * FROM Tedarikciler;
GO
/****** Object:  UserDefinedFunction [dbo].[UrunGrupListele]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[UrunGrupListele]()
RETURNS TABLE
AS 
RETURN
    SELECT * FROM Urun_Gruplari;
GO
/****** Object:  UserDefinedFunction [dbo].[SatisSorumlusuListele]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SatisSorumlusuListele]()
RETURNS TABLE
AS 
RETURN
    SELECT * FROM Satis_Sorumlulari;
GO
/****** Object:  Table [dbo].[Satis_Kanallari]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Satis_Kanallari](
	[Kanal_ID] [int] NOT NULL,
	[Kanal_Adi] [nvarchar](255) NOT NULL,
	[Kanal_Aciklamasi] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[SatisKanaliListele]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SatisKanaliListele]()
RETURNS TABLE
AS 
RETURN
    SELECT * FROM Satis_Kanallari;
GO
/****** Object:  UserDefinedFunction [dbo].[SatinalmaListele]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SatinalmaListele]()
RETURNS TABLE
AS 
RETURN
    SELECT * FROM Satinalmalar;
GO
/****** Object:  Table [dbo].[Tahsilatlar]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tahsilatlar](
	[Tahsilat_ID] [int] NOT NULL,
	[Satis_ID] [int] NOT NULL,
	[Tahsilat_Tarihi] [date] NOT NULL,
	[Tahsilat_Miktari] [decimal](18, 0) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[TahsilatListele]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[TahsilatListele]()
RETURNS TABLE
AS 
RETURN
    SELECT * FROM Tahsilatlar;
GO
/****** Object:  Table [dbo].[Garanti]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Garanti](
	[Garanti_ID] [int] NOT NULL,
	[Urun_ID] [int] NOT NULL,
	[Musteri_ID] [int] NOT NULL,
	[Garanti_Baslangic_Tarihi] [date] NOT NULL,
	[Garanti_Bitis_Tarihi] [date] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[GarantiListele]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GarantiListele]()
RETURNS TABLE
AS 
RETURN
    SELECT * FROM Garanti;
GO
/****** Object:  Table [dbo].[Iadeler]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Iadeler](
	[Iade_ID] [int] NOT NULL,
	[Satis_ID] [int] NOT NULL,
	[Iade_Tarihi] [date] NOT NULL,
	[Iade_Miktari] [int] NOT NULL,
	[Iade_Nedeni] [nvarchar](255) NULL,
	[Iade_Onayi] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[IadeListele]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[IadeListele]()
RETURNS TABLE
AS 
RETURN
    SELECT * FROM Iadeler;
GO
/****** Object:  Table [dbo].[PazarlamaFaaliyetleri]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PazarlamaFaaliyetleri](
	[Faaliyet_ID] [int] NOT NULL,
	[Faaliyet_Adi] [nvarchar](255) NOT NULL,
	[Faaliyet_Baslangic_Tarihi] [date] NOT NULL,
	[Faaliyet_Bitis_Tarihi] [date] NOT NULL,
	[Faaliyet_Kanali] [nvarchar](255) NOT NULL,
	[Hedef_Urun_Grubu] [int] NOT NULL,
	[Faaliyet_Butcesi] [decimal](18, 0) NOT NULL,
	[Gerceklestiren_Faaliyet_Miktari] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[FaaliyetListele]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[FaaliyetListele]()
RETURNS TABLE
AS 
RETURN
    SELECT * FROM PazarlamaFaaliyetleri;
GO
/****** Object:  Table [dbo].[Butce]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Butce](
	[Butce_ID] [int] NOT NULL,
	[Yil] [int] NOT NULL,
	[Ay] [int] NOT NULL,
	[Urun_Grubu] [int] NOT NULL,
	[Satis_Sorumlusu] [int] NOT NULL,
	[Planlanan_Satis_Miktari] [int] NOT NULL,
	[Gerceklestiren_Satis_Miktari] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[ButceListele]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ButceListele]()
RETURNS TABLE
AS 
RETURN
    SELECT * FROM Butce;
GO
/****** Object:  Table [dbo].[SatisTipleri]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SatisTipleri](
	[Satis_Tipi_ID] [int] NOT NULL,
	[Satis_Tipi_Adi] [nvarchar](255) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[SatisTipleriListele]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SatisTipleriListele]()
RETURNS TABLE
AS 
RETURN
    SELECT * FROM SatisTipleri;
GO
/****** Object:  UserDefinedFunction [dbo].[SenaryoListele]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[SenaryoListele]()
RETURNS TABLE
AS 
RETURN
    SELECT * FROM Senaryolar;
GO
/****** Object:  Table [dbo].[Raporlar]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Raporlar](
	[Rapor_ID] [int] NOT NULL,
	[Rapor_Adi] [nvarchar](255) NOT NULL,
	[Rapor_Tarihi] [date] NOT NULL,
	[Rapor_Tipi] [nvarchar](255) NULL,
	[Rapor_Icerigi] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[RaporListele]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[RaporListele]()
RETURNS TABLE
AS 
RETURN
    SELECT * FROM Raporlar;
GO
/****** Object:  Table [dbo].[Borc_Alcak]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Borc_Alcak](
	[Borc_Alcak_ID] [int] NOT NULL,
	[Musteri_ID] [int] NOT NULL,
	[Borc_Alcak_Miktari] [decimal](18, 0) NOT NULL,
	[Borc_Alcak_Tarihi] [date] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Borc_Alcak_Yedek]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Borc_Alcak_Yedek](
	[Borc_Alcak_ID] [int] NOT NULL,
	[Musteri_ID] [int] NOT NULL,
	[Borc_Alcak_Miktari] [decimal](18, 0) NOT NULL,
	[Borc_Alcak_Tarihi] [date] NOT NULL,
	[SistemTarihi] [datetime] NULL,
	[KaydedenKullanici] [nvarchar](255) NULL,
	[SilinmeDurumu] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Garanti_Yedek]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Garanti_Yedek](
	[Garanti_ID] [int] NOT NULL,
	[Urun_ID] [int] NOT NULL,
	[Musteri_ID] [int] NOT NULL,
	[Garanti_Baslangic_Tarihi] [date] NOT NULL,
	[Garanti_Bitis_Tarihi] [date] NOT NULL,
	[SistemTarihi] [datetime] NULL,
	[KaydedenKullanici] [nvarchar](255) NULL,
	[SilinmeDurumu] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Iadeler_Yedek]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Iadeler_Yedek](
	[Iade_ID] [int] NOT NULL,
	[Satis_ID] [int] NOT NULL,
	[Iade_Tarihi] [date] NOT NULL,
	[Iade_Miktari] [int] NOT NULL,
	[Iade_Nedeni] [nvarchar](255) NULL,
	[Iade_Onayi] [bit] NULL,
	[SistemTarihi] [datetime] NULL,
	[KaydedenKullanici] [nvarchar](255) NULL,
	[SilinmeDurumu] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Musteriler_Yedek]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Musteriler_Yedek](
	[Musteri_ID] [int] NOT NULL,
	[Isim] [nvarchar](255) NOT NULL,
	[Soyisim] [nvarchar](255) NOT NULL,
	[Eposta] [nvarchar](255) NOT NULL,
	[Telefon_Numarasi] [nvarchar](20) NOT NULL,
	[Adres] [nvarchar](255) NOT NULL,
	[Musteri_Segmenti] [nvarchar](255) NOT NULL,
	[SistemTarihi] [datetime] NULL,
	[KaydedenKullanici] [nvarchar](255) NULL,
	[SilinmeDurumu] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Raporlar_Yedek]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Raporlar_Yedek](
	[Rapor_ID] [int] NOT NULL,
	[Rapor_Adi] [nvarchar](255) NOT NULL,
	[Rapor_Tarihi] [date] NOT NULL,
	[Rapor_Tipi] [nvarchar](255) NULL,
	[Rapor_Icerigi] [nvarchar](max) NULL,
	[SistemTarihi] [datetime] NULL,
	[KaydedenKullanici] [nvarchar](255) NULL,
	[SilinmeDurumu] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Satinalmalar_Yedek]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Satinalmalar_Yedek](
	[Satinalma_ID] [int] NOT NULL,
	[Tedarikci_ID] [int] NOT NULL,
	[Urun_ID] [int] NOT NULL,
	[Depo_ID] [int] NOT NULL,
	[Satinalma_Tarihi] [date] NOT NULL,
	[Satinalma_Miktari] [int] NOT NULL,
	[Toplam_Fiyat] [decimal](18, 0) NOT NULL,
	[SistemTarihi] [datetime] NULL,
	[KaydedenKullanici] [nvarchar](255) NULL,
	[SilinmeDurumu] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Satis_Sorumlusu_Butce]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Satis_Sorumlusu_Butce](
	[Butce_ID] [int] NOT NULL,
	[Satis_Sorumlusu_ID] [int] NOT NULL,
	[Yil] [int] NOT NULL,
	[Planlanan_Miktar] [int] NOT NULL,
	[Gerceklesen_Miktar] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Satislar_Yedek]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Satislar_Yedek](
	[Satis_ID] [int] NOT NULL,
	[Musteri_ID] [int] NOT NULL,
	[Urun_ID] [int] NOT NULL,
	[Satis_Sorumlusu_ID] [int] NOT NULL,
	[Kanal_ID] [int] NOT NULL,
	[Satis_Tarihi] [date] NOT NULL,
	[Satis_Miktari] [int] NOT NULL,
	[Toplam_Fiyat] [decimal](18, 0) NOT NULL,
	[SistemTarihi] [datetime] NULL,
	[KaydedenKullanici] [nvarchar](255) NULL,
	[SilinmeDurumu] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tahsilatlar_Yedek]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tahsilatlar_Yedek](
	[Tahsilat_ID] [int] NOT NULL,
	[Satis_ID] [int] NOT NULL,
	[Tahsilat_Tarihi] [date] NOT NULL,
	[Tahsilat_Miktari] [decimal](18, 0) NOT NULL,
	[SistemTarihi] [datetime] NULL,
	[KaydedenKullanici] [nvarchar](255) NULL,
	[SilinmeDurumu] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Urun_Butce]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Urun_Butce](
	[Butce_ID] [int] NOT NULL,
	[Urun_ID] [int] NOT NULL,
	[Yil] [int] NOT NULL,
	[Planlanan_Miktar] [int] NOT NULL,
	[Gerceklesen_Miktar] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Urun_Grubu_Butce]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Urun_Grubu_Butce](
	[Butce_ID] [int] NOT NULL,
	[Urun_Grubu_ID] [int] NOT NULL,
	[Yil] [int] NOT NULL,
	[Planlanan_Miktar] [int] NOT NULL,
	[Gerceklesen_Miktar] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Urunler_Yedek]    Script Date: 1.06.2023 22:11:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Urunler_Yedek](
	[Urun_ID] [int] NOT NULL,
	[Urun_Adi] [nvarchar](255) NOT NULL,
	[Urun_Aciklamasi] [nvarchar](max) NULL,
	[Urun_Fiyati] [decimal](18, 0) NOT NULL,
	[Stok_Miktari] [int] NOT NULL,
	[Urun_Grubu_ID] [int] NOT NULL,
	[Satis_Tipi_ID] [int] NOT NULL,
	[SistemTarihi] [datetime] NULL,
	[KaydedenKullanici] [nvarchar](255) NULL,
	[SilinmeDurumu] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Musteriler] ([Musteri_ID], [Isim], [Soyisim], [Eposta], [Telefon_Numarasi], [Adres], [Musteri_Segmenti]) VALUES (1, N'Eren', N'Konuk', N'erenkonuk@gmail.com', N'123456789', N'123 ABC Street', N'Segment1')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Depolar__F395B53F4ED06E10]    Script Date: 1.06.2023 22:11:03 ******/
ALTER TABLE [dbo].[Depolar] ADD UNIQUE NONCLUSTERED 
(
	[Depo_Adi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Musteril__03ABA39105163359]    Script Date: 1.06.2023 22:11:03 ******/
ALTER TABLE [dbo].[Musteriler] ADD UNIQUE NONCLUSTERED 
(
	[Eposta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Musteril__FB5F8DAC7194A4FC]    Script Date: 1.06.2023 22:11:03 ******/
ALTER TABLE [dbo].[Musteriler] ADD UNIQUE NONCLUSTERED 
(
	[Telefon_Numarasi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,  IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Musteril__03ABA391BA2DE3AD]    Script Date: 1.06.2023 22:11:03 ******/
ALTER TABLE [dbo].[Musteriler_Yedek] ADD UNIQUE NONCLUSTERED 
(
	[Eposta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Musteril__FB5F8DACE4417F8E]    Script Date: 1.06.2023 22:11:03 ******/
ALTER TABLE [dbo].[Musteriler_Yedek] ADD UNIQUE NONCLUSTERED 
(
	[Telefon_Numarasi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,  IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Pazarlam__0CD336541DB2CFA5]    Script Date: 1.06.2023 22:11:03 ******/
ALTER TABLE [dbo].[PazarlamaFaaliyetleri] ADD UNIQUE NONCLUSTERED 
(
	[Faaliyet_Adi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Raporlar__BDB175131F80EFFE]    Script Date: 1.06.2023 22:11:03 ******/
ALTER TABLE [dbo].[Raporlar] ADD UNIQUE NONCLUSTERED 
(
	[Rapor_Adi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Raporlar__BDB17513184A6953]    Script Date: 1.06.2023 22:11:03 ******/
ALTER TABLE [dbo].[Raporlar_Yedek] ADD UNIQUE NONCLUSTERED 
(
	[Rapor_Adi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,  IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Satis_Ka__6BBA084505524CAA]    Script Date: 1.06.2023 22:11:03 ******/
ALTER TABLE [dbo].[Satis_Kanallari] ADD UNIQUE NONCLUSTERED 
(
	[Kanal_Adi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Satis_So__03ABA391362A86A0]    Script Date: 1.06.2023 22:11:03 ******/
ALTER TABLE [dbo].[Satis_Sorumlulari] ADD UNIQUE NONCLUSTERED 
(
	[Eposta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,  IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Satis_So__FB5F8DACE9696591]    Script Date: 1.06.2023 22:11:03 ******/
ALTER TABLE [dbo].[Satis_Sorumlulari] ADD UNIQUE NONCLUSTERED 
(
	[Telefon_Numarasi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__SatisTip__F96C5FB5CE368AE1]    Script Date: 1.06.2023 22:11:03 ******/
ALTER TABLE [dbo].[SatisTipleri] ADD UNIQUE NONCLUSTERED 
(
	[Satis_Tipi_Adi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,  IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Senaryol__FA22B8CCE294DECE]    Script Date: 1.06.2023 22:11:03 ******/
ALTER TABLE [dbo].[Senaryolar] ADD UNIQUE NONCLUSTERED 
(
	[Senaryo_Adi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Tedarikc__03ABA39196B1B173]    Script Date: 1.06.2023 22:11:03 ******/
ALTER TABLE [dbo].[Tedarikciler] ADD UNIQUE NONCLUSTERED 
(
	[Eposta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Tedarikc__FB5F8DAC2F645740]    Script Date: 1.06.2023 22:11:03 ******/
ALTER TABLE [dbo].[Tedarikciler] ADD UNIQUE NONCLUSTERED 
(
	[Telefon_Numarasi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Urun_Gru__3F37A8F52968AAE3]    Script Date: 1.06.2023 22:11:03 ******/
ALTER TABLE [dbo].[Urun_Gruplari] ADD UNIQUE NONCLUSTERED 
(
	[Urun_Grubu_Adi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Borc_Alcak] ADD  DEFAULT (getdate()) FOR [Borc_Alcak_Tarihi]
GO
ALTER TABLE [dbo].[Borc_Alcak_Yedek] ADD  DEFAULT (getdate()) FOR [Borc_Alcak_Tarihi]
GO
ALTER TABLE [dbo].[Butce] ADD  DEFAULT ((0)) FOR [Gerceklestiren_Satis_Miktari]
GO
ALTER TABLE [dbo].[Garanti] ADD  DEFAULT (getdate()) FOR [Garanti_Baslangic_Tarihi]
GO
ALTER TABLE [dbo].[Garanti_Yedek] ADD  DEFAULT (getdate()) FOR [Garanti_Baslangic_Tarihi]
GO
ALTER TABLE [dbo].[Iadeler] ADD  DEFAULT (getdate()) FOR [Iade_Tarihi]
GO
ALTER TABLE [dbo].[Iadeler] ADD  DEFAULT ((0)) FOR [Iade_Onayi]
GO
ALTER TABLE [dbo].[Iadeler_Yedek] ADD  DEFAULT (getdate()) FOR [Iade_Tarihi]
GO
ALTER TABLE [dbo].[Iadeler_Yedek] ADD  DEFAULT ((0)) FOR [Iade_Onayi]
GO
ALTER TABLE [dbo].[PazarlamaFaaliyetleri] ADD  DEFAULT ((0)) FOR [Gerceklestiren_Faaliyet_Miktari]
GO
ALTER TABLE [dbo].[Raporlar] ADD  DEFAULT (getdate()) FOR [Rapor_Tarihi]
GO
ALTER TABLE [dbo].[Raporlar_Yedek] ADD  DEFAULT (getdate()) FOR [Rapor_Tarihi]
GO
ALTER TABLE [dbo].[Satinalmalar] ADD  DEFAULT (getdate()) FOR [Satinalma_Tarihi]
GO
ALTER TABLE [dbo].[Satinalmalar_Yedek] ADD  DEFAULT (getdate()) FOR [Satinalma_Tarihi]
GO
ALTER TABLE [dbo].[Satis_Sorumlusu_Butce] ADD  DEFAULT ((0)) FOR [Gerceklesen_Miktar]
GO
ALTER TABLE [dbo].[Satislar] ADD  DEFAULT (getdate()) FOR [Satis_Tarihi]
GO
ALTER TABLE [dbo].[Satislar_Yedek] ADD  DEFAULT (getdate()) FOR [Satis_Tarihi]
GO
ALTER TABLE [dbo].[Tahsilatlar] ADD  DEFAULT (getdate()) FOR [Tahsilat_Tarihi]
GO
ALTER TABLE [dbo].[Tahsilatlar_Yedek] ADD  DEFAULT (getdate()) FOR [Tahsilat_Tarihi]
GO
ALTER TABLE [dbo].[Urun_Butce] ADD  DEFAULT ((0)) FOR [Gerceklesen_Miktar]
GO
ALTER TABLE [dbo].[Urun_Grubu_Butce] ADD  DEFAULT ((0)) FOR [Gerceklesen_Miktar]
GO
ALTER TABLE [dbo].[Urunler] ADD  DEFAULT ((0)) FOR [Stok_Miktari]
GO
ALTER TABLE [dbo].[Urunler_Yedek] ADD  DEFAULT ((0)) FOR [Stok_Miktari]
GO
ALTER TABLE [dbo].[Borc_Alcak]  WITH CHECK ADD FOREIGN KEY([Musteri_ID])
REFERENCES [dbo].[Musteriler] ([Musteri_ID])
GO
ALTER TABLE [dbo].[Butce]  WITH CHECK ADD FOREIGN KEY([Satis_Sorumlusu])
REFERENCES [dbo].[Satis_Sorumlulari] ([Satis_Sorumlusu_ID])
GO
ALTER TABLE [dbo].[Butce]  WITH CHECK ADD FOREIGN KEY([Urun_Grubu])
REFERENCES [dbo].[Urun_Gruplari] ([Urun_Grubu_ID])
GO
ALTER TABLE [dbo].[Garanti]  WITH CHECK ADD FOREIGN KEY([Musteri_ID])
REFERENCES [dbo].[Musteriler] ([Musteri_ID])
GO
ALTER TABLE [dbo].[Garanti]  WITH CHECK ADD FOREIGN KEY([Urun_ID])
REFERENCES [dbo].[Urunler] ([Urun_ID])
GO
ALTER TABLE [dbo].[Iadeler]  WITH CHECK ADD FOREIGN KEY([Satis_ID])
REFERENCES [dbo].[Satislar] ([Satis_ID])
GO
ALTER TABLE [dbo].[Satinalmalar]  WITH CHECK ADD FOREIGN KEY([Depo_ID])
REFERENCES [dbo].[Depolar] ([Depo_ID])
GO
ALTER TABLE [dbo].[Satinalmalar]  WITH CHECK ADD FOREIGN KEY([Tedarikci_ID])
REFERENCES [dbo].[Tedarikciler] ([Tedarikci_ID])
GO
ALTER TABLE [dbo].[Satinalmalar]  WITH CHECK ADD FOREIGN KEY([Urun_ID])
REFERENCES [dbo].[Urunler] ([Urun_ID])
GO
ALTER TABLE [dbo].[Satis_Sorumlusu_Butce]  WITH CHECK ADD FOREIGN KEY([Satis_Sorumlusu_ID])
REFERENCES [dbo].[Satis_Sorumlulari] ([Satis_Sorumlusu_ID])
GO
ALTER TABLE [dbo].[Satislar]  WITH CHECK ADD FOREIGN KEY([Kanal_ID])
REFERENCES [dbo].[Satis_Kanallari] ([Kanal_ID])
GO
ALTER TABLE [dbo].[Satislar]  WITH CHECK ADD FOREIGN KEY([Musteri_ID])
REFERENCES [dbo].[Musteriler] ([Musteri_ID])
GO
ALTER TABLE [dbo].[Satislar]  WITH CHECK ADD FOREIGN KEY([Satis_Sorumlusu_ID])
REFERENCES [dbo].[Satis_Sorumlulari] ([Satis_Sorumlusu_ID])
GO
ALTER TABLE [dbo].[Satislar]  WITH CHECK ADD FOREIGN KEY([Urun_ID])
REFERENCES [dbo].[Urunler] ([Urun_ID])
GO
ALTER TABLE [dbo].[Tahsilatlar]  WITH CHECK ADD FOREIGN KEY([Satis_ID])
REFERENCES [dbo].[Satislar] ([Satis_ID])
GO
ALTER TABLE [dbo].[Urun_Butce]  WITH CHECK ADD FOREIGN KEY([Urun_ID])
REFERENCES [dbo].[Urunler] ([Urun_ID])
GO
ALTER TABLE [dbo].[Urun_Grubu_Butce]  WITH CHECK ADD FOREIGN KEY([Urun_Grubu_ID])
REFERENCES [dbo].[Urun_Gruplari] ([Urun_Grubu_ID])
GO
ALTER TABLE [dbo].[Butce]  WITH CHECK ADD CHECK  (([Planlanan_Satis_Miktari]>=(0)))
GO
ALTER TABLE [dbo].[Iadeler]  WITH CHECK ADD CHECK  (([Iade_Miktari]>(0)))
GO
ALTER TABLE [dbo].[Iadeler_Yedek]  WITH CHECK ADD CHECK  (([Iade_Miktari]>(0)))
GO
ALTER TABLE [dbo].[PazarlamaFaaliyetleri]  WITH CHECK ADD CHECK  (([Faaliyet_Butcesi]>(0)))
GO
ALTER TABLE [dbo].[Satinalmalar]  WITH CHECK ADD CHECK  (([Satinalma_Miktari]>(0)))
GO
ALTER TABLE [dbo].[Satinalmalar_Yedek]  WITH CHECK ADD CHECK  (([Satinalma_Miktari]>(0)))
GO
ALTER TABLE [dbo].[Satis_Sorumlusu_Butce]  WITH CHECK ADD CHECK  (([Planlanan_Miktar]>=(0)))
GO
ALTER TABLE [dbo].[Satislar]  WITH CHECK ADD CHECK  (([Satis_Miktari]>(0)))
GO
ALTER TABLE [dbo].[Satislar_Yedek]  WITH CHECK ADD CHECK  (([Satis_Miktari]>(0)))
GO
ALTER TABLE [dbo].[Tahsilatlar]  WITH CHECK ADD CHECK  (([Tahsilat_Miktari]>(0)))
GO
ALTER TABLE [dbo].[Tahsilatlar_Yedek]  WITH CHECK ADD CHECK  (([Tahsilat_Miktari]>(0)))
GO
ALTER TABLE [dbo].[Urun_Butce]  WITH CHECK ADD CHECK  (([Planlanan_Miktar]>=(0)))
GO
ALTER TABLE [dbo].[Urun_Grubu_Butce]  WITH CHECK ADD CHECK  (([Planlanan_Miktar]>=(0)))
GO
ALTER TABLE [dbo].[Urunler]  WITH CHECK ADD CHECK  (([Urun_Fiyati]>(0)))
GO
ALTER TABLE [dbo].[Urunler_Yedek]  WITH CHECK ADD CHECK  (([Urun_Fiyati]>(0)))
GO
/****** Object:  StoredProcedure [dbo].[Borc_Alcak_Ekle]    Script Date: 1.06.2023 22:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Borc_Alcak_Ekle]
    @Musteri_ID int,
    @Borc_Alcak_Miktari decimal
AS
BEGIN
    INSERT INTO Borc_Alcak (Musteri_ID, Borc_Alcak_Miktari)
    VALUES (@Musteri_ID, @Borc_Alcak_Miktari)
END;
GO
/****** Object:  StoredProcedure [dbo].[Borc_Alcak_Guncelle]    Script Date: 1.06.2023 22:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Borc_Alcak_Guncelle]
    @Borc_Alcak_ID int,
    @Musteri_ID int,
    @Borc_Alcak_Miktari decimal
AS
BEGIN
    UPDATE Borc_Alcak
    SET Musteri_ID = @Musteri_ID, Borc_Alcak_Miktari = @Borc_Alcak_Miktari
    WHERE Borc_Alcak_ID = @Borc_Alcak_ID
END;
GO
/****** Object:  StoredProcedure [dbo].[Borc_Alcak_Sil]    Script Date: 1.06.2023 22:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Borc_Alcak_Sil]
    @Borc_Alcak_ID int
AS
BEGIN
    DELETE FROM Borc_Alcak WHERE Borc_Alcak_ID = @Borc_Alcak_ID
END;
GO
/****** Object:  StoredProcedure [dbo].[Butce_Ekle]    Script Date: 1.06.2023 22:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Butce_Ekle]
    @Yil int,
    @Ay int,
    @Urun_Grubu int,
    @Satis_Sorumlusu int,
    @Planlanan_Satis_Miktari int
AS
BEGIN
    INSERT INTO Butce (Yil, Ay, Urun_Grubu, Satis_Sorumlusu, Planlanan_Satis_Miktari)
    VALUES (@Yil, @Ay, @Urun_Grubu, @Satis_Sorumlusu, @Planlanan_Satis_Miktari)
END;
GO
/****** Object:  StoredProcedure [dbo].[Butce_Guncelle]    Script Date: 1.06.2023 22:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Butce_Guncelle]
    @Butce_ID int,
    @Yil int,
    @Ay int,
    @Urun_Grubu int,
    @Satis_Sorumlusu int,
    @Planlanan_Satis_Miktari int
AS
BEGIN
    UPDATE Butce
    SET Yil = @Yil, Ay = @Ay, Urun_Grubu = @Urun_Grubu, Satis_Sorumlusu = @Satis_Sorumlusu, Planlanan_Satis_Miktari = @Planlanan_Satis_Miktari
    WHERE Butce_ID = @Butce_ID
END;
GO
/****** Object:  StoredProcedure [dbo].[Butce_Sil]    Script Date: 1.06.2023 22:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Butce_Sil]
    @Butce_ID int
AS
BEGIN
    DELETE FROM Butce WHERE Butce_ID = @Butce_ID
END;
GO
/****** Object:  StoredProcedure [dbo].[Depo_Ekle]    Script Date: 1.06.2023 22:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Depo_Ekle]
    @Depo_Adi nvarchar(255),
    @Depo_Adresi nvarchar(255)
AS
BEGIN
    INSERT INTO Depolar (Depo_Adi, Depo_Adresi)
    VALUES (@Depo_Adi, @Depo_Adresi)
END;
GO
/****** Object:  StoredProcedure [dbo].[Depo_Guncelle]    Script Date: 1.06.2023 22:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Depo_Guncelle]
    @Depo_ID int,
    @Depo_Adi nvarchar(255),
    @Depo_Adresi nvarchar(255)
AS
BEGIN
    UPDATE Depolar
    SET Depo_Adi = @Depo_Adi, Depo_Adresi = @Depo_Adresi
    WHERE Depo_ID = @Depo_ID
END;
GO
/****** Object:  StoredProcedure [dbo].[Depo_Sil]    Script Date: 1.06.2023 22:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Depo_Sil]
    @Depo_ID int
AS
BEGIN
    DELETE FROM Depolar WHERE Depo_ID = @Depo_ID
END;
GO
/****** Object:  StoredProcedure [dbo].[Garanti_Ekle]    Script Date: 1.06.2023 22:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Garanti_Ekle]
    @Urun_ID int,
    @Musteri_ID int,
    @Garanti_Bitis_Tarihi date
AS
BEGIN
    INSERT INTO Garanti (Urun_ID, Musteri_ID, Garanti_Bitis_Tarihi)
    VALUES (@Urun_ID, @Musteri_ID, @Garanti_Bitis_Tarihi)
END;
GO
/****** Object:  StoredProcedure [dbo].[Garanti_Guncelle]    Script Date: 1.06.2023 22:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Garanti_Guncelle]
    @Garanti_ID int,
    @Urun_ID int,
    @Musteri_ID int,
    @Garanti_Bitis_Tarihi date
AS
BEGIN
    UPDATE Garanti
    SET Urun_ID = @Urun_ID, Musteri_ID = @Musteri_ID, Garanti_Bitis_Tarihi = @Garanti_Bitis_Tarihi
    WHERE Garanti_ID = @Garanti_ID
END;
GO
/****** Object:  StoredProcedure [dbo].[Garanti_Sil]    Script Date: 1.06.2023 22:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Garanti_Sil]
    @Garanti_ID int
AS
BEGIN
    DELETE FROM Garanti WHERE Garanti_ID = @Garanti_ID
END;
GO
/****** Object:  StoredProcedure [dbo].[Iade_Ekle]    Script Date: 1.06.2023 22:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Iade_Ekle]
    @Satis_ID int,
    @Iade_Miktari int,
    @Iade_Nedeni nvarchar(255),
    @Iade_Onayi bit
AS
BEGIN
    INSERT INTO Iadeler (Satis_ID, Iade_Miktari, Iade_Nedeni, Iade_Onayi)
    VALUES (@Satis_ID, @Iade_Miktari, @Iade_Nedeni, @Iade_Onayi)
END;
GO
/****** Object:  StoredProcedure [dbo].[Iade_Guncelle]    Script Date: 1.06.2023 22:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Iade_Guncelle]
    @Iade_ID int,
    @Satis_ID int,
    @Iade_Miktari int,
    @Iade_Nedeni nvarchar(255),
    @Iade_Onayi bit
AS
BEGIN
 UPDATE Iadeler
    SET Satis_ID = @Satis_ID, Iade_Miktari = @Iade_Miktari, Iade_Nedeni = @Iade_Nedeni, Iade_Onayi = @Iade_Onayi
    WHERE Iade_ID = @Iade_ID
END;
GO
/****** Object:  StoredProcedure [dbo].[Iade_Sil]    Script Date: 1.06.2023 22:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Iade_Sil]
    @Iade_ID int
AS
BEGIN
    DELETE FROM Iadeler WHERE Iade_ID = @Iade_ID
END;
GO
/****** Object:  StoredProcedure [dbo].[MusteriEkle]    Script Date: 1.06.2023 22:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MusteriEkle]
    @Isim nvarchar(255),
    @Soyisim nvarchar(255),
    @Eposta nvarchar(255),
    @Telefon_Numarasi nvarchar(20),
    @Adres nvarchar(255),
    @Musteri_Segmenti nvarchar(255)
AS
BEGIN
    INSERT INTO Musteriler(Isim, Soyisim, Eposta, Telefon_Numarasi, Adres, Musteri_Segmenti)
    VALUES (@Isim, @Soyisim, @Eposta, @Telefon_Numarasi, @Adres, @Musteri_Segmenti);
END;
GO
/****** Object:  StoredProcedure [dbo].[MusteriGuncelle]    Script Date: 1.06.2023 22:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MusteriGuncelle]
    @Musteri_ID int,
    @Isim nvarchar(255),
    @Soyisim nvarchar(255),
    @Eposta nvarchar(255),
    @Telefon_Numarasi nvarchar(20),
    @Adres nvarchar(255),
    @Musteri_Segmenti nvarchar(255)
AS
BEGIN
    UPDATE Musteriler
    SET Isim = @Isim, 
        Soyisim = @Soyisim,
        Eposta = @Eposta,
        Telefon_Numarasi = @Telefon_Numarasi,
        Adres = @Adres,
        Musteri_Segmenti = @Musteri_Segmenti
    WHERE Musteri_ID = @Musteri_ID;
END;
GO
/****** Object:  StoredProcedure [dbo].[MusteriSil]    Script Date: 1.06.2023 22:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MusteriSil]
    @Musteri_ID int
AS
BEGIN
    DELETE FROM Musteriler WHERE Musteri_ID = @Musteri_ID;
END;
GO
/****** Object:  StoredProcedure [dbo].[PazarlamaFaaliyeti_Ekle]    Script Date: 1.06.2023 22:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PazarlamaFaaliyeti_Ekle]
    @Faaliyet_Adi nvarchar(255),
    @Faaliyet_Baslangic_Tarihi date,
    @Faaliyet_Bitis_Tarihi date,
    @Faaliyet_Kanali nvarchar(255),
    @Hedef_Urun_Grubu int,
    @Faaliyet_Butcesi decimal
AS
BEGIN
    INSERT INTO PazarlamaFaaliyetleri (Faaliyet_Adi, Faaliyet_Baslangic_Tarihi, Faaliyet_Bitis_Tarihi, Faaliyet_Kanali, Hedef_Urun_Grubu, Faaliyet_Butcesi)
    VALUES (@Faaliyet_Adi, @Faaliyet_Baslangic_Tarihi, @Faaliyet_Bitis_Tarihi, @Faaliyet_Kanali, @Hedef_Urun_Grubu, @Faaliyet_Butcesi)
END;
GO
/****** Object:  StoredProcedure [dbo].[PazarlamaFaaliyeti_Guncelle]    Script Date: 1.06.2023 22:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PazarlamaFaaliyeti_Guncelle]
    @Faaliyet_ID int,
    @Faaliyet_Adi nvarchar(255),
    @Faaliyet_Baslangic_Tarihi date,
    @Faaliyet_Bitis_Tarihi date,
    @Faaliyet_Kanali nvarchar(255),
    @Hedef_Urun_Grubu int,
    @Faaliyet_Butcesi decimal
AS
BEGIN
    UPDATE PazarlamaFaaliyetleri
    SET Faaliyet_Adi = @Faaliyet_Adi, Faaliyet_Baslangic_Tarihi = @Faaliyet_Baslangic_Tarihi, Faaliyet_Bitis_Tarihi = @Faaliyet_Bitis_Tarihi, Faaliyet_Kanali = @Faaliyet_Kanali, Hedef_Urun_Grubu = @Hedef_Urun_Grubu, Faaliyet_Butcesi = @Faaliyet_Butcesi
    WHERE Faaliyet_ID = @Faaliyet_ID
END;
GO
/****** Object:  StoredProcedure [dbo].[PazarlamaFaaliyeti_Sil]    Script Date: 1.06.2023 22:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PazarlamaFaaliyeti_Sil]
    @Faaliyet_ID int
AS
BEGIN
    DELETE FROM PazarlamaFaaliyetleri WHERE Faaliyet_ID = @Faaliyet_ID
END;
GO
/****** Object:  StoredProcedure [dbo].[Rapor_Ekle]    Script Date: 1.06.2023 22:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Rapor_Ekle]
    @Rapor_Adi nvarchar(255),
    @Rapor_Tipi nvarchar(255),
    @Rapor_Icerigi nvarchar(max)
AS
BEGIN
    INSERT INTO Raporlar (Rapor_Adi, Rapor_Tipi, Rapor_Icerigi)
    VALUES (@Rapor_Adi, @Rapor_Tipi, @Rapor_Icerigi)
END;
GO
/****** Object:  StoredProcedure [dbo].[Rapor_Guncelle]    Script Date: 1.06.2023 22:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Rapor_Guncelle]
    @Rapor_ID int,
    @Rapor_Adi nvarchar(255),
    @Rapor_Tipi nvarchar(255),
    @Rapor_Icerigi nvarchar(max)
AS
BEGIN
    UPDATE Raporlar
    SET Rapor_Adi = @Rapor_Adi, Rapor_Tipi = @Rapor_Tipi, Rapor_Icerigi = @Rapor_Icerigi
    WHERE Rapor_ID = @Rapor_ID
END;
GO
/****** Object:  StoredProcedure [dbo].[Rapor_Sil]    Script Date: 1.06.2023 22:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Rapor_Sil]
    @Rapor_ID int
AS
BEGIN
    DELETE FROM Raporlar WHERE Rapor_ID = @Rapor_ID
END;
GO
/****** Object:  StoredProcedure [dbo].[Satinalma_Ekle]    Script Date: 1.06.2023 22:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Satinalma_Ekle]
    @Tedarikci_ID int,
    @Urun_ID int,
    @Depo_ID int,
    @Satinalma_Miktari int,
    @Toplam_Fiyat decimal
AS
BEGIN
    INSERT INTO Satinalmalar (Tedarikci_ID, Urun_ID, Depo_ID, Satinalma_Miktari, Toplam_Fiyat)
    VALUES (@Tedarikci_ID, @Urun_ID, @Depo_ID, @Satinalma_Miktari, @Toplam_Fiyat)
END;
GO
/****** Object:  StoredProcedure [dbo].[Satinalma_Guncelle]    Script Date: 1.06.2023 22:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Satinalma_Guncelle]
    @Satinalma_ID int,
    @Tedarikci_ID int,
    @Urun_ID int,
    @Depo_ID int,
    @Satinalma_Miktari int,
@Toplam_Fiyat decimal
AS
BEGIN
    UPDATE Satinalmalar
    SET Tedarikci_ID = @Tedarikci_ID, Urun_ID = @Urun_ID, Depo_ID = @Depo_ID, Satinalma_Miktari = @Satinalma_Miktari, Toplam_Fiyat = @Toplam_Fiyat
    WHERE Satinalma_ID = @Satinalma_ID
END;
GO
/****** Object:  StoredProcedure [dbo].[Satinalma_Sil]    Script Date: 1.06.2023 22:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Satinalma_Sil]
    @Satinalma_ID int
AS
BEGIN
    DELETE FROM Satinalmalar WHERE Satinalma_ID = @Satinalma_ID
END;
GO
/****** Object:  StoredProcedure [dbo].[Satis_Ekle]    Script Date: 1.06.2023 22:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Satis_Ekle]
    @Musteri_ID int,
    @Urun_ID int,
    @Satis_Sorumlusu_ID int,
    @Kanal_ID int,
    @Satis_Miktari int,
    @Toplam_Fiyat decimal
AS
BEGIN
    INSERT INTO Satislar (Musteri_ID, Urun_ID, Satis_Sorumlusu_ID, Kanal_ID, Satis_Miktari, Toplam_Fiyat)
    VALUES (@Musteri_ID, @Urun_ID, @Satis_Sorumlusu_ID, @Kanal_ID, @Satis_Miktari, @Toplam_Fiyat)
END;
GO
/****** Object:  StoredProcedure [dbo].[Satis_Guncelle]    Script Date: 1.06.2023 22:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Satis_Guncelle]
    @Satis_ID int,
    @Musteri_ID int,
    @Urun_ID int,
    @Satis_Sorumlusu_ID int,
    @Kanal_ID int,
    @Satis_Miktari int,
    @Toplam_Fiyat decimal
AS
BEGIN
    UPDATE Satislar
    SET Musteri_ID = @Musteri_ID, Urun_ID = @Urun_ID, Satis_Sorumlusu_ID = @Satis_Sorumlusu_ID, Kanal_ID = @Kanal_ID, Satis_Miktari = @Satis_Miktari, Toplam_Fiyat = @Toplam_Fiyat
    WHERE Satis_ID = @Satis_ID
END;
GO
/****** Object:  StoredProcedure [dbo].[Satis_Kanali_Ekle]    Script Date: 1.06.2023 22:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Satis_Kanali_Ekle]
    @Kanal_Adi nvarchar(255),
    @Kanal_Aciklamasi nvarchar(max)
AS
BEGIN
    INSERT INTO Satis_Kanallari (Kanal_Adi, Kanal_Aciklamasi)
    VALUES (@Kanal_Adi, @Kanal_Aciklamasi)
END;
GO
/****** Object:  StoredProcedure [dbo].[Satis_Kanali_Guncelle]    Script Date: 1.06.2023 22:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Satis_Kanali_Guncelle]
    @Kanal_ID int,
    @Kanal_Adi nvarchar(255),
    @Kanal_Aciklamasi nvarchar(max)
AS
BEGIN
    UPDATE Satis_Kanallari
    SET Kanal_Adi = @Kanal_Adi, Kanal_Aciklamasi = @Kanal_Aciklamasi
    WHERE Kanal_ID = @Kanal_ID
END;
GO
/****** Object:  StoredProcedure [dbo].[Satis_Kanali_Sil]    Script Date: 1.06.2023 22:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Satis_Kanali_Sil]
    @Kanal_ID int
AS
BEGIN
    DELETE FROM Satis_Kanallari WHERE Kanal_ID = @Kanal_ID
END;
GO
/****** Object:  StoredProcedure [dbo].[Satis_Sil]    Script Date: 1.06.2023 22:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Satis_Sil]
    @Satis_ID int
AS
BEGIN
    DELETE FROM Satislar WHERE Satis_ID = @Satis_ID
END;
GO
/****** Object:  StoredProcedure [dbo].[Satis_Sorumlusu_Ekle]    Script Date: 1.06.2023 22:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Satis_Sorumlusu_Ekle]
    @Isim nvarchar(255),
    @Soyisim nvarchar(255),
    @Eposta nvarchar(255),
    @Telefon_Numarasi nvarchar(20)
AS
BEGIN
    INSERT INTO Satis_Sorumlulari (Isim, Soyisim, Eposta, Telefon_Numarasi)
    VALUES (@Isim, @Soyisim, @Eposta, @Telefon_Numarasi)
END;

GO
/****** Object:  StoredProcedure [dbo].[Satis_Sorumlusu_Guncelle]    Script Date: 1.06.2023 22:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Satis_Sorumlusu_Guncelle]
    @Satis_Sorumlusu_ID int,
    @Isim nvarchar(255),
    @Soyisim nvarchar(255),
    @Eposta nvarchar(255),
    @Telefon_Numarasi nvarchar(20)
AS
BEGIN
    UPDATE Satis_Sorumlulari
    SET Isim = @Isim, Soyisim = @Soyisim, Eposta = @Eposta, Telefon_Numarasi = @Telefon_Numarasi
    WHERE Satis_Sorumlusu_ID = @Satis_Sorumlusu_ID
END;
GO
/****** Object:  StoredProcedure [dbo].[Satis_Sorumlusu_Sil]    Script Date: 1.06.2023 22:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Satis_Sorumlusu_Sil]
    @Satis_Sorumlusu_ID int
AS
BEGIN
    DELETE FROM Satis_Sorumlulari WHERE Satis_Sorumlusu_ID = @Satis_Sorumlusu_ID
END;
GO
/****** Object:  StoredProcedure [dbo].[SatisTipi_Ekle]    Script Date: 1.06.2023 22:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SatisTipi_Ekle]
    @Satis_Tipi_Adi nvarchar(255)
AS
BEGIN
    INSERT INTO SatisTipleri (Satis_Tipi_Adi)
    VALUES (@Satis_Tipi_Adi)
END;
GO
/****** Object:  StoredProcedure [dbo].[SatisTipi_Guncelle]    Script Date: 1.06.2023 22:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SatisTipi_Guncelle]
    @Satis_Tipi_ID int,
    @Satis_Tipi_Adi nvarchar(255)
AS
BEGIN
    UPDATE SatisTipleri
    SET Satis_Tipi_Adi = @Satis_Tipi_Adi
    WHERE Satis_Tipi_ID = @Satis_Tipi_ID
END;
GO
/****** Object:  StoredProcedure [dbo].[SatisTipi_Sil]    Script Date: 1.06.2023 22:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SatisTipi_Sil]
    @Satis_Tipi_ID int
AS
BEGIN
    DELETE FROM SatisTipleri WHERE Satis_Tipi_ID = @Satis_Tipi_ID
END;
GO
/****** Object:  StoredProcedure [dbo].[Senaryo_Ekle]    Script Date: 1.06.2023 22:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Senaryo_Ekle]
    @Senaryo_Adi nvarchar(255),
    @Senaryo_Aciklamasi nvarchar(max)
AS
BEGIN
    INSERT INTO Senaryolar (Senaryo_Adi, Senaryo_Aciklamasi)
    VALUES (@Senaryo_Adi, @Senaryo_Aciklamasi)
END;
GO
/****** Object:  StoredProcedure [dbo].[Senaryo_Guncelle]    Script Date: 1.06.2023 22:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Senaryo_Guncelle]
    @Senaryo_ID int,
    @Senaryo_Adi nvarchar(255),
    @Senaryo_Aciklamasi nvarchar(max)
AS
BEGIN
    UPDATE Senaryolar
    SET Senaryo_Adi = @Senaryo_Adi, Senaryo_Aciklamasi = @Senaryo_Aciklamasi
    WHERE Senaryo_ID = @Senaryo_ID
END;
GO
/****** Object:  StoredProcedure [dbo].[Senaryo_Sil]    Script Date: 1.06.2023 22:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Senaryo_Sil]
    @Senaryo_ID int
AS
BEGIN
    DELETE FROM Senaryolar WHERE Senaryo_ID = @Senaryo_ID
END;
GO
/****** Object:  StoredProcedure [dbo].[Tahsilat_Ekle]    Script Date: 1.06.2023 22:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Tahsilat_Ekle]
    @Satis_ID int,
    @Tahsilat_Miktari decimal
AS
BEGIN
    INSERT INTO Tahsilatlar (Satis_ID, Tahsilat_Miktari)
    VALUES (@Satis_ID, @Tahsilat_Miktari)
END;
GO
/****** Object:  StoredProcedure [dbo].[Tahsilat_Guncelle]    Script Date: 1.06.2023 22:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Tahsilat_Guncelle]
    @Tahsilat_ID int,
    @Satis_ID int,
    @Tahsilat_Miktari decimal
AS
BEGIN
    UPDATE Tahsilatlar
    SET Satis_ID = @Satis_ID, Tahsilat_Miktari = @Tahsilat_Miktari
    WHERE Tahsilat_ID = @Tahsilat_ID
END;
GO
/****** Object:  StoredProcedure [dbo].[Tahsilat_Sil]    Script Date: 1.06.2023 22:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Tahsilat_Sil]
    @Tahsilat_ID int
AS
BEGIN
    DELETE FROM Tahsilatlar WHERE Tahsilat_ID = @Tahsilat_ID
END;
GO
/****** Object:  StoredProcedure [dbo].[Tedarikci_Ekle]    Script Date: 1.06.2023 22:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Tedarikci_Ekle]
    @Tedarikci_Adi nvarchar(255),
    @Eposta nvarchar(255),
    @Telefon_Numarasi nvarchar(20),
    @Adres nvarchar(255)
AS
BEGIN
    INSERT INTO Tedarikciler (Tedarikci_Adi, Eposta, Telefon_Numarasi, Adres)
    VALUES (@Tedarikci_Adi, @Eposta, @Telefon_Numarasi, @Adres)
END;


GO
/****** Object:  StoredProcedure [dbo].[Tedarikci_Guncelle]    Script Date: 1.06.2023 22:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Tedarikci_Guncelle]
    @Tedarikci_ID int,
    @Tedarikci_Adi nvarchar(255),
    @Eposta nvarchar(255),
    @Telefon_Numarasi nvarchar(20),
    @Adres nvarchar(255)
AS
BEGIN
    UPDATE Tedarikciler
    SET Tedarikci_Adi = @Tedarikci_Adi, Eposta = @Eposta, Telefon_Numarasi = @Telefon_Numarasi, Adres = @Adres
    WHERE Tedarikci_ID = @Tedarikci_ID
END;
GO
/****** Object:  StoredProcedure [dbo].[Tedarikci_Sil]    Script Date: 1.06.2023 22:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Tedarikci_Sil]
    @Tedarikci_ID int
AS
BEGIN
    DELETE FROM Tedarikciler WHERE Tedarikci_ID = @Tedarikci_ID
END;
GO
/****** Object:  StoredProcedure [dbo].[Urun_Ekle]    Script Date: 1.06.2023 22:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Urun_Ekle]
    @Urun_Adi nvarchar(255),
    @Urun_Aciklamasi nvarchar(max),
    @Urun_Fiyati decimal,
    @Stok_Miktari int = 0,
    @Urun_Grubu_ID int,
    @Satis_Tipi_ID int
AS
BEGIN
    INSERT INTO Urunler (Urun_Adi, Urun_Aciklamasi, Urun_Fiyati, Stok_Miktari, Urun_Grubu_ID, Satis_Tipi_ID)
    VALUES (@Urun_Adi, @Urun_Aciklamasi, @Urun_Fiyati, @Stok_Miktari, @Urun_Grubu_ID, @Satis_Tipi_ID)
END;
GO
/****** Object:  StoredProcedure [dbo].[Urun_Grubu_Ekle]    Script Date: 1.06.2023 22:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Urun_Grubu_Ekle]
    @Urun_Grubu_Adi nvarchar(255),
    @Urun_Grubu_Aciklamasi nvarchar(max)
AS
BEGIN
    INSERT INTO Urun_Gruplari (Urun_Grubu_Adi, Urun_Grubu_Aciklamasi)
    VALUES (@Urun_Grubu_Adi, @Urun_Grubu_Aciklamasi)
END;
GO
/****** Object:  StoredProcedure [dbo].[Urun_Grubu_Guncelle]    Script Date: 1.06.2023 22:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Urun_Grubu_Guncelle]
    @Urun_Grubu_ID int,
    @Urun_Grubu_Adi nvarchar(255),
    @Urun_Grubu_Aciklamasi nvarchar(max)
AS
BEGIN
    UPDATE Urun_Gruplari
    SET Urun_Grubu_Adi = @Urun_Grubu_Adi, Urun_Grubu_Aciklamasi = @Urun_Grubu_Aciklamasi
    WHERE Urun_Grubu_ID = @Urun_Grubu_ID
END;
GO
/****** Object:  StoredProcedure [dbo].[Urun_Grubu_Sil]    Script Date: 1.06.2023 22:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Urun_Grubu_Sil]
    @Urun_Grubu_ID int
AS
BEGIN
    DELETE FROM Urun_Gruplari WHERE Urun_Grubu_ID = @Urun_Grubu_ID
END;
GO
/****** Object:  StoredProcedure [dbo].[Urun_Guncelle]    Script Date: 1.06.2023 22:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Urun_Guncelle]
    @Urun_ID int,
    @Urun_Adi nvarchar(255),
    @Urun_Aciklamasi nvarchar(max),
    @Urun_Fiyati decimal,
    @Stok_Miktari int,
    @Urun_Grubu_ID int,
    @Satis_Tipi_ID int
AS
BEGIN
    UPDATE Urunler
    SET Urun_Adi = @Urun_Adi, Urun_Aciklamasi = @Urun_Aciklamasi, Urun_Fiyati = @Urun_Fiyati, 
    Stok_Miktari = @Stok_Miktari, Urun_Grubu_ID = @Urun_Grubu_ID, Satis_Tipi_ID = @Satis_Tipi_ID
    WHERE Urun_ID = @Urun_ID
END;
GO
/****** Object:  StoredProcedure [dbo].[Urun_Sil]    Script Date: 1.06.2023 22:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Urun_Sil]
    @Urun_ID int
AS
BEGIN
    DELETE FROM Urunler WHERE Urun_ID = @Urun_ID
END;

GO
