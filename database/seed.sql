-- TESTDATA FÖR BOKNINGSSYSTEMET
-- Körs EFTER schema.sql, från VS Code med: npm run db:seed
-- Ordningen är viktig: users och rooms först, bookings sist.

-- Användare
-- password_hash är påhittad nu. Riktiga hashar skapas med bcrypt i F6.
INSERT INTO users (username, password_hash, role)
VALUES
('admin', 'FAKE-HASH-byts-i-F6', 'Admin'),
('sima', 'FAKE-HASH-byts-i-F6', 'User'),
('anna', 'FAKE-HASH-byts-i-F6', 'User'),
('erik', 'FAKE-HASH-byts-i-F6', 'User'),
('lisa', 'FAKE-HASH-byts-i-F6', 'User'),
('omar', 'FAKE-HASH-byts-i-F6', 'User'),
('maria', 'FAKE-HASH-byts-i-F6', 'User'),
('johan', 'FAKE-HASH-byts-i-F6', 'User');

-- Rum (7 st): tre konferensrum och fyra arbetsplatser
INSERT INTO rooms (name, capacity, type)
VALUES
('Ekrummet', 8, 'conference'),
('Björkrummet', 4, 'conference'),
('solen', 1, 'workspace'),
('månen', 1, 'workspace'),
('stjärna', 1, 'workspace'),
('Mars', 1, 'workspace'),
('Tallrummet', 12, 'conference');

-- Bokningar: user_id och room_id pekar på raderna ovan
-- Ekrummet (1) är FULLBOKAT 16/11 kl 09–17: tre bokningar direkt efter varandra.
-- månen (4) är FULLBOKAD hela dagen 16/11.
-- Tallrummet (7) har inga bokningar alls: alltid ledigt.
INSERT INTO bookings (user_id, room_id, start_time, end_time)
VALUES
(2, 1, '2026-11-16 09:00', '2026-11-16 11:00'),  -- sima, Ekrummet
(3, 1, '2026-11-16 11:00', '2026-11-16 13:00'),  -- anna, Ekrummet
(4, 1, '2026-11-16 13:00', '2026-11-16 17:00'),  -- erik, Ekrummet
(5, 2, '2026-11-16 10:00', '2026-11-16 12:00'),  -- lisa, Björkrummet
(6, 3, '2026-11-17 09:00', '2026-11-17 16:00'),  -- omar, solen
(2, 4, '2026-11-16 08:00', '2026-11-16 17:00'),  -- sima, månen hela dagen
(7, 5, '2026-11-16 08:00', '2026-11-16 12:00'),  -- maria, stjärna förmiddag
(8, 6, '2026-11-18 08:00', '2026-11-18 17:00');  -- johan, Mars


