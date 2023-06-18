puts 'Banners START'
Banners.create!(
    id: 1,
    image_url: 'https://picsum.photos/200', 
    link_url: 'http://localhost:8080/select',
    title: '미리 보는 6월 업데이트'
  )
Banners.create!(
    id: 2,
    image_url: 'https://picsum.photos/200', 
    link_url: 'http://localhost:8080/select',
    title: '도전 6월 리디셀렉트'
  )
Banners.create!(
    id: 3,
    image_url: 'https://picsum.photos/200', 
    link_url: 'http://localhost:8080/select',
    title: '살다가 문득 고전이 생각나는 날'
  )
Banners.create!(
    id: 4,
    image_url: 'https://picsum.photos/200', 
    link_url: 'http://localhost:8080/select',
    title: '익숙한 듯 낯선 평범한 일상의 균열'
  )
puts 'Banners END'