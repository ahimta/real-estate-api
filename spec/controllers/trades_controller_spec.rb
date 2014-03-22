require 'spec_helper'

describe TradesController do
  let!(:attributes) { [:id,:name,:description,:shops_count,:ideas_count,:ideas,:shops] }

  it_behaves_like 'controllers/index' do
    let(:resource) { :trade }
    let(:model) { Trade }
  end

  it_behaves_like 'controllers/show' do
    let(:resource) { :trade }
    let(:model) { Trade }
  end

  it_behaves_like 'controllers/destroy' do
    let(:resource) { :trade }
    let(:model) { Trade }
  end

  describe '#create' do
    let(:create) { post :create, params, format: :json }

    context 'valid' do
      let(:params) { {trade: {name: 'name', description: 'description'}} }
      let(:record) { Trade.first }
      let(:expected_record) {
        {'id'=>record.id,'name'=>'name','description'=>'description','ideas_count'=>0,'shops_count'=>0,'ideas'=>[],'shops'=>[]}
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
          {'id'=>id,'name'=>'name','description'=>'description','ideas_count'=>0,'shops_count'=>0,
            'ideas'=>[],'shops'=>[]}
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
end
