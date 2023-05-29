CREATE DATABASE Agencija_za_licna_dokumenta;
--- 09-05-2023 19:51:46
--- MS SQL
CREATE TABLE Korisnik (
  ID int NOT NULL PRIMARY KEY,
  Ime nvarchar(50) NOT NULL,
  Prezime nvarchar(50) NOT NULL,
  JMBG nvarchar(13) NOT NULL,
  Adresa nvarchar(100) NOT NULL,
  Telefon nvarchar(20) NOT NULL,
  Email nvarchar(50) NOT NULL,
  Broj_Licne_Karte nvarchar(9) NOT NULL,
  Datum_Izdavanja_LK date NOT NULL,
  Mesto_Izdavanja_LK nvarchar(50) NOT NULL);

--- 09-05-2023 19:53:05
--- MS SQL
CREATE TABLE Dokument (
  ID int NOT NULL PRIMARY KEY,
  Vrsta_Dokumenta nvarchar(50) NOT NULL,
  Datum_Izdavanja date NOT NULL,
  Vazi_Do date NOT NULL,
  Korisnik_ID int NOT NULL FOREIGN KEY REFERENCES Korisnik(ID)
);

--- 09-05-2023 19:54:07
--- MS SQL
CREATE INDEX idx_Korisnik_JMBG ON Korisnik (JMBG);

--- 09-05-2023 19:58:46
--- MS SQL
INSERT INTO Korisnik (ID, Ime, Prezime, JMBG, Adresa, Telefon, Email, Broj_Licne_Karte, Datum_Izdavanja_LK, Mesto_Izdavanja_LK) VALUES (1, 'Marko', 'Markovic', '1301993750011', 'Bulevar Osllobodjenja 12', '+381 63 1234567', 'marko.markovic@gmail.com', '123456789', '2020-01-01', 'Novi Sad'), (2, 'Jovana', 'Petrovic', '0806994800022', 'Ulica Jovana Cvijica 14', '+381 64 2345678', 'jovana.petrovic@gmail.com', '234567890', '2021-05-01', 'Beograd'), (3, 'Ivan', 'Ivanovic', '2202997770005', 'Naselje Zeleni Venac 2', '+381 65 3456789', 'ivan.ivanovic@gmail.com', '345678901', '2019-10-15', 'Nis'), (4, 'Ana', 'Anic', '0112991890099', 'Ulica Knez Mihailova 10', '+381 64 4567890', 'ana.anic@gmail.com', '456789012', '2022-02-28', 'Beograd'), (5, 'Nikola', 'Nikolic', '2906997780088', 'Bulevar Mihajla Pupina 5', '+381 63 5678901', 'nikola.nikolic@gmail.com', '567890123', '2021-12-10', 'Novi Sad');

--- 09-05-2023 19:58:57
--- MS SQL
SELECT * FROM Korisnik;

--- 09-05-2023 20:00:36
--- MS SQL

--- 09-05-2023 20:00:44
--- MS SQL
INSERT INTO Dokument (ID, Vrsta_Dokumenta, Datum_Izdavanja, Vazi_Do, Korisnik_ID)
VALUES
(1, 'Pasos', '2020-01-01', '2030-01-01', 1),
(2, 'Licna karta', '2021-05-01', '2031-05-01', 2),
(3, 'Pasos', '2019-10-15', '2029-10-15', 3),
(4, 'Pasos', '2022-02-28', '2032-02-28', 4),
(5, 'Pasos', '2021-02-28', '2032-02-28', 5);

--- 09-05-2023 20:00:56
--- MS SQL
SELECT * FROM Dokument;

--- 09-05-2023 20:04:01
--- MS SQL
ALTER TABLE Dokument ADD CONSTRAINT FK_Dokument_Korisnik_ID FOREIGN KEY (Korisnik_ID) REFERENCES Korisnik(ID);

--- 09-05-2023 20:04:27
--- MS SQL
SELECT * FROM Dokument;

--- 09-05-2023 20:21:51
--- MS SQL
CREATE PROCEDURE PromijeniAdresuPrebivalistaKorisnik 
@StaraAdresa NVARCHAR(100),     
@NovaAdresa NVARCHAR(100) AS BEGIN 
UPDATE Adresa SET Naziv = @NovaAdresa WHERE Naziv = @StaraAdresa;
UPDATE Korisnik SET Adresa = @NovaAdresa WHERE Adresa = @StaraAdresa; END;
--- 09-05-2023 20:27:23
--- MS SQL
UPDATE Korisnik
SET Datum_Izdavanja_LK = GETDATE(),
    Mesto_Izdavanja_LK = 'Nepoznato';

--- 09-05-2023 20:27:32
--- MS SQL
SELECT * FROM Korisnik;

--- 09-05-2023 20:30:03
--- MS SQL
SELECT * FROM Dokument;

--- 09-05-2023 20:34:12
--- MS SQL
ALTER TABLE Dokument
ADD CONSTRAINT FK_Dokument_Korisnik
FOREIGN KEY (Korisnik_ID)
REFERENCES Korisnik (ID)
ON DELETE CASCADE
ON UPDATE CASCADE;

--- 09-05-2023 20:34:24
--- MS SQL
SELECT * FROM Dokument;

--- 09-05-2023 20:36:41
--- MS SQL
SELECT * FROM Korisnik;

--- 09-05-2023 20:37:26
--- MS SQL
UPDATE Korisnik SET Ime = 'Novo Ime', Prezime = 'Novo Prezime', Adresa = 'Nova Adresa' WHERE ID = 1;

--- 09-05-2023 20:37:30
--- MS SQL
SELECT * FROM Korisnik;

--- 09-05-2023 20:37:42
--- MS SQL
DELETE FROM Korisnik WHERE ID = 1;

--- 09-05-2023 20:37:46
--- MS SQL
SELECT * FROM Korisnik;

--- 09-05-2023 20:40:15
--- MS SQL
SELECT * FROM Dokument;

--- 09-05-2023 20:43:05
--- MS SQL
INSERT INTO Korisnik (ID, Ime, Prezime, JMBG, Adresa, Telefon, Email, Broj_Licne_Karte, Datum_Izdavanja_LK, Mesto_Izdavanja_LK) VALUES (1, 'Marko', 'Kraljevic', '1301993750011', 'Bulevar Osllobodjenja 12', '+381 63 1234567', 'marko.markovic@gmail.com', '123456789', '2020-01-01', 'Novi Sad');

--- 09-05-2023 20:43:13
--- MS SQL
SELECT * FROM Korisnik;

--- 09-05-2023 20:43:30
--- MS SQL
SELECT * FROM Dokument;

