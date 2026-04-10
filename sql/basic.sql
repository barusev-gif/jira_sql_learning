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

Filtering & Exploration)

1. DISTINCT (unikátní hodnoty)

SELECT DISTINCT column
FROM table;

Příklad:
SELECT DISTINCT status
FROM tickets;

Princip:
	•	vrací pouze unikátní hodnoty
	•	odstraňuje duplicity
	•	vhodné pro zjištění „jaké hodnoty existují“

⸻

2. LIMIT (omezení výsledků)

SELECT *
FROM tickets
LIMIT 5;

Princip:
	•	omezuje počet řádků ve výsledku
	•	používá se pro „top N“ výsledků
	•	často v kombinaci s ORDER BY

⸻

3. ORDER BY (řazení)

SELECT *
FROM tickets
ORDER BY created_at;

Princip:
	•	řadí výsledky
	•	ASC = vzestupně (default)
	•	DESC = sestupně

⸻

Příklad:

SELECT assignee, COUNT(*) AS workload
FROM tickets
GROUP BY assignee
ORDER BY workload DESC;

⸻

4. ORDER BY podle více sloupců

SELECT assignee, status, COUNT()
FROM tickets
GROUP BY assignee, status
ORDER BY assignee, COUNT() DESC;

Princip:
	•	nejdřív řadí podle prvního sloupce
	•	v rámci něj podle druhého

⸻

5. LIKE (vyhledávání v textu)

SELECT *
FROM tickets
WHERE title LIKE ‘%App%’;

Princip:
	•	slouží pro hledání v textu
	•	% = libovolný počet znaků

⸻

Příklady:
	•	‘%text%’ → obsahuje text
	•	‘text%’ → začíná na text
	•	‘%text’ → končí na text

⸻

6. Kombinace (reálný use-case)

SELECT title, COUNT(*) AS count
FROM tickets
GROUP BY title
ORDER BY count DESC
LIMIT 3;

Princip:
	•	GROUP BY = seskupení
	•	COUNT = počet
	•	ORDER BY = seřazení
	•	LIMIT = omezení výsledku

⸻

Key learnings
	•	DISTINCT = unikátní hodnoty
	•	GROUP BY = seskupování dat
	•	ORDER BY = řazení výsledků
	•	LIMIT = omezení počtu výsledků
	•	LIKE = práce s textem

⸻

Praktické použití
	•	zjištění možných hodnot (status, assignee)
	•	hledání konkrétních problémů (např. „App“)
	•	identifikace nejčastějších ticketů
	•	analýza workloadu

⸻

🎯 Poznámka (důležitá)

Tohle je:

exploratory SQL

👉 používáš to, když:
	•	neznáš data
	•	chceš se v nich zorientovat
