require 'rails_helper'

describe V1::HomeController, type: :request do
    describe 'GET /v1/home' do
        before do
            create(:banner)
            create(:book_selection, book: book, selection: selection)
        end

        let(:home_api) { -> { get '/v1/home' } }
        let(:book) { create(:book, publisher: publisher) }
        let(:publisher) { create(:publisher) }
        let(:selection) { create(:selection) }

        context 'home apiの正常系' do
            it '200、データが存在する' do
                home_api.call
                expect(response).to have_http_status(200)
                json_response = JSON.parse(response.body)
                expect(json_response["banners"].length).to be > 0
                expect(json_response["selections"].length).to be > 0
            end
        end

        context 'home apiのデータがない場合' do
            before do
                Banner.delete_all
                BookSelection.delete_all
                Selection.delete_all
            end

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