require 'spec_helper'

describe IdeasController do
  let!(:attributes) { [:id,:body,:trade_id] }
  let!(:resource) { :idea }
  let!(:model) { Idea }

  it_behaves_like 'controllers/index'

  it_behaves_like 'controllers/show'

  it_behaves_like 'controllers/create' do
    let!(:invalid_factories) { [:without_body, :without_trade, :with_nonexistent_trade] }
  end

  it_behaves_like 'controllers/destroy'

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

        context 'with non-existing trade_id' do
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
end
