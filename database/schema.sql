-- SCHEMA FÖR HOTELLETS BOKNINGSSYSTEM
-- Skapar tabellerna users, rooms och bookings.
-- Körs från VS Code med: npm run db:schema

-- Tar bort gamla tabeller först, så att filen kan köras om.
-- bookings först, eftersom den pekar på users och rooms.
-- OBS: all data i tabellerna försvinner. Använd bara med testdata.
DROP TABLE IF EXISTS bookings, rooms, users;



-- Tabell 1: users
-- Alla som kan logga in. Admin är en vanlig användare med rollen 'Admin'.

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    -- lösen ordet sparas ej i klar text, bara hashat med bcrypt
    password_hash VARCHAR(255) NOT NULL, 
    -- Nya användare blir User om inte något annat anges.
    role VARCHAR(10) NOT NULL DEFAULT 'User',
    CONSTRAINT ck_role CHECK (role IN ('User', 'Admin')) 

);
--Tabell nr 2 rummen kan bokas
CREATE TABLE rooms (
    id SERIAL PRIMARY KEY, 
    name VARCHAR(100) UNIQUE NOT NULL,
    -- ETT RUM MÅSTE RYMMA MINST ENM PERSON
   capacity INT NOT NULL,
   CONSTRAINT ck_capacity CHECK (capacity > 0),
   type VARCHAR(20) NOT NULL,
    -- bara två typer av rum är tillåtna
    CONSTRAINT ck_type CHECK ( type IN ('workspace', 'conference'))
);

-- kopplings tabell mellan users och rooms
-- den har egen id, så att samma användrae kan boka samma rum många gånger.

CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    room_id INT NOT NULL,
    start_time TIMESTAMP NOT NULL,
    end_time TIMESTAMP NOT NULL,
    -- slut tiden måste vara efter start tiden
    CONSTRAINT ck_time CHECK (end_time > start_time),
    -- CASCADE: tas en användare bort försvinner hennes bokningar
    CONSTRAINT fk_booking_user FOREIGN KEY (user_id)
    REFERENCES users(id) ON DELETE CASCADE,
    -- med cascade kan ett rum tas bort och även rummets bokningar.
    CONSTRAINT fk_booking_room FOREIGN KEY (room_id)
    REFERENCES rooms(id) ON DELETE CASCADE
    

);