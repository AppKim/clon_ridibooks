# spec/requests/v1/categories_spec.rb
require 'rails_helper'

describe 'Categories API', type: :request do
    before do
      create(:category, name: '소설', children: [
        '한국소설', '영미소설', '일본소설', '기타 국가 소설',
        '추리/미스터리/스릴러', '독일 소설', '프랑스 소설', '북유럽 소설',
        '중국 소설', '국내 역사소설', '해외 역사소설', '동양 고전문학',
        '서양 고전문학', 'SF 소설', '국내 판타지 소설', '해외 판타지 소설'
      ])
  
      create(:category, name: '에세이/시', children: ['에세이', '시'])
      create(:category, name: '경영/경제', children: [
        '경영일반', '경제일반', '마케팅/세일즈', '제테크/금융/부동산', 'CEO/리더십'
      ])
      create(:category, name: '자기계발', children: [
        '성공/삶의자세', '기획/창의/리더십', '설득/화술/협상', '취업/창업', '여성', '인간관계'
      ])
      create(:category, name: '인문/사회/역사', children: ['인문', '정치/사회', '예술/문화', '역사'])
      create(:category, name: '건강/다이어트', children: ['다이어트/운동/스포츠', '스타일/뷰티', '건강'])
      create(:category, name: '가정/생활', children: ['결혼/임신/출산', '육아/자녀교육', '취미/요리/기타'])
      create(:category, name: '종교', children: ['종교일반', '가톨릭', '기독교(개신교)', '불교', '기타'])
      create(:category, name: '여행', children: ['국내여행', '해외여행'])
      create(:category, name: '외국어', children: ['일반영어', '제2외국어', '어학시험'])
      create(:category, name: '과학', children: ['과학일반', '수학', '자연과학', '응용과학'])
      create(:category, name: '어린이/청소년', children: ['유아', '어린이', '청소년'])
      create(:category, name: '만화 e북', children: ['드라마', '코믹', '판타지/SF'])
      create(:category, name: '웹툰', children: ['국내 순정', '드라마', '액션/무협', '판타지/SF', 'GL', '공포/추리'])
      create(:category, name: '판타지 e북', children: ['정통 판타지'])
      create(:category, name: '진로/교육/교재', children: ['공부법', '진로 탐색', '교재/수험서'])
      create(:category, name: '잡지', children: [
        '경영/재테크', '문학/교양', '여성/패션/뷰티', '디자인/예술',
        '건강/스포츠', '취미/여행/요리', '과학/IT'
      ])
      create(:category, name: '컴퓨터/IT', children: ['IT 비지니스', '개발/프로그래밍', '컴퓨터/앱 활용'])
    end

  describe 'GET /v1/categories' do
    before do
      get '/v1/categories'
    end

    context 'カテゴリーが存在する場合' do
      it 'ステータスコード200を返す' do
        expect(response).to have_http_status(200)
      end

      it 'カテゴリ一覧を返す' do
        json_response = JSON.parse(response.body)
        expect(json_response.size).to eq(18) # 18個の親カテゴリ
      end

      it '正しいカテゴリー名を含む' do
        json_response = JSON.parse(response.body)
        expect(json_response.map { |category| category['name'] }).to include('소설', '에세이/시', '경영/경제', '자기계발', '인문/사회/역사', '건강/다이어트', '가정/생활', '종교', '여행', '외국어', '과학', '어린이/청소년', '만화 e북', '웹툰', '판타지 e북', '진로/교육/교재', '잡지', '컴퓨터/IT')
      end
    end

    context 'カテゴリーが存在しない場合' do
      before do
        Category.delete_all
        get '/v1/categories'
      end

      it '空の配列を返す' do
        json_response = JSON.parse(response.body)
        expect(json_response).to be_empty
      end
    end
  end
end