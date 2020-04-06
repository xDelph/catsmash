const { GraphQLNonNull, GraphQLObjectType, GraphQLString } = require('graphql')

const CatType = new GraphQLObjectType({
  name: 'CatType',
  description: 'A cat',

  fields: () => ({
    url: {
      type: new GraphQLNonNull(GraphQLString),
      description: 'Url of the image '
    },
    id: {
      type: new GraphQLNonNull(GraphQLString),
      description: 'The id of the image'
    }
  })
})

module.exports = {
  CatType
}
