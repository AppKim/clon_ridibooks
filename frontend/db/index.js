const collectionsBestApi = require('./collections_best_api.json')
const categoriesSelectionsApi = require('./categories_categories.json')
const homeApi = require('./home_api.json')
const newreleasesRecentApi = require('./newreleases_recent_api.json')
// Something more

module.exports = () => ({
  collections: {
    best: collectionsBestApi,
    spotlight: [1, 2, 3, 4],
  },
  categories: categoriesSelectionsApi,
  home: homeApi,
  recent: newreleasesRecentApi,
  // Something more
})
