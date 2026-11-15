[⬅️ Tillbaka till stegen.md](../stegen.md)

# 🧭 Receptet – så bygger jag en ny sak

Förfrågan går alltid samma väg:

```
Postman → server.ts → all-routes.ts → xxx-routes.ts → xxx-controller.ts → databasen
          "dörren"    "receptionen"   "avdelningen"   "den som gör jobbet"
```

Varje ny sak du bygger, som bokningar eller användare, är **samma väg**.
Du ställer dig bara 4 frågor, från höger till vänster:

| # | Fråga | Fil |
|---|-------|-----|
| 1 | Vad ska **göras**? (SQL + svar) | controller |
| 2 | Vilken **adress**? (`get` / `post` + `'/'`) | xxx-routes |
| 3 | Är routern **kopplad**? (`router.use`) | all-routes |
| 4 | Är all-routes **kopplad**? (`app.use`) | server.ts (görs bara en gång) |

**Exempel: bokningar**

1. Skriv `getBookings` i booking-controller.
2. Skriv `router.get('/', getBookings)` i booking-routes.
3. Skriv `router.use('/bookings', bookingRoutes)` i all-routes.
4. Steg 4 är redan klart ✅

### ⌨️ Kodmallar – skriv ordet och tryck Tab

| Steg | Skriv | Du får |
|------|-------|--------|
| 1 | `nycontroller` | ny controller-fil: import + första funktionen |
| 1 | `nyfunktion` | en till funktion i samma controller |
| 1 | `nyfraga` | `pool.query(...)` + `res.json(...)` |
| 2 | `nyrouter` | hela xxx-routes-filen |
| 3 | `nykoppling` | `import` + `router.use` för all-routes |

Tab hoppar till nästa ruta som ska fyllas i. Skriver du ett namn en gång, ändras det på alla ställen samtidigt.

### 📋 Färdigt exempel att kopiera (rum – det fungerar)

**1. controllers/room-controller.ts**
```ts
import type { Request, Response } from 'express';
import { pool } from '../database/database-connection.js';

// Hämtar alla rum
export const getRooms = async (req: Request, res: Response) => {
  const rooms = await pool.query('SELECT * FROM rooms ORDER BY id');
  res.json(rooms.rows);
};
```

**2. routes/room-routes.ts**
```ts
import { Router } from 'express';
import { getRooms } from '../controllers/room-controller.js';

const router = Router();
router.get('/', getRooms);
export default router;
```

**3. routes/all-routes.ts**
```ts
import { Router } from 'express';
import roomRoutes from './room-routes.js';

const router = Router();
router.use('/rooms', roomRoutes);
export default router;
```

**4. server.ts** (bara en gång)
```ts
import allRoutes from './routes/all-routes.js';
app.use(allRoutes);
```

### 🔑 Kom ihåg
| Regel | Exempel |
|-------|---------|
| `export const` → importera **med** `{ }` | `import { getRooms } from ...` |
| `export default` → importera **utan** `{ }` | `import roomRoutes from ...` |
| `./` = samma mapp, `../` = en mapp upp | `'./room-routes.js'`, `'../controllers/...'` |
| Alltid `.js` i slutet av import, även för .ts-filer | `'./room-routes.js'` |
| Inga `()` när du pekar på en funktion | `router.get('/', getRooms)` |
