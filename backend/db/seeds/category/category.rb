# frozen_string_literal: true
puts 'Categories seeding START'

# Create the parent category first
novel_category = Category.create!(name: '소설', depth: 0, parent_id: nil)

essay_category = Category.create!(name: '에세이/시', depth: 0, parent_id: nil)

management_category = Category.create!(name: '경영/경제', depth: 0, parent_id: nil)

selfImprovement_category = Category.create!(name: '자기계발', depth: 0, parent_id: nil)

culturalHistory_category = Category.create!(name: '인문/사회/역사', depth: 0, parent_id: nil)

health_category = Category.create!(name: '건강/다이어트', depth: 0, parent_id: nil)

familyLife_category = Category.create!(name: '가정/생활', depth: 0, parent_id: nil)

religion_category = Category.create!(name: '종교', depth: 0, parent_id: nil)

travel_category = Category.create!(name: '여행', depth: 0, parent_id: nil)

language_category = Category.create!(name: '외국어', depth: 0, parent_id: nil)

science_category = Category.create!(name: '과학', depth: 0, parent_id: nil)

children_category = Category.create!(name: '어린이/청소년', depth: 0, parent_id: nil)

comic_category = Category.create!(name: '만화 e북', depth: 0, parent_id: nil)

webtoon_category = Category.create!(name: '웹툰', depth: 0, parent_id: nil)

fantasy_category = Category.create!(name: '판타지 e북', depth: 0, parent_id: nil)

career_category = Category.create!(name: '진로/교육/교재', depth: 0, parent_id: nil)

magazine_category = Category.create!(name: '잡지', depth: 0, parent_id: nil)

computerIT_category = Category.create!(name: '컴퓨터/IT', depth: 0, parent_id: nil)

# Define the array of novel category names
novel_categories = [
  '한국소설', '영미소설', '일본소설', '기타 국가 소설', 
  '추리/미스터리/스릴러', '독일 소설', '프랑스 소설', '북유럽 소설', 
  '중국 소설', '국내 역사소설', '해외 역사소설', '동양 고전문학', 
  '서양 고전문학', 'SF 소설', '국내 판타지 소설', '해외 판타지 소설'
]

essay_categories = [
  '에세이', '시'
]

management_categories = [
  '경영일반', '경제일반', '마케팅/세일즈', '제테크/금융/부동산', 'CEO/리더십'
]

selfImprovement_categories = [
  '성공/삶의자세', '기획/창의/리더십', '설득/화술/협상', '취업/창업', '여성', '인간관계'
]

culturalHistory_categories = [
  '인문', '정치/사회', '예술/문화', '역사'
]

health_categories = [
  '다이어트/운동/스포츠', '스타일/뷰티', '건강'
]

familyLife_categories = [
  '결혼/임신/출산', '육아/자녀교육', '취미/요리/기타'
]

religion_categories = [
  '종교일반', '가톨릭', '기독교(개신교)', '불교', '기타'
]

travel_categories = [
  '국내여행', '해외여행'
]

language_categories = [
  '일반영어', '제2외국어', '어학시험'
]

science_categories = [
  '과학일반', '수학' '자연과학', '응용과학'
]

children_categories = [
  '유아', '어린이', '청소년'
]

comic_categories = [
  '드라마', '코믹', '판타지/SF'
]

webtoon_categories = [
  '국내 순정', '드라마', '액션/무협', '판타지/SF', 'GL', '공포/추리'
]

fantasy_categories = [
  '정통 판타지'
]

career_categories = [
  '공부법', '진로 탐색', '교재/수험서'
]

magazine_categories = [
  '경영/재테크', '문학/교양', '여성/패션/뷰티', '디자인/예술', '건강/스포츠', '취미/여행/요리', '과학/IT'
]

computerIT_categories = [
  'IT 비지니스', '개발/프로그래밍', '컴퓨터/앱 활용'
]

# Loop through the novel_categories array and create each child category
# using the ID of the newly created parent category
novel_categories.each do |name|
  Category.create!(name: name, depth: 1, parent_id: novel_category.id)
end

essay_categories.each do |name|
  Category.create!(name: name, depth: 1, parent_id: essay_category.id)
end

management_categories.each do |name|
  Category.create!(name: name, depth: 1, parent_id: management_category.id)
end

selfImprovement_categories.each do |name|
  Category.create!(name: name, depth: 1, parent_id: selfImprovement_category.id)
end

culturalHistory_categories.each do |name|
  Category.create!(name: name, depth: 1, parent_id: culturalHistory_category.id)
end

health_categories.each do |name|
  Category.create!(name: name, depth: 1, parent_id: health_category.id)
end

familyLife_categories.each do |name|
  Category.create!(name: name, depth: 1, parent_id: familyLife_category.id)
end

religion_categories.each do |name|
  Category.create!(name: name, depth: 1, parent_id: religion_category.id)
end

travel_categories.each do |name|
  Category.create!(name: name, depth: 1, parent_id: travel_category.id)
end

language_categories.each do |name|
  Category.create!(name: name, depth: 1, parent_id: language_category.id)
end

science_categories.each do |name|
  Category.create!(name: name, depth: 1, parent_id: science_category.id)
end

children_categories.each do |name|
  Category.create!(name: name, depth: 1, parent_id: children_category.id)
end

comic_categories.each do |name|
  Category.create!(name: name, depth: 1, parent_id: comic_category.id)
end

webtoon_categories.each do |name|
  Category.create!(name: name, depth: 1, parent_id: webtoon_category.id)
end

fantasy_categories.each do |name|
  Category.create!(name: name, depth: 1, parent_id: fantasy_category.id)
end

career_categories.each do |name|
  Category.create!(name: name, depth: 1, parent_id: career_category.id)
end

magazine_categories.each do |name|
  Category.create!(name: name, depth: 1, parent_id: magazine_category.id)
end

computerIT_categories.each do |name|
  Category.create!(name: name, depth: 1, parent_id: computerIT_category.id)
end

puts 'Categories seeding END'
