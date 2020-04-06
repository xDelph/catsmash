const { GraphQLObjectType } = require('graphql')

const addVote = require('./votes/addField')

module.exports = new GraphQLObjectType({
  name: 'Mutation',
  fields: {
    addVote
  }
})
