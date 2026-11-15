// ADRESSERNA FÖR RUM, t.ex. GET /rooms och POST /rooms.
// Säger bara VILKEN funktion som ska köras. Själva jobbet görs i room-controller.ts.
// hämtar routes från express
import { Router } from "express";
import { getRooms } from "../controllers/room-controller.js";

// skapar en router för allt som berör rooms
const router = Router();

//get /rooms- visar getRooms
router.get('/', getRooms);

//skickar ut routern så att all-routes.ts kan använda den
export default router;