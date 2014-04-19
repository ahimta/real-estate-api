require 'spec_helper'

shared_examples 'controllers/index' do
  describe '#index' do

    context 'does not exist' do
      it { expect(model.count).to be_zero }
    end

    context 'exist' do
      let(:count) { 3 }
      let(:expected_records) {
        rs = records.map { |record| get_record_attrs(record, attributes) }
        rs.sort { |r1, r2| r1['name'] <=> r2['name'] }
      }
      let!(:records) { FactoryGirl.create_list resource, count }

      before { get :index, format: :json }

      it do
        expect(model.count).to eq(count)

        get :index, format: :json

        expect(response.status).to eq(200)
        case resource
        when :idea, :shop
          expect(json_response).to eq({"#{resource.to_s}s"=>expected_records,'meta'=>{'parents'=>
            {'trades'=> JSON.parse(Trade.all.to_json)},
            'pagination'=>{'page' => 1, 'count' => count}}})
        when :worker
          expect(json_response).to eq({"#{resource.to_s}s"=>expected_records,'meta'=>{'parents'=>
            {'trades'=>JSON.parse(Trade.all.to_json),'shops'=>JSON.parse(Shop.all.to_json)},
            'pagination'=>{'page' => 1, 'count' => count}}})
        else
          expect(json_response).to eq({"#{resource.to_s}s" => expected_records,
            'meta' => {'pagination' => {'page' => 1, 'count' => count}}})
        end

        expect(model.count).to eq(count)
      end
    end
  end
end
