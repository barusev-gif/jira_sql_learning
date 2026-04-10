-- SQL basics

SELECT * FROM tickets;
-- BASIC SELECT

-- Vybere všechna data z tabulky
SELECT * FROM tickets;

-- Vybere jen jeden sloupec (title)
SELECT title FROM tickets;

-- Vybere více sloupců
SELECT title, assignee FROM tickets;

-- Filtr podle statusu
SELECT * FROM tickets WHERE status = 'Open';

-- Filtr podle assignee
SELECT title FROM tickets WHERE assignee = 'Anna';

-- POZNÁMKY:

-- SELECT = co chci vidět
-- FROM = z jaké tabulky
-- WHERE = podmínka (filtr)

-- * znamená všechny sloupce
-- ; ukončuje daný dotaz 


Co dělá
SELECT
co chci vidět
FROM
odkud
WHERE
filtr
GROUP BY
seskupení
