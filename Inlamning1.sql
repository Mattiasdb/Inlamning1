/*
Mattias Karlsson YH24
Inlämning 1
*/
/*
Skapar en databas som heter bokhandel
*/
CREATE DATABASE Bokhandel;
/*
Väljer att använda databasen Bokhandel
*/
USE Bokhandel;
/*
Skapar tabellen kunder
KundID är PRIMARY KEY
*/
CREATE TABLE Kunder (
	KundID INT AUTO_INCREMENT PRIMARY KEY,           -- "AUTO_INCREMENT" betyder att värdet ökar med ett heltal för varje ny rad
    Namn VARCHAR(100) NOT NULL,                      -- "VARCHAR" används för text och kan innehålla både siffror och bokstäver
    Email VARCHAR(255) UNIQUE NOT NULL,	             -- "UNIQUE" betyder här att alla email måste vara unika i tabellen
    Telefon VARCHAR(20) NOT NULL,		             -- "NOT NULL" betyder att kolumnen måste ha ett värde
    Adress VARCHAR(255) NOT NULL                     -- "VARCHAR(255)" betyder att den kan lagra upp till 255 tecken
    );
    /*
    Skapar tabellen böcker
    BokID är PRIMARY KEY
    */
CREATE TABLE Böcker (
	BokID INT AUTO_INCREMENT PRIMARY KEY,            -- "PRIMARY KEY" betyder att den gör kolumnen till en unik identifierare för varje rad
    Titel VARCHAR(255) NOT NULL,                     -- Titel kan innehålla upp till 255 tecken och ett värde måste anges
    ISBN VARCHAR(20) UNIQUE NOT NULL,                -- "UNIQUE" betyder här att alla ISBN nummer måste vara unika i tabellen
    Författare VARCHAR(100) NOT NULL,                -- Författare kan innehålla upp till 100 tecken och ett värde måste anges
    Pris DECIMAL(10,2) NOT NULL CHECK (Pris > 0),    -- "DECIMAL(10,2)" betyder att "Pris" kan ha 10 siffror varav 2 decimaler, och "Pris" måste vara större än 0
    Lagerstatus INT NOT NULL CHECK(Lagerstatus >= 0) -- Värdet kan bara vara 0 eller högre
	);
/*
Skapar tabellen beställningar
Ordernummer är PRIMARY KEY
KundID är FOREIGN KEY
*/
CREATE TABLE Beställningar (
	Ordernummer INT AUTO_INCREMENT PRIMARY KEY,                     --  Här är Ordernummer PRIMARY KEY
    KundID INT NOT NULL,                                            
    Datum TIMESTAMP DEFAULT CURRENT_TIMESTAMP,                      -- Lagrar datum och tid, och om inget värde ges så sätts det aktuella datumet och tiden
    Totalsumman DECIMAL(10,2) NOT NULL CHECK (Totalsumman > 0),     -- Totalsumman måste vara större än 0
	FOREIGN KEY (KundID) REFERENCES Kunder(KundID)                  -- Definierar KundID som Foreign key i tabellen beställningar, och 
	);                                                              -- refererar att KundID måste finnas i tabellen Kunder
/*
Skapar tabellen orderrader
OrderradID är PRIMARY KEY
Ordernummer är FOREIGN KEY
BokID är FOREIGN KEY
*/
CREATE TABLE Orderrader (
	OrderradID INT AUTO_INCREMENT PRIMARY KEY,            		     -- Här är OrderradID PRIMARY KEY
    Ordernummer INT NOT NULL,					          		     
	BokID INT NOT NULL,                                   		     
    Antal INT NOT NULL CHECK (Antal > 0),                            -- Värdet på "Antal" ska vara större än 0
    Delsumma DECIMAL(10,2) NOT NULL CHECK (Delsumma > 0),            -- Värdet på "Delsumma" ska vara större än 0
    FOREIGN KEY (Ordernummer) REFERENCES Beställningar(Ordernummer), -- Definierar Ordernummer som FK och refererar att den måste finnas i tabellen Beställningar
    FOREIGN KEY (BokID) REFERENCES Böcker(BokID)                     -- Definierar BokID som FK och refererar att den måste finnas i tabellen Böcker
    );
/*
Infogar kunduppgifter i tabellen kunder
*/
INSERT INTO Kunder (Namn, Email, Telefon, Adress) VALUES
("Anna Svensson","anna@email.com","0701234567","Bokvägen 1"),
("Erik Eriksson", "erik@email.com","0702345678","Tidningsvägen 2"),
("Per Persson", "per@email.com","0703456789","Litteraturvägen 3");
/*
Infogar bokuppgifter i tabellen böcker
*/
INSERT INTO Böcker (Titel, ISBN, Författare, Pris, Lagerstatus) VALUES
("Svensk politik","978-91-7789-849-8","Per T Ohlsson", 399.99, 200),
("Mastering Windows server 2022","978-1-83763-450-7","Jordan Krause", 499.99, 20),
("Comptida Network", "978-1-264-26905-1","Mike Meyers", 299.99, 3);
/*
Sorterar och visar data från Böcker tabellen
*/
SELECT * FROM Böcker ORDER BY Pris ASC;        -- Sorterar böcker efter priset, i stigande följd
