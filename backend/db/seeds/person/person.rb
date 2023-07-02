puts 'Person START'
unless Person.find_by(id: 1)
  Person.create!(
    id: 1,
    person_type: 1, 
    name: '안젤라 애커만',
    introduction: 'Writer'
  )
end
unless Person.find_by(id: 2)
  Person.create!(
    id: 2,
    person_type: 1, 
    name: '에드 마일렛',
    introduction: 'Writer'
  )
end
unless Person.find_by(id: 3)
  Person.create!(
    id: 3,
    person_type: 2, 
    name: '최세민',
    introduction: 'Translator'
  )
end
unless Person.find_by(id: 4)
  Person.create!(
    id: 4,
    person_type: 2, 
    name: '김흥준',
    introduction: 'Translator'
  )
end
puts 'Person END'


