const resource = '/selections'

export const SelectionsRepository = ($axios) => ({
  get() {
    return $axios.$get(`${resource}`)
  },
  show(id) {
    return $axios.$get(`${resource}/${id}`)
  },
})
