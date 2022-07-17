const homeBestBooksApi = require('./home_best_books_api.json')
const homeSelectionsApi = require('./home_selections_api.json')
// Something more

module.exports = () => ({
  best: homeBestBooksApi,
  selections: homeSelectionsApi,
  // Something more
})
