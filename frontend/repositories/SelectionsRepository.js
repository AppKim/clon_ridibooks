const resource = '/selections'

export const SelectionsRepository = ($axios) => ({
  get: {
    // books: (id) => $axios.$get(`${resource}/${id}`),
    // TODO: Json Server의 사정상 path의 말미에 id를 붙이면 데이터가 습득이 안되기 때문에 임시로 밑의 코드로 바꿈
    // 백엔드를 연결하게 되면 위의 코드로 변경해서 id에 맞춰서 해당하는 Selection 데이터를 습득하게 해야함
    books: (id) => {
      console.log(id)
      return $axios.$get(`${resource}`)
    },
  },
})
