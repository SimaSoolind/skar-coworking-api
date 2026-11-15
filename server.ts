// STARTFILEN. Körs först.
// Skapar Express-appen, kopplar in middleware och routes, och startar servern med app.listen.
// Flödet: förfrågan → server.ts → middleware → routes → controller → databas → svar
import express from 'express';
// hämta alla adresser från allRoutes
import allRoutes from './routes/all-routes.js';
const app = express();
const port = 3000;

// min middleware
app.use(express.json({ limit: '100kb' }));

app.get('/', (req, res) => {
  console.log('servern startar');
  res.json({ message: 'servern funkar' });
});
app.use(allRoutes);
app.listen(port, () => {
  console.log(`servern körs på ${port}`);
});
