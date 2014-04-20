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
      let(:expected_records) {
        rs = records.map { |record| get_record_attrs(record, attributes) }
        rs.sort { |a, b| a['name'] <=> b['name'] }
      }

      before { expect(model.count).to be_zero }

      after { expect(response.status).to eq(200) }
      after { expect(model.count).to eq(count) }

      context 'one page' do
        let!(:records) { FactoryGirl.create_list resource, count }
        let(:count) { 3 }

        it { index }

        after do
          pagination = {'page' => 1, 'count' => count, 'per_page' => 10, 'pages' => 1}

          case resource
          when 'idea', 'shop'
            expect(json_response).to eq({"#{resource}s"=>expected_records,'meta'=>{'parents'=>
              {'trades'=> JSON.parse(Trade.select(:id, :name, *Trade.props.counter_caches).to_json)},
              'pagination'=> pagination}})
          when 'worker'
            expect(json_response).to eq({"#{resource}s"=>expected_records,'meta'=>{'parents'=>
              {'trades'=>JSON.parse(Trade.select(:id, :name, *Trade.props.counter_caches).to_json),'shops'=>JSON.parse(Shop.select(:id, :name, *Shop.props.counter_caches).to_json)},
              'pagination'=> pagination}})
          else
            expect(json_response).to eq({"#{resource}s" => expected_records,
              'meta' => {'pagination' => pagination}})
          end
        end
      end

      context 'multiple' do
        let!(:records) { FactoryGirl.create_list resource, count }
        let(:count) { 21 }

        context 'first page' do
          it { index }

          after do
            pagination = {'page' => 1, 'count' => count, 'per_page' => 10, 'pages' => 3}

            case resource
            when 'idea', 'shop'
              expect(json_response).to eq({"#{resource}s"=>expected_records.take(10),'meta'=>{'parents'=>
                {'trades'=> JSON.parse(Trade.select(:id, :name, *Trade.props.counter_caches).to_json)},
                'pagination'=> pagination}})
            when 'worker'
              expect(json_response).to eq({"#{resource}s"=>expected_records.take(10),'meta'=>{'parents'=>
                {'trades'=>JSON.parse(Trade.select(:id, :name, *Trade.props.counter_caches).to_json),'shops'=>JSON.parse(Shop.select(:id, :name, *Shop.props.counter_caches).to_json)},
                'pagination'=> pagination}})
            else
              expect(json_response).to eq({"#{resource}s" => expected_records.take(10),
                'meta' => {'pagination' => pagination}})
            end
          end
        end

        context 'second page' do
          it { get :index, page: 2, format: :json }

          after do
            pagination = {'page' => 2, 'count' => count, 'per_page' => 10, 'pages' => 3}

            case resource
            when 'idea', 'shop'
              expect(json_response).to eq({"#{resource}s"=>expected_records.drop(10).take(10),'meta'=>{'parents'=>
                {'trades'=> JSON.parse(Trade.select(:id, :name, *Trade.props.counter_caches).to_json)},
                'pagination'=> pagination}})
            when 'worker'
              expect(json_response).to eq({"#{resource}s"=>expected_records.drop(10).take(10),'meta'=>{'parents'=>
                {'trades'=>JSON.parse(Trade.select(:id, :name, *Trade.props.counter_caches).to_json),'shops'=>JSON.parse(Shop.select(:id, :name, *Shop.props.counter_caches).to_json)},
                'pagination'=> pagination}})
            else
              expect(json_response).to eq({"#{resource}s" => expected_records.drop(10).take(10),
                'meta' => {'pagination' => pagination}})
            end
          end
        end

        context 'third page' do
          it { get :index, page: 3, format: :json }

          after do
            pagination = {'page' => 3, 'count' => count, 'per_page' => 10, 'pages' => 3}

            case resource
            when 'idea', 'shop'
              expect(json_response).to eq({"#{resource}s"=>expected_records.drop(20).take(10),'meta'=>{'parents'=>
                {'trades'=> JSON.parse(Trade.select(:id, :name, *Trade.props.counter_caches).to_json)},
                'pagination'=> pagination}})
            when 'worker'
              expect(json_response).to eq({"#{resource}s"=>expected_records.drop(20).take(10),'meta'=>{'parents'=>
                {'trades'=>JSON.parse(Trade.select(:id, :name, *Trade.props.counter_caches).to_json),'shops'=>JSON.parse(Shop.select(:id, :name, *Shop.props.counter_caches).to_json)},
                'pagination'=> pagination}})
            else
              expect(json_response).to eq({"#{resource}s" => expected_records.drop(20).take(10),
                'meta' => {'pagination' => pagination}})
            end
          end
        end

        context 'fourth page' do
          it { expect {get :index, page: 4, format: :json}.to raise_error(ActiveRecord::RecordNotFound) }
        end
      end
    end
  end
end
