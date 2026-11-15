// ZOD-REGLER FÖR RUM. (F5)
// name, capacity (minst 1) och type (workspace eller conference). Alltid .strict().

// Så ser ett rum ut i databasen (samma kolumner som i schema.sql)
export type Room = {
  id: number;
  name: string;
  capacity: number;
  type: 'workspace' | 'conference';
};
