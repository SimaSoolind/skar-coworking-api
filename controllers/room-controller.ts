// JOBBET FÖR RUM. Här finns funktionerna som routes pekar på.
// Läser req (params, query, body), frågar databasen och skickar svar med res.status(...).json(...).
// 1.Hämtar typerna för req och res från Express

import type { Request, Response } from "express";
// Hämtar kopplingen till databasen. ../ "en mapp upp"
import { pool } from '../database/database-connection.js'

import type { Room } from "../schemas/room-schemas.js";
// GET/rooms: hämtar alla rum från db, export roule-filen har funktionen.
export const getRooms = async (req:Request, res: Response) => {
    const rooms = await pool.query('SELECT * FROM rooms ORDER BY id');
    const roomList: Room[] = rooms.rows;
    res.json(roomList);
};

