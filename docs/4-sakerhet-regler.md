[⬅️ Tillbaka till stegen.md](../stegen.md)

# 🔒 Säkerhet från första raden – reglerna

Läs mer: 📘 Manual → SAL-handbok → Snabbreferens → **Säkerhetschecklista för en Node/Express-app**.

## Fråga 5 i receptet – ställ den varje gång du gör en ny route

| # | Säkerhetsfråga | Om svaret är ja … | SAL |
|---|----------------|-------------------|-----|
| 5a | Kommer det **text från användaren** till SQL? | använd `$1`, `$2` – aldrig `+` eller `${}` i SQL | F4 SQL injection |
| 5b | Kommer det **data i body / params**? | validera med zod (typ, längd, tillåtna värden) | F4 whitelisting |
| 5c | Får **alla** göra detta? | nej → `auth-middleware` (401) och/eller `admin-middleware` (403) | F3 RBAC |
| 5d | Gäller det **en användares egen rad**? | ta `user_id` från token, aldrig från body. Kolla ägaren (403) | F2 STRIDE – E |
| 5e | Kan det bli **fel**? | `try/catch`. Visa aldrig SQL-fel eller stack trace för användaren | F5 |
| 5f | Skickar jag **känslig data** tillbaka? | skicka aldrig `password_hash`. Bara de kolumner som behövs | F6 dataminimering |

## 🛡 TypeScript och any

| Regel | Exempel |
|-------|---------|
| `"strict": true` i tsconfig.json (✅ redan på) | – |
| Undvik `any` – skriv en egen typ | `type Room = { id: number; name: string; ... }` i `schemas/` |
| `any` från paket → berätta typen | `const roomList: Room[] = rooms.rows;` |
| `req.body` = användarens data → zod | en typ räcker inte (fråga 5b) |

### Var kommer `any` ifrån – och är det farligt?

| Var | Kommer från | Farligt? | Gör så här |
|-----|-------------|----------|------------|
| `res.json(body: any)` | mig – data som går **ut** | ✅ nej | – |
| `result.rows: any[]` | min databas | 🟡 lite | egen typ: `const roomList: Room[] = rooms.rows;` och skicka aldrig `password_hash` (5f) |
| `req.body: any` | **användaren** – data som kommer **in** | ❗ ja | zod (5b) |

> **TypeScript** skyddar mot **mina** misstag (när jag skriver koden).
> **zod** skyddar mot **användarens** data (när servern körs).

## 🧩 Säker SQL – rätt och fel

```ts
// ❌ FARLIGT – användaren kan skriva egen SQL (SQL injection)
await pool.query('SELECT * FROM rooms WHERE id = ' + req.params.id);

// ✅ SÄKERT – $1 byts ut av databasen, texten blir aldrig SQL
await pool.query('SELECT * FROM rooms WHERE id = $1', [req.params.id]);
```
