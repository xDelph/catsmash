const { GraphQLObjectType } = require('graphql')

const getCat = require('./cat/mashField')
const allVotes = require('./votes/allField')
const topFive = require('./votes/topFiveField')
const totalVotes = require('./votes/totalField')

module.exports = new GraphQLObjectType({
  name: 'Query',
  fields: {
    cats: getCat,
    allVotes,
    topFive,
    totalVotes
  }
})
