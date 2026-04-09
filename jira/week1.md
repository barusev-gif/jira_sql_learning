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
