export const TopRepository = ($axios) => ({
  get: {
    home: () => $axios.$get('/home'),
  },
})
