const { GraphQLNonNull, GraphQLInt } = require('graphql')

const { getVotes } = require('../../database')

const resolve = async (parent, args) => {
  try {
    return getVotes().reduce((result, item) => {
      return result + item.votes
    }, 0)
  } catch (e) {
    console.error(e)
    return 0
  }
}

module.exports = {
  type: new GraphQLNonNull(GraphQLInt),
  resolve
}
