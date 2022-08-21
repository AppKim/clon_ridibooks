export const CollectionsRepository = ($axios) => ({
  get: {
    collections: (id) => $axios.get(`/collections/${id}`),
    spotlight: () => $axios.get('/collections/spotlight'),
    best: () => $axios.$get('/collections/best'),
  },
})
