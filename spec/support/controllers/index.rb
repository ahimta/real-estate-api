require 'spec_helper'

shared_examples 'controllers/index' do
  describe '#index' do

    context 'does not exist' do
      before { get :index, format: :json }

      it { expect(model.count).to be_zero }
    end

    context 'exist' do
      let(:count) { 3 }
      let(:expected_records) {
        rs = records.map { |record| get_record_attrs(record, attributes) }
        rs.sort { |r1, r2| r1['name'] <=> r2['name'] }
      }
      let!(:records) { FactoryGirl.create_list resource, count }

      before { expect(model.count).to eq(count) }

      before { get :index, format: :json }

      after { expect(model.count).to eq(count) }

      it { expect(model.count).to eq(count) }

      it { expect(response.status).to eq(200) }

      it do
        pagination = {'page' => 1, 'count' => count, 'per_page' => 10, 'pages' => 1}

        case resource
        when :idea, :shop
          expect(json_response).to eq({"#{resource.to_s}s"=>expected_records,'meta'=>{'parents'=>
            {'trades'=> JSON.parse(Trade.all.to_json)},
            'pagination'=> pagination}})
        when :worker
          expect(json_response).to eq({"#{resource.to_s}s"=>expected_records,'meta'=>{'parents'=>
            {'trades'=>JSON.parse(Trade.all.to_json),'shops'=>JSON.parse(Shop.all.to_json)},
            'pagination'=> pagination}})
        else
          expect(json_response).to eq({"#{resource.to_s}s" => expected_records,
            'meta' => {'pagination' => pagination}})
        end
      end
    end
  end
end
