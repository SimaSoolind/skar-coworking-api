// KOPPLINGEN TILL DATABASEN.
// Skapar EN Prisma-klient som hela appen använder. Adressen till databasen hämtas från .env.
// Läser in .env, så att process.env.DATABASE_URL finns
import 'dotenv/config'

//hämtar paketet pg, den pratar med PostgreSQL
import pg from 'pg';
// tar ut pool från paketet

export const pool = new pg.Pool({
    connectionString: process.env.DATABASE_URL
});