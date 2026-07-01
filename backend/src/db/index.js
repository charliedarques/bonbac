import pg from 'pg'

// connexion psql = coûteuse à ouvrir
// pool = maintient plusieurs connexions ouvertes et les réutilise à la demande

const { Pool } = pg

const pool = new Pool({
  host: process.env.DB_HOST,
  port: process.env.DB_PORT,
  database: process.env.DB_NAME,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
})

export const query = (text, params) => pool.query(text, params)

pool.connect()
  .then(() => console.log('PostgreSQL connecté'))
  .catch(err => console.error('Erreur connexion PostgreSQL :', err))