require 'spec_helper'

shared_examples 'controllers/index' do
  describe '#index' do
    context 'does not exist' do
      it { expect(model.count).to be_zero }
    end

    context 'exist' do
      let(:count) { 7 }
      let(:expected_records) {
        records.map { |record| get_record_attrs(record, attributes) }
      }
      let!(:records) { FactoryGirl.create_list resource, count }

      before { get :index, format: :json }

      it do
        expect(model.count).to eq(count)

        get :index, format: :json

        expect(response.status).to eq(200)
        case resource
        when :idea, :shop
          expect(json_response).to eq({"#{resource.to_s}s" => expected_records,'parents'=>
            {'trades'=> JSON.parse(Trade.all.to_json)}})
        when :material, :worker
          expect(json_response).to eq({"#{resource.to_s}s" => expected_records,'parents'=>
            {'trades'=> JSON.parse(Trade.all.to_json),'shops'=>JSON.parse(Shop.all.to_json)}})
        else
          expect(json_response).to eq({"#{resource.to_s}s" => expected_records})
        end

        expect(model.count).to eq(count)
      end
    end
  end
end
