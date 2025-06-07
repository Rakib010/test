import express from 'express'
import router from './routes/product.route';

const app = express()
const port = 4000;

app.use(express.json())

app.use('/', router)

app.get('/', (req, res) => {
    res.send('Hello World!')
})

app.listen(port, () => {
    console.log(`Express server running on port ${port}`)
})

