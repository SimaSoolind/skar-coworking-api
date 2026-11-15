[⬅️ Tillbaka till stegen.md](../stegen.md)

# 🔒 Säkerhet – min bocklista

Läs reglerna i [4-sakerhet-regler.md](4-sakerhet-regler.md).

## ✅ Redan säkert i mitt projekt

- [x] `.env` står i `.gitignore` (hemligheter kommer inte till GitHub) – F4, F6
- [x] `.env.example` utan riktiga värden finns – F4
- [x] Databasen nås bara från min dator (`127.0.0.1:5433`) – F3 segmentering
- [x] `role` får `DEFAULT 'User'` i databasen – ingen kan registrera sig som Admin – F3 secure by default
- [x] `CHECK` i databasen stoppar fel värden (roll, typ, kapacitet, tider) – F3 defense-in-depth
- [x] `npm audit` visar 0 sårbarheter (15/11) – F4 SCA
- [x] Dataminimering: users har bara användarnamn, hash och roll – F6 GDPR

## 🔒 Säkerhet per fas (bocka av samtidigt som fasen)

**Fas 3 – Rum och bokningar**
- [ ] Alla SQL-frågor med `$1`, `$2` – F4
- [ ] zod-validering på all body och alla params (400) – F4
- [ ] `express.json({ limit: '100kb' })` – stora anrop stoppas – F2 DoS
- [ ] `helmet()` för säkra HTTP-headers (`npm install helmet`) – F5
- [ ] `error-handler.ts` visar bara "Något gick fel" – inget SQL-fel, ingen stack trace – F5
- [ ] Krockkontroll i servern, inte bara i frontend – F2 STRIDE – T

**Fas 4 – Inloggning**
- [ ] Lösenord hashas med `bcrypt` – aldrig klartext eller SHA-256 – F6
- [ ] `password_hash` skickas aldrig i något svar – F6
- [ ] `JWT_SECRET` är lång och slumpad och står bara i `.env` – F4
- [ ] `jwt.verify(token, secret, { algorithms: ['HS256'] })` – F5
- [ ] Token har kort livstid, t.ex. `expiresIn: '1h'` – F3
- [ ] Rate limiting på `/login` (`express-rate-limit`) – F2, F3
- [ ] Samma felmeddelande för fel användarnamn och fel lösenord – F2 STRIDE – I

**Fas 5 – Roller**
- [ ] Varje skyddad route kollar inloggning (401) och roll (403) – F3 RBAC
- [ ] `user_id` tas från token, aldrig från body – F2 STRIDE – E (IDOR)
- [ ] Bara ägaren eller admin får ändra/ta bort en bokning – F2

**Fas 6 – Cache, realtid och loggning**
- [ ] Inloggningar loggas, både lyckade och misslyckade – F9
- [ ] Loggar innehåller aldrig lösenord eller token – F6, F9
- [ ] socket.io kräver giltig token – F3

**Fas 7 – Deploy**
- [ ] CORS tillåter bara min frontend-adress, inte `*` – F3
- [ ] `NODE_ENV=production` och HTTPS i molnet – F3, F5
- [ ] `npm audit` igen innan inlämning – F4
- [ ] Inga test-routes kvar – F5
