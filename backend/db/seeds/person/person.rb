puts 'Person START'
Person.create!(
  id: 1,
  person_type: 1, 
  name: '안젤라 애커만',
  introduction: 'Writer'
)
Person.create!(
  id: 2,
  person_type: 1, 
  name: '안젤라 애커만',
  introduction: 'Writer'
)
Person.create!(
  id: 3,
  person_type: 2, 
  name: '최세민',
  introduction: 'Translator'
)
Person.create!(
  id: 4,
  person_type: 2, 
  name: '김흥준',
  introduction: 'Translator'
)
puts 'Person END'


