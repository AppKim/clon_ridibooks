require 'rails_helper'

describe BookCollection, type: :model do    
    describe '.spotlight' do
        before do
            create_list(:collection, 2)
        end

        let(:method) { described_class.spotlight_collection }
        context 'spotlightが2件の場合' do
            before do
                create_list(:collection, 2, :spotlight)
            end

            it '1件ヒットすること' do
                expect(method).to be_present
            end
        end

        context 'spotlightが０件の場合' do
            it '0件ヒットすること' do
                expect(method).to be_blank
            end
        end
    end
end