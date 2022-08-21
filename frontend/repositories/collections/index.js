export const CollectionsRepository = ($axios) => ({
  get: {
    // collections: (id) => $axios.get(`/collections/${id}`),
    // spotlight: () => $axios.get('/collections/spotlight'),
    // best: () => $axios.$get('/collections/best'),
    // 원래는 위와 같은 형태의 api가 정상이지만 json-server 사양상 nested된 route를 생성 안하기 때문에
    // 안에 있는 데이터를 추출해서 반환하는 형식으로 진행
    collections: async (id) => {
      const res = await $axios.get('/collections')
      return res[id]
    },
    spotlight: async () => {
      const { spotlight } = await $axios.get('/collections')
      return spotlight
    },
    best: async () => {
      const { best } = await $axios.$get('/collections')
      return best
    },
  },
})
