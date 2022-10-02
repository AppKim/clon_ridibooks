const resource = '/selections'

export const SelectionsRepository = ($axios) => ({
    get: {
        books: (id) => $axios.$get(`${resource}/${id}`)
    }
})