// SAMLAR ALLA ROUTES (adresser) på ett ställe.
// Kopplar t.ex. /rooms till room-routes.ts. server.ts behöver då bara hämta den här filen.
//hämta router från express
import { Router } from "express";
 //hämtar routern från export default
 import roomRoutes from './room-routes.js';

 // skapar huvud routern
 const router = Router();
// allt som böjar med /rooms skickas till rooms-routers.ts 
 router.use('/rooms', roomRoutes);
 // skickar ut routern så att servern.ts kan använda det
 export default router;