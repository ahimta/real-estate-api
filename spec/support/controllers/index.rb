require 'spec_helper'

shared_examples 'controllers/index' do |model, resource, attributes, valid_traits, invalid_traits|
  describe '#index' do

    let(:index) { get :index, format: :json }

    context 'does not exist' do
      before { expect(model.count).to be_zero }

      it { index }

      after { expect(model.count).to be_zero }
    end

    context 'exist' do
      let(:count) { 3 }
      let(:expected_records) {
        rs = records.map { |record| get_record_attrs(record, attributes) }
      }
      let!(:records) { FactoryGirl.create_list resource, count }

      before { expect(model.count).to eq(count) }

      it { index }

      after { expect(response.status).to eq(200) }
      after { expect(model.count).to eq(count) }
      after do
        pagination = {'page' => 1, 'count' => count, 'per_page' => 10, 'pages' => 1}

        case resource
        when 'idea', 'shop'
          expect(json_response).to eq({"#{resource}s"=>expected_records,'meta'=>{'parents'=>
            {'trades'=> JSON.parse(Trade.all.to_json)},
            'pagination'=> pagination}})
        when 'worker'
          expect(json_response).to eq({"#{resource}s"=>expected_records,'meta'=>{'parents'=>
            {'trades'=>JSON.parse(Trade.all.to_json),'shops'=>JSON.parse(Shop.all.to_json)},
            'pagination'=> pagination}})
        else
          expect(json_response).to eq({"#{resource}s" => expected_records,
            'meta' => {'pagination' => pagination}})
        end
      end
    end
  end
end
