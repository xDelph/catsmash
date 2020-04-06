const { GraphQLObjectType, GraphQLInputObjectType, GraphQLNonNull, GraphQLString, GraphQLInt } = require('graphql')

const VoteType = new GraphQLObjectType({
  name: 'VoteType',
  description: 'A vote',

  fields: () => ({
    catId: {
      type: new GraphQLNonNull(GraphQLString),
      description: 'Id of the cat'
    },
    votes: {
      type: new GraphQLNonNull(GraphQLInt),
      description: 'Number of votes'
    }
  })
})

const VoteUIType = new GraphQLObjectType({
  name: 'VoteUIType',
  description: 'A vote for the UI',

  fields: () => ({
    catId: {
      type: new GraphQLNonNull(GraphQLString),
      description: 'Id of the cat'
    },
    votes: {
      type: new GraphQLNonNull(GraphQLInt),
      description: 'Number of votes'
    },
    url: {
      type: new GraphQLNonNull(GraphQLString),
      description: 'Url of the image'
    }
  })
})

const VoteInput = new GraphQLInputObjectType({
  name: 'VoteInput',
  fields: () => ({
    catId: { type: new GraphQLNonNull(GraphQLString) }
  })
})

module.exports = {
  VoteType,
  VoteUIType,
  VoteInput
}
