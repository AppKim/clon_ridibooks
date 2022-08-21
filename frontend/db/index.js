const homeBestBooksApi = require('./home_best_books_api.json')
const homeSelectionsApi = require('./home_selections_api.json')
const categoriesSelectionsApi = require('./categories_categories.json')
const homeApi = require('./home_api.json')
// Something more

module.exports = () => ({
  best: homeBestBooksApi,
  selections: homeSelectionsApi,
  categories: categoriesSelectionsApi,
  home: homeApi,
  // Something more
})
