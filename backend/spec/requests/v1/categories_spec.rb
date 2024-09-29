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
        expect(json_response.size).to eq(2) # 2個の親カテゴリ
      end

      it '各カテゴリーに子カテゴリーを含むか確認' do
        json_response = JSON.parse(response.body)
      
        # 小説カテゴリーを確認
        novel_category = json_response.find { |category| category['name'] == '소설' }
        novel_children_names = novel_category['children'].map { |child| child['name'] }
        expect(novel_children_names).to include(
          '한국소설', '영미소설', '일본소설', '기타 국가 소설',
          '추리/미스터리/스릴러', '독일 소설', '프랑스 소설', '북유럽 소설',
          '중국 소설', '국내 역사소설', '해외 역사소설', '동양 고전문학',
          '서양 고전문학', 'SF 소설', '국내 판타지 소설', '해외 판타지 소설'
        )
      
        # エッセイ/詩カテゴリーを確認
        essay_category = json_response.find { |category| category['name'] == '에세이/시' }
        essay_children_names = essay_category['children'].map { |child| child['name'] }
        expect(essay_children_names).to include('에세이', '시')
      end

      it '正しいカテゴリー名を含む' do
        json_response = JSON.parse(response.body)
        expect(json_response.map { |category| category['name'] }).to include('소설', '에세이/시')
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