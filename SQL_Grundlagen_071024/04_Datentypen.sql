/*
	Datentypen in SQL: 3 Große Gruppen


	1. Charakter/String Datentypen
	char(10) = 'Hallo     ' = 10 Byte Speicherplatz
	nchar() = 1 Zeichen = 2 Byte => Verwendet UTF-16

	varchar(10) = 'Hallo' = 5 Byte Speicherplatz
	nvarchar() = 1 Zeichen = 2 Byte => Verwendet UTF-16

	Legacy: text --> mittlerweile VARCHAR(MAX) = bis zu 2GB groß
	varchar(8000) & nvarchar(4000)

	2. Numerische Datentypen
	tinyint = 8 Bit = bis 255
	smallint = 16 Bit = bis 32k
	int = 32 Bit = 2,14Mrd
	bigint = 64Bit = 9,2 Trillion ca.

	bit = 1 oder 0 => Es gibt kein Bool!

	decimal(x, y) = x Ziffern sind gesamt, davon sind y Nachkommastellen
	decimal(10, 2) = 10 Ziffern insgesamt, davon sind 2 Nachkommastellen
	money = ca. 9,2 Trillion
	smallmoney = ca. 214k 

	float(n) = bis 53
	1-24 = 7 Stellen = 4 byte
	25-53 = 15 stellen = 8 byte

	real = 4 Byte



	3. Datum / Zeit Datentypen:
	time = hh:mm:ss.nnnnnnn
	date = YYYY-MM-DD
	datetime = date + time in MS = YYYY-MM-DD hh:mm:ss.mmm
	datetime2 =  YYYY-MM-DD hh:mm:ss.nnnnnnn
	smalldatetime = YYYY-MM-DD hh:mm:ss

	Andere:
	XML
	JSON
	geometry
	geography

*/