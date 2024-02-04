require 'rails_helper'

describe V1::SpotlightsController, type: :request do
    describe 'GET /v1/spotlights' do

        before do
            create(:book_selection, book: book, selection: selection)
        end

        let(:spotlights_api) do
            -> { get '/v1/spotlights' }
        end
        let(:book) { create(:book, publisher: publisher) }
        let(:publisher) { create(:publisher) }

        context 'spotlightの本が存在する場合' do
            let(:selection) { create(:selection, :fixed_id, :spotlight) }
            let(:response_body) do
                {
                    "collection_id"=>1,
                    "type"=>"SPOTLIGHT",
                    "title"=>"TestSelection",
                    "total_count"=>1,
                    "total_page"=>1,
                    "size"=>15,
                    "books"=>
                    [
                        {
                            "id"=>1,
                            "title"=>"TestBook",
                            "thumnail"=>"TestThumnail",
                            "authors"=>{},
                            "publisher"=>"TestPublisher",
                            "review_summary"=>
                            {
                                "buyer_rating_distribution"=>[],
                                "buyer_rating_average"=>0.0,
                                "buyer_rating_count"=>0,
                                "buyer_review_count"=>0,
                                "total_rating_count"=>0.0,
                                "total_review_count"=>0
                            }
                        }
                    ]
                }.to_json
            end

            it '1件返却されること' do
                spotlights_api.call
                expect(response).to have_http_status 200
                expect(JSON.parse(response.body)[0]['collection_id']).to eq 1
            end
        end

        context 'spotlightの本が存在しない場合' do
            let(:selection) { create(:selection) }

            it '0件返却されること' do
                spotlights_api.call
                expect(response).to have_http_status 404
            end
        end
    end
end