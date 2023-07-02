puts 'Selection START'
unless Selection.find_by(id: 1)
  Selection.create!(
    id: 1,
    title: 'Selection Theme 1'
  )
end
unless Selection.find_by(id: 2)
  Selection.create!(
    id: 2,
    title: 'Selection Theme 2'
  )
end
puts 'Selection END'


