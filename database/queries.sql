-- TESTFRÅGOR FÖR BOKNINGSSYSTEMET
-- Samma SQL som API:et kommer att använda. Testade mot hotell_solsidan.
-- Kör en fråga i taget.

-- FRÅGA 1: Simas bokningar (user_id = 2)
-- Används i GET /bookings för en vanlig användare.
-- I API:et kommer user_id från inloggningen (JWT), aldrig från klienten.
SELECT bookings.id, rooms.name, bookings.start_time, bookings.end_time
FROM bookings
JOIN rooms ON rooms.id = bookings.room_id
WHERE bookings.user_id = 2
ORDER BY bookings.start_time;


-- FRÅGA 2: Alla bokningar med användarnamn och rumsnamn
-- Används i GET /bookings för admin.
-- password_hash visas aldrig.
SELECT bookings.id, users.username, rooms.name, bookings.start_time, bookings.end_time
FROM bookings
JOIN users ON users.id = bookings.user_id
JOIN rooms ON rooms.id = bookings.room_id
ORDER BY bookings.start_time;


-- FRÅGA 3: Krockkontroll
-- Vill boka Holmen (room_id = 1) 16/11 kl 10:00–12:00.
-- Regel: gamla börjar innan nya slutar OCH gamla slutar efter att nya börjar.
-- Hittar rader = KROCK → API:et svarar 409.
-- 0 rader = LEDIGT → bokningen får sparas.
SELECT id, user_id, start_time, end_time
FROM bookings
WHERE room_id = 1
AND start_time < '2026-11-16 12:00'
AND end_time > '2026-11-16 10:00';


-- FRÅGA 4: Lediga rum 16/11 kl 10:00–12:00
-- Visar alla rum som INTE har en krockande bokning (subquery).
SELECT rooms.name
FROM rooms
WHERE rooms.id NOT IN (
    SELECT room_id FROM bookings
    WHERE start_time < '2026-11-16 12:00'
    AND end_time > '2026-11-16 10:00'
)
ORDER BY rooms.id;


-- FRÅGA 5: Registrera en ny användare
-- Så här ser det ut när servern skapar ett konto i POST /register.
-- Ingen role skickas: databasen sätter 'User' själv.
-- RETURNING visar den nya raden, men aldrig password_hash.
-- Körs den två gånger: UNIQUE stoppar → API:et svarar 409.
INSERT INTO users (username, password_hash)
VALUES ('lina', 'FAKE-HASH-byts-i-F6')
RETURNING id, username, role;
