require 'rails_helper'

describe BookSelection, type: :model do    
    describe '.spotlight_sellection' do
        before do
            create_list(:selection, 2)
        end

        let(:method) { described_class.spotlight_sellection }
        context 'spotlightが2件の場合' do
            before do
                create_list(:selection, 2, :spotlight)
            end

            it '１件ヒットすること' do
                expect(method.size).to eq 2
            end
        end

        context 'spotlightが０件の場合' do
            it '0件ヒットすること' do
                expect(method.size).to eq 0
            end
        end
    end
end