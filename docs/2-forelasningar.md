[⬅️ Tillbaka till stegen.md](../stegen.md)

# 📚 Föreläsning → vad jag gör i projektet

Läs mer i handboken: 📘 Manual → Node.js-handbok → F1–F9.

| Föreläsning | Vad den lär mig | Var i projektet | Status |
|-------------|-----------------|-----------------|--------|
| **F1** Intro till Node | npm, paket, `package.json` | `package.json`, `npm run ...` | ✅ |
| **F2** Express | server, routes, middleware | `server.ts`, `middleware/request-logger.ts` | 🟡 server + Router klar, logger kvar |
| **F3** Asynkront | `async`, `await`, `try/catch` | alla controllers som pratar med databasen | 🟡 `await` i GET /rooms |
| **F4** Databaser | SQL, `pg`, Pool | `database/` | ✅ |
| **F5** REST API | CRUD, statuskoder, zod, Postman | `routes/`, `controllers/`, `schemas/`, `middleware/validate.ts` | 🟡 GET /rooms klar (routes + controller, 15/11) |
| **F6** Säkerhet och inloggning | bcrypt, JWT | `auth-routes.ts`, `auth-controller.ts`, `auth-middleware.ts` | ⏳ |
| **F7** Roller (RBAC) | User och Admin | `admin-middleware.ts` | ⏳ |
| **F8** Optimera och skala | Redis-cache, loggning | `GET /rooms` med cache | ⏳ |
| **F9** Realtid | socket.io | notiser vid bokning | ⏳ |
| **Projektmanualen** | README, GitHub, deploy | `README.md`, molnet | ⏳ |

✅ = klart  🟡 = påbörjat  ⏳ = inte än
