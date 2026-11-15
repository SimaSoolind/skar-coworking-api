[⬅️ Tillbaka till stegen.md](../stegen.md)

# 📄 Lärarens krav (projektbeskrivningen)

## fokus och betygen är bakend
# Projektarbete: Bygga en Bokningsplattform för en Coworking Space

## Översikt

I detta projekt ska du bygga backend för en Bokningsplattform för en Coworking Space. Plattformen ska låta användare registrera sig, logga in, och boka arbetsplatser eller konferensrum. Administratörer ska kunna hantera användare, rum och bokningar.

## Funktionella krav

### 1. Användarroller

- **Vanlig användare (User):**
  - Kan registrera sig, logga in och se sina bokningar.
  - Kan skapa, uppdatera och ta bort sina egna bokningar.
- **Administratör (Admin):**
  - Kan hantera rum (lägga till, uppdatera och ta bort).
  - Kan se alla användare och deras bokningar.
  - Kan hantera användare (ta bort användarkonton).

### 2. Funktionalitet

1. **Autentisering och Auktorisering**
   - Användare ska kunna registrera sig och logga in via API:et.
   - JWT ska användas för att autentisera och skydda rutter.
   - Endast admin ska kunna hantera rum och andra användare.
2. **Rumshantering**
   - Admin ska kunna skapa rum med följande fält:
     - Namn (t.ex., "Konferensrum 1").
     - Kapacitet (antal personer rummet rymmer).
     - Typ (t.ex., "arbetsplats" eller "konferensrum").
3. **Bokningar**
   - En användare ska kunna boka ett rum genom att ange:
     - Rum-ID.
     - Datum och tid för bokningen (start och slut).
   - Systemet ska kontrollera att rummet är ledigt innan bokningen sparas.
4. **Notifieringar**
   - Skicka realtidsnotifieringar till användare när en bokning skapas eller ändras.
5. **Loggning och Felhantering**
   - Implementera loggning för att övervaka systemet.
   - Hantera vanliga fel som att boka ett upptaget rum eller ange ogiltiga datum.

## Teknikstack

- **Språk:** TypeScript (JavaScript eller TypeScript bedöms lika).
- **Backend:** Node.js med Express.js.
- **Databas:** PostgreSQL (körs i Docker lokalt).
- **Autentisering:** JWT och bcrypt.
- **Caching:** Redis för att optimera hantering av ofta efterfrågade data (t.ex., rum).
- **Realtidskommunikation:** WebSocket (via socket.io) för notifieringar.
- **Deployment:** Heroku eller annan molnplattform.

## Projektkrav

### 1. API-specifikation

**Autentisering**

- `POST /register`: Registrera en ny användare.
- `POST /login`: Logga in och få en JWT-token.

**Rumshantering (Endast Admin)**

- `POST /rooms`: Skapa ett nytt rum.
- `GET /rooms`: Hämta en lista över alla rum.
- `PUT /rooms/:id`: Uppdatera ett rum.
- `DELETE /rooms/:id`: Ta bort ett rum.

**Bokningar**

- `POST /bookings`: Skapa en ny bokning.
- `GET /bookings`: Hämta användarens bokningar (User) eller alla bokningar (Admin).
- `PUT /bookings/:id`: Uppdatera en bokning (endast skaparen eller Admin).
- `DELETE /bookings/:id`: Ta bort en bokning (endast skaparen eller Admin).

**Notifieringar**

- Implementera realtidsnotifieringar när:
  - En bokning skapas.
  - En bokning ändras eller tas bort.

### 2. Databasstruktur (PostgreSQL)

Läraren visade tabellerna i MongoDB (Mongoose). Jag använder PostgreSQL.
Hela koden finns i `database/schema.sql`.

**users**
| Kolumn | Typ | Regel |
|--------|-----|-------|
| id | SERIAL | PRIMARY KEY |
| username | VARCHAR(50) | NOT NULL, UNIQUE |
| password_hash | VARCHAR(255) | NOT NULL (hashas med bcrypt) |
| role | VARCHAR(10) | 'User' eller 'Admin', standard 'User' |

**rooms**
| Kolumn | Typ | Regel |
|--------|-----|-------|
| id | SERIAL | PRIMARY KEY |
| name | VARCHAR(100) | NOT NULL, UNIQUE |
| capacity | INT | NOT NULL, större än 0 |
| type | VARCHAR(20) | 'workspace' eller 'conference' |

**bookings**
| Kolumn | Typ | Regel |
|--------|-----|-------|
| id | SERIAL | PRIMARY KEY |
| user_id | INT | FOREIGN KEY → users.id, ON DELETE CASCADE |
| room_id | INT | FOREIGN KEY → rooms.id, ON DELETE CASCADE |
| start_time | TIMESTAMP | NOT NULL |
| end_time | TIMESTAMP | NOT NULL, efter start_time |

**Relationer**
- En användare kan ha många bokningar (1 : N).
- Ett rum kan ha många bokningar (1 : N).
- `bookings` är kopplingstabellen mellan users och rooms.

## Leverabler

1. **Kod**
   - Projektets kod organiserad enligt en modulär struktur.
   - En Git-repo-länk eller en zip-fil med hela projektet.
2. **Dokumentation**
   - README.md med:
     - Kort beskrivning av projektet.
     - Instruktioner för att köra projektet lokalt.
     - API-dokumentation (rutter, metoder, förfrågningskroppar, och svar).
3. **Deployad Applikation**
   - En publik URL till den deployade applikationen (t.ex., Heroku).

## Bedömningskriterier

1. **Funktionalitet (50%)**
   - Uppfyller alla krav (autentisering, RBAC, bokningslogik, etc.).
   - Realtidsnotifieringar fungerar korrekt.
2. **Kodkvalitet (20%)**
   - Ren, läsbar och välstrukturerad kod.
   - Följande av best practices för Node.js och Express.
3. **Dokumentation (10%)**
   - README-filen är tydlig och informativ.
4. **Deployment (20%)**
   - Applikationen är korrekt deployad och tillgänglig online.
