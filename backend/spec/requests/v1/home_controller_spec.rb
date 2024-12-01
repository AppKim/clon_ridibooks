require 'rails_helper'

describe V1::HomeController, type: :request do
    describe 'GET /v1/home' do
        let(:home_api) { -> { get '/v1/home' } }

        context 'home apiの正常系' do
            before do
                create(:banner, id: 2)
                create(:book_collection, book: book, collection: collection)
            end
            let(:book) { create(:book, publisher: publisher, created_at: _20190128, updated_at: _20190128) }
            let(:_20190128) { Time.parse("2019-01-28T00:00:00.000Z") }
            let(:publisher) { create(:publisher, id: 16) }
            let(:collection) { create(:collection, id: 2) }

            let(:response_body) do
                {
                    "banners" => [{
                        "id" => 2,
                        "title" => "미리 보는 6월 업데이트",
                        "image_url" => "https://picsum.photos/200",
                        "link_url" => "http://localhost:8080/select"
                    }],
                    "collections" => [{
                        "collection_id" => 2,
                        "title" => "TestSelection",
                        "collection_type" => "COLLECTION",
                        "total_count": 1,
                        "total_page": 1,
                        "size": 15,
                        "books" => [{"content"=>"TestContent", "created_at"=>_20190128, "ebook_publish_date"=>nil, "id"=>1, "introduction"=>"TestIntrodction", "paper_book_publish_date"=>nil, "publisher_id"=>16, "publisher_review"=>nil, "thumnail"=>"TestThumnail", "title"=>"TestBook", "updated_at"=>_20190128}]
                    }]
                }.to_json
            end

            it '200、データが存在する' do
                home_api.call
                expect(response).to have_http_status(200)
                json_response = JSON.parse(response.body)
                collection.reload
                expect(json_response).to eq(JSON.parse(response_body))
            end
        end

        context 'home apiのデータがない場合' do
            it '200, 空の配列' do
                home_api.call
                expect(response).to have_http_status(200)
                json_response = JSON.parse(response.body)
                expect(json_response["banners"]).to be_empty
                expect(json_response["collections"]).to be_empty
            end
        end
    end
end