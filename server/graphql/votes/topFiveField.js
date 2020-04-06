const { GraphQLNonNull, GraphQLList } = require('graphql')

const { VoteUIType } = require('./types')
const { getVotesUI } = require('../../database')

const resolve = async (parent, args) => {
  try {
    return (await getVotesUI()).sort((a, b) => b.votes - a.votes).slice(0, 5)
  } catch (e) {
    console.error(e)
    return []
  }
}

module.exports = {
  type: new GraphQLNonNull(GraphQLList(new GraphQLNonNull(VoteUIType))),
  resolve
}
