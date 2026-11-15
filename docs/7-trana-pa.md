[⬅️ Tillbaka till stegen.md](../stegen.md)

# 🔁 Det här ska jag träna på

Från kontrollfrågorna och kodningen 15/11. Bocka av när det sitter.

## Kontrollfrågor 15/11 – 8 av 8 rätt ⭐

✅ Det här kan jag:
- `export` – andra filer får använda funktionen
- `req` = frågan, `res` = svaret
- `pool` = sladden till databasen
- `await` = vänta på databasen
- `Room[]` = en lista med rum
- `getRooms` utan `()` = pekar på funktionen, den körs senare
- adressen byggs ihop: `/rooms` + `/` = `/rooms`
- `limit: '100kb'` stoppar för stora anrop (DoS)

## 🔁 Träna mer på

- [ ] **Samma namn överallt.** Namnet jag skapar (`const rooms`, `res`) måste stavas exakt likadant där jag använder det. Byt namn med **F2**.
- [ ] **Ordningen i en pilfunktion:** `export const namn = async (req: Request, res: Response) => { };`
- [ ] **Ordningen i server.ts:** först middleware → sedan routes → sist `app.listen`.
- [ ] **`limit` och rate limit är olika saker:**

| | Stoppar | När |
|---|---|---|
| `limit: '100kb'` | ett anrop som är för **STORT** | ✅ gjort |
| rate limit (`express-rate-limit`) | för **MÅNGA** anrop (t.ex. 1000 st) | Fas 4, på `/login` |

- [ ] **Missing script?** Skriv `pwd` och kolla att jag står i `HotellSkar-api`.
