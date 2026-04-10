# Week 1

- setup Jira project
- vytvořit workflow


1. Nastavit základní workflow v Jira (support)
   - každý status musí mít transition
   - resolution done - přes rules (perform actions):
         1. **Restrict transition** - kdo to může dělat?; omezuje přechody (př.: jen support můźe dát Done, zákazník nemůže měnit status)
         2. **Validate details** - je to správně vyplněné?; kontroluje data před přechodem (př.: nemůžeš dát ticket do done pokud není assignee, chybí komentář)
         3. **Request input** - chci od tebe něco vyplnit; vyskočí form při přechodu (př.: napiš důvod, vyber resolution)
         4. **Perform actions** - co se má stát automaticky; mění data, spouští akce (př.: res. done, změň prioritu, přidej label) 

2. ## Assignment

Rozhodnutí:
- default assignee: v případě specifické problematiky ano (konkrétní user nebo queue); pro běžné incidenty/SR nastavit SLA, nechávat unassigned a nechat na zodpovědnost SD agentů

Problém:
- ticket bez assignee = nikdo ho neřeší (propálené SLA)

Poznámka:
- potřeba řešit automatizací

3. ## Automation setup

### 1. SLA breach (Unassigned)
Trigger:
- SLA threshold breached (Time to first response)

Condition:
- Assignee is empty

Action:
- Comment (ticket nebyl převzat)
- Email notification

Princip:
- upozornění, ne automatické řešení


### 2. Waiting → In Progress
Trigger:
- Issue commented

Conditions:
- Status = Waiting
- reporter = {{initiator}}

Action:
- Transition to In Progress

Princip:
- návrat ticketu do práce při odpovědi zákazníka


### 3. Waiting reminder
Trigger:
- Scheduled

Condition:
- Status = Waiting
- updated <= -2d

Action:
- Comment (stále čekáme na odpověď)

Princip:
- follow-up bez manuální práce


### 4. Escalation (long running tickets)
Trigger:
- Scheduled (1x denně)

Condition:
- status NOT IN (Done, Waiting)
- created <= -3d

Action:
- Comment / zvýšení priority

Princip:
- řešení dlouhodobých ticketů


## Key learnings

- automatizace nemá řešit práci za lidi
- má upozorňovat na problém
- SLA ≠ escalation (řeší jiné situace)
- Waiting = pause stavu, ne aktivní práce
