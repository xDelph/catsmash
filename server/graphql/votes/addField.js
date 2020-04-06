const { GraphQLNonNull, GraphQLString } = require('graphql')

const { VoteInput } = require('./types')
const { addVote } = require('../../database')

const resolve = async (parentValue, { input }, context) => {
  try {
    return await addVote(input.catId)
  } catch (e) {
    return e
  }
}
module.exports = {
  type: GraphQLString,
  args: {
    input: {
      type: new GraphQLNonNull(VoteInput)
    }
  },
  resolve
}
