import express from 'express'
import cors from 'cors'
import helmet from 'helmet'
import './db/index.js'

const app = express()

app.use(helmet()) // ajout de headers HTTP de sécurité
app.use(cors())
app.use(express.json())

app.get('/health', (req, res) => {
  res.json({ status: 'ok', app: 'BonBac API' })
})

export default app