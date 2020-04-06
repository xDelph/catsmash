const { GraphQLNonNull, GraphQLList } = require('graphql')

const { CatType } = require('./types')
const { getCats } = require('../../database')

function shuffleArray (array) {
  for (let i = array.length - 1; i > 0; i--) {
    const j = Math.floor(Math.random() * (i + 1))
    ;[array[i], array[j]] = [array[j], array[i]]
  }
}

const resolve = async (parent, args) => {
  try {
    console.log('ici')
    const cats = await getCats()
    shuffleArray(cats)

    return cats.slice(0, 2)
  } catch (e) {
    console.error(e)
    return []
  }
}

module.exports = {
  type: new GraphQLNonNull(GraphQLList(new GraphQLNonNull(CatType))),
  resolve
}
