require 'rails_helper'

describe V1::HomeController, type: :request do
    describe 'GET /v1/home' do
        let(:home_api) { -> { get '/v1/home' } }

        context 'home apiの正常系' do
            before do
                create(:banner, :fixed_id)
                create(:book_selection, book: book, selection: selection)
            end
            let(:book) { create(:book, publisher: publisher) }
            let(:publisher) { create(:publisher) }
            let(:selection) { create(:selection, :fixed_id) }

            let(:response_body) do
                {
                    "banners" => [{
                        "id" => 1,
                        "title" => "미리 보는 6월 업데이트",
                        "image_url" => "https://picsum.photos/200",
                        "link_url" => "http://localhost:8080/select"
                    }],
                    "selections" => [{
                        "id" => 1,
                        "title" => "TestSelection",
                        "selection_type" => "COLLECTION",
                        "books" => [{
                            "id" => 1,
                            "title" => "TestBook",
                            "thumnail" => "TestThumnail",
                            "authors" => {},
                            "publisher" => "TestPublisher",
                            "review_summary" => {
                                "buyer_rating_distribution" => [],
                                "buyer_rating_average" => 0.0,
                                "buyer_rating_count" => 0,
                                "buyer_review_count" => 0,
                                "total_rating_count" => 0.0,
                                "total_review_count" => 0
                            }
                        }]
                    }]
                }.to_json
            end

            it '200、データが存在する' do
                home_api.call
                expect(response).to have_http_status(200)
                json_response = JSON.parse(response.body)
                expect(json_response).to eq(JSON.parse(response_body))
            end
        end

        context 'home apiのデータがない場合' do
            it '200, 空の配列' do
                home_api.call
                expect(response).to have_http_status(200)
                json_response = JSON.parse(response.body)
                expect(json_response["banners"]).to be_empty
                expect(json_response["selections"]).to be_empty
            end
        end
    end
end