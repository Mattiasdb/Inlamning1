# Mattias Karlsson YH24
Jag har designat en databas för en liten bokhandel, med syftet att hantera kunder, böcker och beställningar på ett enkelt och effektivt sätt. Systemet ska göra det enkelt att registrera, uppdatera och hämta information om beställningar och böcker.

Databasen är baserad på ett ER-diagram och innehåller fyra huvudentiteter: Kunder, Böcker, Beställningar och Orderrader. Jag döpte databasen till Bokhandel, och entiteterna blev tabeller i databasen med tillhörande primär - och främmande nycklar.

Jag har valt att använda BokID som primär nyckel istället för ISBN, eftersom e-böcker saknar ISBN-nummer, och BokID är enklare att hantera. Relationerna i databasen är att en kund kan göra flera beställningar, men en beställning kan bara tillhöra en kund. Därför har Beställningar en främmande nyckel till Kunder. Orderrader fungerar som en kopplingstabell mellan Böcker och Beställningar, eftersom en beställning kan innehålla flera böcker, och en bok kan förekomma i flera beställningar. Jag lade till attributen Antal och Delsumma i Orderrader. Antal visar hur många exemplar av en bok som beställts, och Delsumma beräknar totalpriset för dessa. Primär- och främmande nycklar säkerställer kopplingarna mellan tabellerna. Strukturen på databasen gör det möjligt att enkelt utöka med fler funktioner vid behov.


