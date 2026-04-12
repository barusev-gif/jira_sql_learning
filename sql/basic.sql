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


SQL – Week 2 (SUM + CASE, Reporting)

1. SUM (sčítání hodnot)

SELECT SUM(column)
FROM table;

Princip:
	•	SUM = sčítá hodnoty ve sloupci
	•	používá se pro numerická data

⸻

2. CASE WHEN (podmínky v SQL)

SELECT
CASE
WHEN condition THEN value
ELSE value
END
FROM table;

Princip:
	•	CASE WHEN = podmínka (if v SQL)
	•	umožňuje rozhodování nad daty

⸻

3. Vytvoření čísel z textu

SELECT
status,
CASE
WHEN status = ‘Open’ THEN 1
ELSE 0
END AS is_open
FROM tickets;

Princip:
	•	převod textových hodnot na číselné (1 / 0)
	•	základ pro výpočty

⸻

4. SUM + CASE WHEN (podmíněné počítání)

SELECT
SUM(CASE WHEN status = ‘Open’ THEN 1 ELSE 0 END) AS open_count
FROM tickets;

Princip:
	•	počítá jen řádky, které splňují podmínku
	•	alternativa k COUNT + WHERE

⸻

5. SUM + CASE + GROUP BY

SELECT
assignee,
SUM(CASE WHEN status = ‘Open’ THEN 1 ELSE 0 END) AS open_count
FROM tickets
GROUP BY assignee;

Princip:
	•	výpočty pro každou skupinu (např. per assignee)
	•	umožňuje analýzu dat podle kategorií

⸻

6. Více metrik v jednom dotazu (mini dashboard)

SELECT assignee,
SUM(CASE WHEN status = ‘Open’ THEN 1 ELSE 0 END) AS open_count,
SUM(CASE WHEN status = ‘In Progress’ THEN 1 ELSE 0 END) AS in_progress_count,
SUM(CASE WHEN status = ‘Waiting’ THEN 1 ELSE 0 END) AS waiting_count,
SUM(CASE WHEN status = ‘Done’ THEN 1 ELSE 0 END) AS done_count
FROM tickets
GROUP BY assignee
ORDER BY open_count DESC;

Princip:
	•	více metrik v jednom dotazu
	•	přehled workloadu per assignee
	•	základ dashboardů

⸻

Key learnings
	•	SUM sčítá hodnoty, ale lze ho použít i pro počítání
	•	CASE WHEN umožňuje vytvořit logiku v SQL
	•	kombinace SUM + CASE = podmíněné počítání
	•	není nutné mít numerická data → lze je vytvořit
	•	GROUP BY + SUM CASE = reporting nad daty
	•	ORDER BY slouží pro řazení výsledků

⸻

Praktické use-cases
	•	kolik je Open / Done ticketů
	•	workload per assignee
	•	rozpad ticketů podle statusu
	•	jednoduchý dashboard bez BI nástroje

1. Proč JOIN existuje

Princip:
	•	data jsou často rozdělená do více tabulek
	•	jedna tabulka obsahuje ID (např. assignee_id)
	•	druhá obsahuje detail (např. jméno)
	•	JOIN umožňuje tato data propojit

⸻

2. Základní JOIN

SELECT *
FROM tickets
JOIN users ON tickets.assignee_id = users.id;

Princip:
	•	JOIN spojí dvě tabulky
	•	ON určuje podmínku spojení
	•	výsledkem je „spojená tabulka“

⸻

3. Výběr konkrétních sloupců

SELECT users.name, tickets.title, tickets.status
FROM tickets
JOIN users ON tickets.assignee_id = users.id;

Princip:
	•	po JOIN lze používat sloupce z obou tabulek
	•	doporučeno psát název tabulky (users.name)

⸻

4. JOIN + GROUP BY

SELECT users.name, COUNT(*)
FROM tickets
JOIN users ON tickets.assignee_id = users.id
GROUP BY users.name;

Princip:
	•	GROUP BY seskupuje podle uživatele
	•	COUNT počítá počet ticketů
	•	umožňuje analýzu workloadu

⸻

5. JOIN + WHERE

SELECT users.name, COUNT(*)
FROM tickets
JOIN users ON tickets.assignee_id = users.id
WHERE tickets.status = ‘Open’
GROUP BY users.name;

Princip:
	•	WHERE filtruje data před GROUP BY
	•	umožňuje počítat pouze vybraný typ dat

⸻

6. GROUP BY více sloupců

SELECT users.name, tickets.status, COUNT(*)
FROM tickets
JOIN users ON tickets.assignee_id = users.id
GROUP BY users.name, tickets.status;

Princip:
	•	seskupení podle kombinace hodnot
	•	umožňuje detailní rozpad dat

⸻

Key learnings
	•	JOIN spojuje tabulky podle společného klíče
	•	ON definuje vztah mezi tabulkami
	•	po JOIN lze používat sloupce z obou tabulek
	•	GROUP BY musí odpovídat sloupcům v SELECT
	•	WHERE filtruje data před agregací
	•	nesprávný JOIN vrací nesmyslná data nebo nic

⸻

Praktické use-cases
	•	převod ID na jméno (assignee_id → name)
	•	workload per user
	•	počet ticketů podle statusu
	•	analýza dat napříč tabulkami

⸻

🎯 Poznámka

JOIN = jeden z nejdůležitějších konceptů v SQL
👉 používá se v téměř každém reálném dotazu


