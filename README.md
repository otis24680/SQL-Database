# Film Management System Database

## Přehled

Tato relační databáze byla navržena pro správu a ukládání informací o filmech, hercích, režisérech, uživatelských recenzích a filmových žánrech. Databáze poskytuje strukturované prostředí, které umožňuje snadnou manipulaci, vyhledávání a analýzu filmových dat.

## Použité technologie

* **PostgreSQL**: Relační databázový systém
* **Docker**: Kontejnerizace databázového serveru
* **SQL Tools**: Pro integraci a správu databáze v prostředí Visual Studio Code
* **pgAdmin**: Správa databáze pomocí GUI
* **Visual Studio Code ERD Extension**: Vytváření a vizualizace ERD diagramů

## Struktura databáze

Databáze se skládá ze 7 vzájemně propojených tabulek:

### 1. Genres

* `Genre_ID` (PRIMARY KEY): Automaticky generované ID žánru.
* `Genre_Name`: Název žánru (např. Sci-Fi, Drama, Comedy), unikátní a povinný údaj.

### 2. Directors

* `Director_ID` (PRIMARY KEY): Automaticky generované ID režiséra.
* `First_Name`: Křestní jméno režiséra, povinné.
* `Last_Name`: Příjmení režiséra, povinné.
* `Birthdate`: Datum narození režiséra (volitelné).

### 3. Actors

* `Actor_ID` (PRIMARY KEY): Automaticky generované ID herce.
* `First_Name`: Křestní jméno herce, povinné.
* `Last_Name`: Příjmení herce, povinné.
* `Birthdate`: Datum narození herce (volitelné).

### 4. Users

* `User_ID` (PRIMARY KEY): Automaticky generované ID uživatele.
* `Username`: Unikátní uživatelské jméno, povinné.
* `Email`: Unikátní email uživatele, povinný.

### 5. Films

* `Film_ID` (PRIMARY KEY): Automaticky generované ID filmu.
* `Title`: Název filmu, povinný.
* `Release_Year`: Rok vydání filmu, povinný.
* `Genre_ID` (FOREIGN KEY): Odkaz na tabulku Genres (žánr filmu), nastaví se na NULL při smazání žánru.
* `Director_ID` (FOREIGN KEY): Odkaz na tabulku Directors (režisér filmu), nastaví se na NULL při smazání režiséra.
* `Duration`: Délka filmu v minutách, musí být větší než 0.
* `Rating`: Hodnocení filmu (0.0 - 10.0), povinné.

### 6. Film\_Actors

* `Film_ID` (FOREIGN KEY): Odkaz na tabulku Films, automaticky odstraní záznamy při smazání filmu.
* `Actor_ID` (FOREIGN KEY): Odkaz na tabulku Actors, automaticky odstraní záznamy při smazání herce.
* `Role`: Název postavy ve filmu, volitelný údaj.

### 7. Reviews

* `Review_ID` (PRIMARY KEY): Automaticky generované ID recenze.
* `Film_ID` (FOREIGN KEY): Odkaz na tabulku Films, automaticky odstraní záznamy při smazání filmu.
* `User_ID` (FOREIGN KEY): Odkaz na tabulku Users, automaticky odstraní záznamy při smazání uživatele.
* `Rating`: Uživatelské hodnocení filmu (1-10), povinné.
* `Comment`: Textový komentář, volitelný.
* `Review_Date`: Datum a čas vytvoření recenze, nastavuje se automaticky.

## Vztahy mezi tabulkami

* **Genres → Films (1\:N)**: Každý žánr může mít více filmů.
* **Directors → Films (1\:N)**: Každý režisér může natočit více filmů.
* **Actors ↔ Films (M\:N)**: Herci mohou hrát ve více filmech a každý film může mít více herců (přes tabulku Film\_Actors).
* **Users → Reviews (1\:N)**: Uživatel může napsat více recenzí.
* **Films → Reviews (1\:N)**: Každý film může mít více recenzí.

## Využití databáze

Tato databáze poskytuje robustní platformu pro:

* Vytváření filmových katalogů
* Správu filmových informací pro filmové weby nebo aplikace
* Shromažďování uživatelských hodnocení a recenzí
* Statistické analýzy filmových preferencí a hodnocení
* Ukládání a analýzu dat pro personalizovaná doporučení

## ERD Diagram

Součástí repozitáře je ERD diagram (`film_management_diagram.drawio`), který podrobně ilustruje strukturu databáze včetně tabulek, vztahů a klíčů.

