require 'spec_helper'

shared_examples 'controllers/index' do |model, resource, attributes, valid_traits, invalid_traits|
  describe '#index' do

    let(:index) { get :index, format: :json }
    let(:tradables) {
      {"#{resource}s"=>expected_records,'meta'=>{'parents'=>
        {'trades'=> JSON.parse(Trade.select(:id, :name, *Trade.props.counter_caches).to_json)},
        'pagination'=> pagination}}
    }
    let(:shopables) {
      {"#{resource}s"=>expected_records,'meta'=>{'parents'=>
        {'trades'=>JSON.parse(Trade.select(:id, :name, *Trade.props.counter_caches).to_json),
        'shops'=>JSON.parse(Shop.select(:id, :name, *Shop.props.counter_caches).to_json)},
        'pagination'=> pagination}}
    }
    let(:otherables) {{"#{resource}s" => expected_records, 'meta' => {'pagination' => pagination}}}
    let(:test!) {
      case resource
      when 'idea', 'shop'
        expect(json_response).to eq(tradables)
      when 'worker'
        expect(json_response).to eq(shopables)
      else
        expect(json_response).to eq(otherables)
      end
    }
    let(:per_page) { Kaminari.config.default_per_page }
    let(:all_records) {
      persisted = records.sort { |r1, r2| r2.id <=> r1.id }
      persisted.map { |record| get_record_attrs(record, attributes) }
    }
    let(:pagination) { {'page' => page, 'count' => count, 'per_page' => per_page, 'pages' => pages} }
    let(:pages) { (count / per_page.to_f).ceil }

    context 'does not exist' do
      let(:expected_records) { [] }
      let(:page) { 1 }
      let(:count) { 0 }

      before { expect(model.count).to be_zero }

      it { get :index, page: page, format: :json }
      it { index }

      after { expect(response.status).to eq(200) }
      after { expect(model.count).to be_zero }
      after { test! }
    end

    context 'exist' do
      before { expect(model.count).to be_zero }

      after { expect(response.status).to eq(200) }
      after { expect(model.count).to eq(count) }

      context 'one page' do
        let!(:records) { FactoryGirl.create_list resource, count }
        let(:expected_records) { all_records.take per_page }
        let(:count) { 3 }
        let(:page) { 1 }

        context 'valid' do
          after { test! }

          context 'without page parameter' do
            it { index }
          end
          context 'with page parameter' do
            it { get :index, page: 1, format: :json }
          end
        end

        context 'invalid' do
          let(:test!) {
            expect {get :index,page:page,format: :json}.to raise_error(ActiveRecord::RecordNotFound)
          }

          context 'negative page' do
            let(:page) { -1 }
            it { test! }
          end
          context 'zero page' do
            let(:page) { 0 }
            it { test! }
          end
          context 'out of bound page' do
            let(:page) { 2 }
            it { test! }
          end
        end
      end

      context 'more than one page' do
        let!(:records) { FactoryGirl.create_list resource, count }
        let(:count) { 21 }

        context 'valid' do
          after { test! }

          context 'first page' do
            let(:expected_records) { all_records.take per_page }
            let(:page) { 1 }

            context 'without a page parameter' do
              it { index }
            end
            context 'with a page parameter' do
              it { get :index, page: '1', format: :json }
            end
          end

          context 'second page' do
            let(:expected_records) { all_records.drop(per_page).take(per_page) }
            let(:page) { 2 }

            it { get :index, page: 2, format: :json }
          end

          context 'third page' do
            let(:expected_records) { all_records.drop(per_page*2).take(per_page) }
            let(:page) { 3 }

            it { get :index, page: 3, format: :json }
          end
        end
      end
    end
  end
end
