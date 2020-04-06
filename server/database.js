const axios = require('axios')
const fs = require('fs')
const path = require('path')

async function getVotesUI () {
  const cats = await getCats()
  const votes = getVotes()

  return votes.reduce((result, item) => {
    const found = cats.find((c) => c.id === item.catId)

    if (found) return [...result, { ...item, url: found.url }]
    else return result
  }, [])
}

async function addVote (catId) {
  try {
    const cats = await getCats()
    const votes = getVotes()

    const cat = cats.find((c) => c.id === catId)
    if (!cat) return 'Bad input!'

    const vote = votes.find((v) => v.catId === catId)
    if (vote) vote.votes++
    else votes.push({ catId, votes: 1 })

    saveVotes(votes)

    return 'ok'
  } catch (e) {
    console.error(e)
    return 'An error occured, please contact the administrator.'
  }
}

async function getCats () {
  return (await axios.get('https://latelier.co/data/cats.json')).data.images
}

function getVotes () {
  return JSON.parse(fs.readFileSync(path.join(__dirname, '../db/votes.json')))
}

function saveVotes (votes) {
  fs.writeFileSync(path.join(__dirname, '../db/votes.json'), JSON.stringify(votes, null, 4))
}

module.exports = {
  getVotes,
  getVotesUI,
  addVote,
  getCats
}
