const express = require('express')
const graphqlHTTP = require('express-graphql')
const path = require('path')
const cors = require('cors')

const schema = require('./graphql')

// The root provides a resolver function for each API endpoint
const root = {
  hello: () => {
    return 'Hello world!'
  }
}

const app = express()

// Cors (BAD cors)
app.use(cors())

app.get('api/', (req, res) => {
  res.send('Hiiiii')
})

app.use(
  '/api/graphql',
  graphqlHTTP({
    schema,
    rootValue: root,
    graphiql: true
  })
)

// Integrate UI static files
app.use(express.static(path.join(__dirname, '../build')))
app.get('/*', (req, res) => {
  res.sendFile(path.join(__dirname, '../build/index.html'))
})

const PORT = process.env.PORT || 8080
app.listen(PORT)
console.log(`Running a server at http://::PORT/api`)
console.log(`Running a GraphQL API server at http://::PORT/api/graphql`)
