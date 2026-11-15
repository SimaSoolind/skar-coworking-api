# Coworking-bokning – backend

Ett API där användare registrerar sig, loggar in och bokar arbetsplatser eller konferensrum.
Admin hanterar rum och användare.

**Teknik:** Node.js, Express, TypeScript, PostgreSQL (i Docker)

> Resten av README (installation, API-dokumentation, deploy) fylls i när projektet är klart.

---

## Karta över projektet

Strukturen är bestämd och ändras inte. Varje fil har en kommentar högst upp som säger vad som ska stå i den.

```
HotellSkar-api/
├── server.ts                 Startfilen. Startar servern.
│
├── routes/                   ADRESSERNA. Bara vilken funktion som körs.
│   ├── all-routes.ts         Samlar alla route-filer
│   ├── auth-routes.ts        POST /register, POST /login          (F6)
│   ├── room-routes.ts        /rooms                               (F5, F7)
│   └── booking-routes.ts     /bookings                            (F5)
│
├── controllers/              JOBBET. Läser req, frågar databasen, skickar res.
│   ├── auth-controller.ts    Registrera och logga in              (F6)
│   ├── room-controller.ts    Skapa, hämta, ändra, ta bort rum     (F5)
│   └── booking-controller.ts Bokningar och krockkontroll          (F5)
│
├── middleware/               KONTROLLER som körs FÖRE controllern.
│   ├── request-logger.ts     Skriver "GET /rooms" i terminalen    (F2)
│   ├── validate.ts           Kontrollerar datan med zod           (F5)
│   ├── auth-middleware.ts    Är användaren inloggad? (401)        (F6)
│   ├── admin-middleware.ts   Är användaren admin? (403)           (F7)
│   └── error-handler.ts      Fångar alla fel på ett ställe        (F5)
│
├── schemas/                  ZOD-REGLER. Hur datan ska se ut.
│   ├── user-schemas.ts       username, password                   (F5)
│   ├── room-schemas.ts       name, capacity, type                 (F5)
│   └── booking-schemas.ts    room_id, start_time, end_time        (F5)
│
├── database/                 DATABASEN.
│   ├── database-connection.ts  Kopplingen till PostgreSQL         (F4)
│   ├── schema.sql            Skapar tabellerna
│   ├── seed.sql              Testdata
│   └── queries.sql           Testfrågor
│
├── docs/                     MIN DOKUMENTATION. En kort fil per sak.
│   ├── 1-bocklista.md        Vad är klart, vad är kvar
│   ├── 2-forelasningar.md    Föreläsning → del av projektet
│   ├── 3-receptet.md         Så bygger jag en ny sak
│   ├── 4-sakerhet-regler.md  Fråga 5a–5f, any, säker SQL
│   ├── 5-sakerhet-bocklista.md  Säkerhet per fas
│   ├── 6-lararens-krav.md    Projektbeskrivningen
│   └── 7-trana-pa.md         Vad jag ska träna mer på
│
├── public/                   Frontend (för VG)
├── prisma/                   Används senare
│
├── .env                      Hemligheter. Finns ALDRIG på GitHub.
├── .env.example              Mall för .env, utan riktiga värden
├── package.json              Paket och kortkommandon (npm run ...)
└── stegen.md                 STARTSIDA: mina anteckningar + länkar till docs/
```

## Var lägger jag …?

| Jag ska skriva … | Fil |
|------------------|-----|
| en ny adress, t.ex. `GET /rooms` | `routes/` |
| vad som händer i adressen | `controllers/` |
| en kontroll som körs före, t.ex. inloggning | `middleware/` |
| regler för hur datan ska se ut | `schemas/` |
| SQL för tabellerna | `database/schema.sql` |

## Så går en förfrågan genom projektet

```
Postman / React
   → server.ts
   → middleware/ (logger, validate, auth, admin)
   → routes/
   → controllers/
   → database/ (PostgreSQL)
   → svar tillbaka med statuskod och JSON
```
