require 'spec_helper'

describe IdeasController do
  describe '#index' do
    let(:index) { get :index }

    context 'exist' do
      let(:expected_records) {
        records.map do |record|
          {'id' => record.id, 'body' => record.body, 'trade_id' => record.trade_id}
        end
      }
      let!(:records) { FactoryGirl.create_list :idea, 7 }

      it do
        index

        expect(json_response).to eq(expected_records)
        expect(response.status).to eq(200)
      end
    end
  end

  describe '#show' do
    context 'exists' do
      let(:id) { Idea.last.id }
      let(:record) { Idea.find id }
      let(:show) { get :show, id: id, format: :json }

      context 'with ideas' do
        let!(:records) { FactoryGirl.create_list :idea, 7 }
        let(:expected_record) {
          {'id' => record.id, 'body' => record.body, 'trade_id' => record.trade_id}
        }

        it do
          show

          expect(json_response).to eq(expected_record)
          expect(response.status).to eq(200)
        end
      end
    end
    context 'does not exist' do
      let(:show) { get :show, id: 99, format: :json }

      it {expect(-> { show }).to raise_error(ActiveRecord::RecordNotFound)}
    end
  end

  describe '#create' do
    let!(:trade) { FactoryGirl.create :trade }
    let(:create) { post :create, params, format: :json }

    context 'valid' do
      let(:params) { {idea: {body: 'body', trade_id: trade.id}} }
      let(:record) { Idea.first }
      let(:expected_record) {
        {'id'=>record.id,'body'=>'body','trade_id'=>trade.id}
      }

      it do
        expect(Trade.count).to eq(1)
        expect(Idea.count).to be_zero

        create

        expect(response.status).to eq(201)
        expect(json_response).to eq(expected_record)
        expect(Trade.count).to eq(1)
        expect(Idea.count).to eq(1)
      end
    end

    context 'invalid' do
      let(:errors) {
        record = Idea.new params[:idea]
        record.valid?
        record.errors.to_json
      }

      context 'without trade_id' do
        let(:params) { {idea: {body: 'body'}} }

        it do
          expect(Idea.count).to be_zero

          create

          expect(response.status).to eq(400)
          expect(response.body).to eq(errors)
          expect(Idea.count).to be_zero
        end
      end
      context 'without body' do
        let(:params) { {idea: {trade_id: trade.id}} }

        it do
          expect(Idea.count).to be_zero

          create

          expect(response.status).to eq(400)
          expect(response.body).to eq(errors)
          expect(Idea.count).to be_zero
        end
      end
      pending 'with non-existing trade_id' do
        let(:params) { {idea: {body: 'body', trade_id: 99}} }

        it do
          expect(Idea.count).to be_zero

          create

          expect(response.status).to eq(400)
          expect(response.body).to eq(errors)
          expect(Idea.count).to be_zero
        end
      end
    end
  end

  describe '#update' do
    context 'does not exist' do
      it { expect(-> {put :update, id: 99}).to raise_error(ActiveRecord::RecordNotFound) }
    end

    context 'exists' do
      let!(:trade) { FactoryGirl.create :trade }
      let!(:idea) { FactoryGirl.create :idea }
      let(:record) { idea }
      let(:update) { put :update, params, format: :json }

      context 'valid' do
        context 'with body and trade_id' do
          let(:params) { {id: record.id, idea: {body: 'body', trade_id: trade.id}} }
          let(:expected_record) {
            {'id'=>record.id,'body'=>'body','trade_id'=>trade.id}
          }

          it do
            expect(Trade.count).to eq(2)
            expect(Idea.count).to eq(1)

            update

            expect(response.status).to eq(200)
            expect(json_response).to eq(expected_record)
            expect(Trade.count).to eq(2)
            expect(Idea.count).to eq(1)
          end
        end
        context 'without trade_id' do
          let(:params) { {id: record.id, idea: {body: 'body'}} }
          let(:expected_record) {
            {'id'=>record.id,'body'=>'body','trade_id'=>record.trade_id}
          }

          it do
            expect(Idea.count).to eq(1)

            update

            expect(response.status).to eq(200)
            expect(json_response).to eq(expected_record)
            expect(Idea.count).to eq(1)
          end
        end
        context 'without body' do
          let(:params) { {id: record.id, idea: {trade_id: trade.id}} }
          let(:expected_record) {
            {'id'=>record.id,'body'=>record.body,'trade_id'=>trade.id}
          }

          it do
            expect(Idea.count).to eq(1)

            update

            expect(response.status).to eq(200)
            expect(json_response).to eq(expected_record)
            expect(Idea.count).to eq(1)
          end
        end
      end

      context 'invalid' do
        let(:errors) {
          record = Idea.new params[:idea]
          record.valid?
          record.errors.to_json
        }

        pending 'with non-existing trade_id' do
          let(:params) { {id: record.id, idea: {body: 'body', trade_id: 99}} }

          it do
            expect(Idea.count).to eq(1)

            update

            expect(response.status).to eq(400)
            expect(response.body).to eq(errors)
            expect(Idea.count).to eq(1)
          end
        end
      end
    end
  end

  describe '#destroy' do
    context 'exists' do
      let(:expected_record) { {'id'=>record.id,'body'=>record.body,'trade_id'=>record.trade_id} }
      let!(:record) { FactoryGirl.create :idea }
      let(:destroy) { delete :destroy, id: record.id, format: :json }

      it do
        expect(Trade.count).to eq(1)
        expect(Idea.count).to eq(1)

        destroy

        expect(json_response).to eq(expected_record)
        expect(response.status).to eq(200)

        expect(Trade.count).to eq(1)
        expect(Idea.count).to be_zero
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
