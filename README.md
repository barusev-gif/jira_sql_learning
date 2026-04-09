# jira_sql_learning
Learning Jira and SQL 
🎯 Celkový princip (drž se toho)

Každý blok = jeden konkrétní problém z firmy, který řešíš v Jira + SQL

⸻

🏢 Fake firma (fixní kontext)

Použij tohle pořád:

SaaS app na objednávky (něco jako Košík light)

Týmy:
	•	Support (JSM)
	•	Dev (Jira Software)

  🧱 BLOK 1 (3–5 dní)

🎯 Téma:

„Zákazník nahlásí problém → někdo ho musí řešit“

⸻

Jira (45 min denně)

Udělej:

1. Issue types (zkontroluj / nastav)
Support:
	•	Incident
	•	Service Request

Dev:
	•	Bug
	•	Task

⸻

2. Workflow – Support
Nastav: New → In Progress → Waiting → Done
👉 přemýšlej:
	•	kdy ticket čeká?
	•	kdy je hotový?


⸻

3. Workflow – Dev
Backlog → In Progress → Review → Done

SQL (45 min denně)

Vytvoř / použij:

Tabulka tickets (už máš)

Cvičení:

1.SELECT * FROM tickets;
2. SELECT * FROM tickets WHERE status = 'Open';
3. SELECT * FROM tickets WHERE assignee = 'Anna';

Výstup bloku
	•	máš workflow v Jira
	•	umíš filtrovat data v SQL

  🧱 BLOK 2 (další 3–5 dní)

🎯 Téma:

„Kdo co řeší? Chaos v assignování“

⸻

Jira

Udělej:

1. Role
	•	agent
	•	developer

⸻

2. Nastav assignment
	•	kdo dostane ticket?

👉 ručně nebo defaultně

⸻

3. Přemýšlej:
	•	co když nikdo není assigned?

⸻

SQL

Přidej:

1.SELECT assignee, COUNT(*) 
FROM tickets 
GROUP BY assignee;
2. SELECT status, COUNT(*) 
FROM tickets 
GROUP BY status;


Výstup:
	•	chápeš workload
	•	začínáš „vidět data“

⸻

🧱 BLOK 3 (další 5–7 dní)

🎯 Téma:

„Ticket se zasekne → potřebujeme automatizaci“

⸻

Jira (klíčový blok)

Vytvoř automation:

1. Auto-assign
	•	když vytvoříš ticket → přiřaď někoho

⸻

2. Escalation
	•	pokud je ticket 2 dny ve „Waiting“ → upozorni

⸻

3. Status change
	•	když se něco stane → změň status

⸻

SQL

JOIN (důležitý krok)

Rozšiř si DB: CREATE TABLE users (
    id INTEGER,
    name TEXT
);

Pak: SELECT tickets.title, users.name
FROM tickets
JOIN users ON tickets.assignee = users.name;

👉 pochopíš spojování dat

⸻

🧱 BLOK 4 (1 týden)

🎯 Téma:

„Navrhuju systém, ne jen klikám“

⸻

Jira

Navrhni:

Support flow:
	•	intake → triage → řešení

Dev flow:
	•	backlog → dev → review

👉 napiš:
	•	proč to tak je

⸻

SQL

Kombinuj: SELECT assignee, status, COUNT(*)
FROM tickets
GROUP BY assignee, status;

📦 Výstup po 4 blocích

Budeš umět:
	•	Jira admin (reálně, ne teoreticky)
	•	automation (velký rozdíl)
	•	SQL pro práci s daty

⸻

🧠 Jak to jet denně

1,5 h:
	•	45 min Jira (nastavování)
	•	45 min SQL (dotazy)

⸻

❗ Důležité pravidlo

vždy pracuj na jednom problému, ne „učím se Jira“

⸻

