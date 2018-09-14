const express = require('express')
const next = require('next')

const dev = process.env.NODE_ENV !== 'production'
const app = next({ dev })
const handle = app.getRequestHandler()
const port = process.env.PORT || 3000;
const os = require('os')

app.prepare()
    .then(() => {
        const server = express()

        server.get('/p/:id', (req, res) => {
            const actualPage = '/post'

            const queryParams = { id: req.params.id }
            app.render(req, res, actualPage, queryParams)
        })

        server.get('*', (req, res) => {
          // console.log('res', res)
            res.hostname = os.hostname()
            return handle(req, res)
        })

        server.listen(port, (err) => {
            if (err) throw err
            console.log('> Ready on http://localhost:'+port)
            console.log('> env :'+process.env.NODE_ENV)
        })
    })
    .catch((ex) => {
        console.error(ex.stack)
        process.exit(1)
    })