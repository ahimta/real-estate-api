require 'spec_helper'

describe TradesController do
  describe '#index' do
    let(:index) { get :index, format: :json }

    context 'without ideas' do
      let(:expected_records) {
        records.map do |record|
          {'id' => record.id, 'name' => record.name, 'description' => record.description,
            'ideas_count' => 0, 'ideas' => []}
        end
      }
      let!(:records) { FactoryGirl.create_list :trade, 7 }

      it do
        index

        expect(json_response).to eq(expected_records)
        expect(response.status).to eq(200)
      end
    end
    context 'with ideas' do
      let!(:records) { FactoryGirl.create_list :trade_with_ideas, 7 }
      let(:expected_records) {
        records.map do |record|
          {'id' => record.id, 'name' => record.name, 'description' => record.description,
            'ideas_count' => 7, 'ideas' => record.ideas.map { |idea| get_record_attributes(idea) }}
        end
      }

      it do
        index

        expect(json_response).to eq(expected_records)
        expect(response.status).to eq(200)
      end
    end
  end

  describe '#show' do
    context 'exists' do
      let(:count) { 7 }
      let(:id) { Trade.last.id }
      let(:record) { Trade.find id }
      let(:show) { get :show, id: id, format: :json }

      context 'with ideas' do
        let!(:records) { FactoryGirl.create_list :trade_with_ideas, count }
        let(:expected_record) {
          {'id' => record.id, 'name' => record.name, 'description' => record.description,
            'ideas_count' => count, 'ideas' => record.ideas.map { |idea| get_record_attributes(idea) }}
        }

        it do
          show

          expect(json_response).to eq(expected_record)
          expect(response.status).to eq(200)
        end
      end
      context 'with no ideas' do
        let!(:records) { FactoryGirl.create_list :trade, count }
        let(:expected_record) {
          {'id' => record.id, 'name' => record.name, 'description' => record.description,
            'ideas_count' => 0, 'ideas' => [] }
        }

        it do
          show

          expect(json_response).to eq(expected_record)
          expect(response.status).to eq(200)
        end
      end
    end
    context 'does not exist' do
      it {expect(-> {get :show,id:99,format: :json }).to raise_error(ActiveRecord::RecordNotFound)}
    end
  end

  describe '#create' do
    let(:create) { post :create, params, format: :json }

    context 'valid' do
      let(:params) { {trade: {name: 'name', description: 'description'}} }
      let(:record) { Trade.first }
      let(:expected_record) {
        {'id'=>record.id,'name'=>'name','description'=>'description','ideas_count'=>0,'ideas'=>[]}
      }

      it do
        expect(Trade.count).to be_zero

        create

        expect(response.status).to eq(201)
        expect(json_response).to eq(expected_record)
        expect(Trade.count).to eq(1)
      end
    end
    context 'invalid' do
      let(:params) { {trade: {name: '', description: 'description'}} }
      let(:errors) {
        record = Trade.new name: '', description: 'description'
        record.valid?
        record.errors.to_json
      }

      it do
        expect(Trade.count).to be_zero

        create

        expect(response.status).to eq(400)
        expect(response.body).to eq(errors)
        expect(Trade.count).to be_zero
      end
    end
  end

  describe '#update' do
    let(:update) { put :update, params, format: :json }

    context 'exists' do
      let!(:count) { 7 }
      let!(:records) { FactoryGirl.create_list :trade, count }
      let(:id) { Trade.first.id }

      context 'valid' do
        let(:params) { {'id'=>id,'trade'=>{'name'=>'name','description'=>'description'}} }
        let(:expected) {
          {'id'=>id,'name'=>'name','description'=>'description','ideas_count'=>0,'ideas'=>[]}
        }
        it do
          count = Trade.count

          update

          expect(response.status).to eq(200)
          expect(json_response).to eq(expected)
          expect(Trade.count).to eq(count)
        end
      end
      context 'invalid' do
        let(:params) { {'id'=>id,'trade'=>{'name'=>'','description'=>'description'}} }
        let(:expected) {
          record = Trade.new 'name'=>'','description'=>'description'
          record.valid?
          record.errors.to_json
        }
        it do
          count = Trade.count

          update

          expect(response.status).to eq(400)
          expect(response.body).to eq(expected)
          expect(Trade.count).to eq(count)
        end
      end
    end
    context 'does not exist' do
      let(:params) { {id: 99, trade:{name: 'name', description: 'description'}} }

      it { expect(-> { update }).to raise_error(ActiveRecord::RecordNotFound) }
    end
  end

  describe '#destroy' do
    context 'exists' do
      let(:expected_record) { {'id' => record.id, 'name' => record.name,
          'description' => record.description, 'ideas_count' => 0, 'ideas' => []} }
      let(:destroy) { delete :destroy, id: record.id, format: :json }

      context 'with no ideas' do
        let!(:record) { FactoryGirl.create :trade }

        it do
          expect(Trade.count).to eq(1)

          destroy

          expect(json_response).to eq(expected_record)
          expect(response.status).to eq(200)
          expect(Trade.count).to be_zero
        end
      end
      context 'with ideas' do
        let!(:record) { FactoryGirl.create :trade_with_ideas }

        it do
          expect(Trade.count).to eq(1)
          expect(Idea.count).to be > 1

          destroy

          expect(response.status).to eq(200)
          expect(Trade.count).to be_zero
          expect(Idea.count).to be_zero
        end
      end
    end
    context 'does not exist' do
      it do
        expect(-> { delete :destroy, id: 99, format: :json }).
          to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
