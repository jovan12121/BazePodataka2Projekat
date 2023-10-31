
CREATE TRIGGER PopravkaTriger
ON Popravka	
INSTEAD OF INSERT 
AS 
BEGIN 
	IF ((SELECT COUNT(*) from inserted i join Dovezen on i.DovezenId = Dovezen.DovezenId join Obucen on Obucen.ObucenId = i.ObucenId where Obucen.VrstaPopravkeId = Dovezen.VrstaPopravkeId)=0 or EXISTS (SELECT 1 FROM INSERTED WHERE Datum > GETDATE()))
	BEGIN
		RAISERROR ('INSERTION ERROR',16,1);
		ROLLBACK TRANSACTION;
		RETURN;
	END;
	INSERT INTO Popravka(Datum,Cena,ObucenId,DovezenId)
	SELECT Datum,Cena,ObucenId,DovezenId
	FROM inserted;
END

CREATE TRIGGER MesecniIzvestajTrigger
ON MesecniIzvestaj
INSTEAD OF INSERT
AS 
BEGIN 
DECLARE @TabelaZaUnos TABLE
(	Mesec INT,
    Godina INT,
	Prihodi DECIMAL(18, 2),
	Troskovi DECIMAL(18, 2),
    Saldo DECIMAL(18, 2),
    UkupniSaldo DECIMAL(18, 2),
    RadnikId INT
);
INSERT INTO @TabelaZaUnos(Mesec, Godina, Prihodi, Troskovi, Saldo, UkupniSaldo, RadnikId)
    SELECT
        Mesec,
        Godina,
        Prihodi,
        Troskovi,
        Saldo,
        UkupniSaldo,
        RadnikId
    FROM inserted;
IF (SELECT COUNT(*) FROM @TabelaZaUnos WHERE Saldo <> Prihodi - Troskovi) != 0 
BEGIN 
	UPDATE @TabelaZaUnos 
	SET Saldo = Prihodi - Troskovi
	WHERE Saldo <> Prihodi - Troskovi
END

INSERT INTO MesecniIzvestaj(Mesec, Godina, Prihodi, Troskovi, Saldo, UkupniSaldo, RadnikId)
SELECT Mesec, Godina, Prihodi, Troskovi, Saldo, UkupniSaldo, RadnikId
FROM @TabelaZaUnos;

END

CREATE Function [dbo].[InformacijeOPopravkama](@vlasnikId INT)
RETURNS TABLE 
AS 
RETURN 
(
	SELECT CONCAT(r.Ime,' ',r.Prezime) AS 'Automehanicar' ,VrstaPopravke.Naziv as 'Naziv popravke',Automobil.Proizvodjac as 'Proizvodjac automobila',Automobil.Model as 'Model autombila',Cena as 'Cena' ,Datum as 'Datum'
	FROM Popravka left join Obucen on Popravka.ObucenId = Obucen.ObucenId left join Dovezen on Popravka.DovezenId = Dovezen.DovezenId left join Automobil on Dovezen.AutomobilId = Automobil.AutomobilId left join Automehanicar on Obucen.RadnikId = Automehanicar.RadnikId left join Radnik r on r.RadnikId = Automehanicar.RadnikId left join VrstaPopravke on Dovezen.VrstaPopravkeId = VrstaPopravke.VrstaPopravkeId
	WHERE Automobil.VlasnikId=@vlasnikId and Datum >=DATEADD(month,-3,GetDate())
);

CREATE FUNCTION UkupniPrihodiOdPopravkiZaOdrenjeniMesecIServis(@servisId INT,@mesecId INT)
RETURNS DECIMAL 
AS 
BEGIN
	DECLARE @RetVal DECIMAL;
	SET @RetVal = (SELECT SUM(CENA) FROM Popravka  join Obucen on Popravka.ObucenId = Obucen.ObucenId  join Automehanicar on Automehanicar.RadnikId = Obucen.RadnikId  join Radnik on Automehanicar.RadnikId = Radnik.RadnikId
	WHERE Radnik.ServisId = @servisId and MONTH(Popravka.Datum)=@mesecId)
	RETURN @RetVal
END 


CREATE PROCEDURE [dbo].[DodajPutneTroskove]
    @servisID INT,
    @putniTroskovi INT
AS
BEGIN
    UPDATE Radnik
    SET Plata = Plata + @putniTroskovi
    WHERE ServisID = @servisID and Radnik.MestoId!=(Select MestoId from Servis where ServisId=@servisID);
	DECLARE @brojRadnikaZaPovecanje INT= (SELECT COUNT(RadnikId) From radnik WHERE ServisID = @servisID and Radnik.MestoId!=(Select MestoId from Servis where ServisId=@servisID));

    DECLARE @mesec INT = MONTH(GETDATE());
    DECLARE @godina INT = YEAR(GETDATE());
    DECLARE @brojMeseca INT = 1;

    WHILE @brojMeseca <= 3
    BEGIN
        SET @mesec = @mesec - 1;
        IF @mesec = 0
        BEGIN
            SET @mesec = 12;
            SET @godina = @godina - 1;
        END;
		DECLARE @troskovi INT = (SELECT Troskovi from MesecniIzvestaj where RadnikId in (select RadnikId from Radnik where TipRadnika='Racunovodja' And ServisId = @servisID) and mesec=@mesec and godina = @godina);
		SET @troskovi = @troskovi + @brojRadnikaZaPovecanje*@putniTroskovi;
		DECLARE @prihodi INT = (SELECT PRIHODI from MesecniIzvestaj where RadnikId in (select RadnikId from Radnik where TipRadnika='Racunovodja' And ServisId = @servisID) and mesec=@mesec and godina = @godina);
		DECLARE @saldo INT = @prihodi - @troskovi;

		UPDATE MesecniIzvestaj
        SET Troskovi = @troskovi ,
			Saldo = @saldo,
			UkupniSaldo = UkupniSaldo - @brojRadnikaZaPovecanje*@putniTroskovi * (3-@brojMeseca)
        WHERE RadnikId in (select RadnikId from Radnik where TipRadnika='Racunovodja' And ServisId = @servisID) and mesec=@mesec and godina = @godina;

        SET @brojMeseca = @brojMeseca + 1;
    END;
	Print('Uspesno dodavanje putnih troskova');
END;

CREATE INDEX Index_MesecniIzvestaj
ON MesecniIzvestaj (RadnikId, Mesec, Godina,Saldo);