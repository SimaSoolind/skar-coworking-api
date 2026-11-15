[⬅️ Tillbaka till stegen.md](../stegen.md)

# ✅ Min bocklista

Byt `[ ]` till `[x]` när en sak är klar.
Säkerhetens bocklista finns i [5-sakerhet-bocklista.md](5-sakerhet-bocklista.md).

## Fas 1: Projektet startar (F1–F2)
- [x] Mappstruktur klar (routes, controllers, middleware, schemas, database)
- [x] `.env` och `.gitignore` (hemligheter skyddade)
- [x] `.env.example` (mall utan riktiga lösenord)
- [x] Gamla övningsfiler bortflyttade
- [x] `server.ts` startar och svarar på `GET /`
- [x] `npm run dev` startar servern

## Fas 2: Databasen (F4 + Databaser-kursen)
- [x] ER-diagram ritat (dbdiagram.io)
- [X] ER-diagrammet sparat som bild i `database/er-diagram.png`
- [x] `database/schema.sql` – tabellerna users, rooms, bookings
- [x] `database/seed.sql` – 8 users, 7 rum, 8 bokningar
- [x] `database/queries.sql` – testfrågor (JOIN, krockkontroll)
- [X] Kört `npm run db:schema` och `npm run db:seed` från VS Code
- [X] `database/database-connection.ts` – Node kopplas till PostgreSQL med `pg`

## Fas 3: Rum och bokningar (F5)
- [X] `GET /rooms` – hämta alla rum (fungerar i `server.ts`, ska flyttas till `routes/` + `controllers/`)
- [ ] `POST /rooms` – skapa rum
- [ ] `PUT /rooms/:id` – ändra rum
- [ ] `DELETE /rooms/:id` – ta bort rum
- [ ] `GET /bookings` – mina bokningar (User) / alla (Admin)
- [ ] `POST /bookings` – boka, med krockkontroll (409)
- [ ] `PUT /bookings/:id` – ändra bokning
- [ ] `DELETE /bookings/:id` – ta bort bokning
- [ ] Validering med zod i `schemas/` och `middleware/validate.ts` (400)
- [ ] Felhantering i `middleware/error-handler.ts`
- [ ] Loggning i `middleware/request-logger.ts`

## Fas 4: Inloggning (F6)
- [ ] `POST /register` – lösenordet hashas med bcrypt
- [ ] `POST /login` – svarar med en JWT-token
- [ ] `middleware/auth-middleware.ts` – inte inloggad → 401

## Fas 5: Roller (F7)
- [ ] `middleware/admin-middleware.ts` – inte admin → 403
- [ ] Bara admin får hantera rum
- [ ] Bara ägaren eller admin får ändra/ta bort en bokning (403)
- [ ] Admin kan se alla användare och ta bort konton

## Fas 6: Cache och realtid (F8–F9)
- [ ] Redis-cache för `GET /rooms`
- [ ] socket.io: notis när en bokning skapas
- [ ] socket.io: notis när en bokning ändras eller tas bort

## Fas 7: Test, dokumentation och deploy
- [ ] Alla rutter testade i Postman (rätt och fel fall)
- [ ] README.md: beskrivning, så kör du projektet, API-dokumentation
- [ ] Koden på GitHub
- [ ] Databasen i molnet (PostgreSQL, t.ex. Railway eller Render)
- [ ] API:et deployat med en publik URL

## Fas 8: VG
- [ ] Frontend (React) som använder API:et
- [ ] Frontend deployad
