const collectionsBestApi = require('./collections_best_api.json')
const categoriesSelectionsApi = require('./categories_categories.json')
const homeApi = require('./home_api.json')
const newreleasesRecentApi = require('./newreleases_recent_api.json')
const chartsBooksApi = require('./charts_books_api.json')
const booksApi = require('./books_api.json')
const selectionsBooksApi = require('./selections_books_api.json')
// Something more

module.exports = () => ({
  collections: {
    best: collectionsBestApi,
    spotlight: [1, 2, 3, 4],
  },
  categories: categoriesSelectionsApi,
  home: homeApi,
  recent: newreleasesRecentApi,
  books: chartsBooksApi,
  books_2: booksApi,
  selections: selectionsBooksApi,
  // Something more
})
