require 'spec_helper'

describe WorkersController do
  let!(:attributes) {
    [:id,:name,:phone,:lower_price,:higher_price,:rating,:notes,:shop_id,:trade_id]
  }
  let!(:resource) { :worker }
  let!(:model) { Worker }

  it_behaves_like 'controllers/index'

  it_behaves_like 'controllers/show'

  it_behaves_like 'controllers/create' do
    let!(:invalid_factories) {
      [:without_name,:without_trade,:without_shop,
        :with_nonexistent_trade,:with_nonexistent_shop, :with_invalid_low_rating,
        :with_invalid_high_rating]
    }
  end

  it_behaves_like 'controllers/destroy'

  describe '#update' do
    context 'does not exist' do
      it { expect(-> {put :update, id: 99}).to raise_error(ActiveRecord::RecordNotFound) }
    end

    context 'exists' do
      let!(:trade) { FactoryGirl.create :trade }
      let!(:shop) { FactoryGirl.create :shop }
      let!(:record) { FactoryGirl.create :worker }
      let(:update) { put :update, params, format: :json }

      context 'valid' do
        context 'with name and trade_id' do
          let(:params) {
            {id:record.id,worker:{'name'=>'name','phone'=>'phone','lower_price'=>1,'higher_price'=>2,
              'rating'=>3,'notes'=>'notes','shop_id'=>shop.id,'trade_id'=>trade.id}}
          }
          let(:expected_record) {
            h = params[:worker]
            h['id'] = record.id
            h
          }

          it do
            expect(Trade.count).to eq(4)
            expect(Shop.count).to eq(2)
            expect(Worker.count).to eq(1)

            update

            expect(response.status).to eq(200)
            expect(json_response).to eq(expected_record)

            expect(Trade.count).to eq(4)
            expect(Shop.count).to eq(2)
            expect(Worker.count).to eq(1)
          end
        end
        context 'without trade_id' do
          let(:params) {
            {id:record.id,worker:{'name'=>'name','phone'=>'phone','lower_price'=>1,'higher_price'=>2,
              'rating'=>3,'notes'=>'notes','shop_id'=>shop.id}}
          }
          let(:expected_record) {
            h = params[:worker]
            h['trade_id'] = record.trade_id
            h['id'] = record.id
            h
          }

          it do
            expect(Trade.count).to eq(4)
            expect(Shop.count).to eq(2)
            expect(Worker.count).to eq(1)

            update

            expect(response.status).to eq(200)
            expect(json_response).to eq(expected_record)

            expect(Trade.count).to eq(4)
            expect(Shop.count).to eq(2)
            expect(Worker.count).to eq(1)
          end
        end
        context 'without name' do
          let(:params) {
            {id:record.id,worker:{'phone'=>'phone','lower_price'=>1,'higher_price'=>2,
              'rating'=>3,'notes'=>'notes','shop_id'=>shop.id,'trade_id'=>trade.id}}
          }
          let(:expected_record) {
            h = params[:worker]
            h['name'] = record.name
            h['id'] = record.id
            h
          }

          it do
            expect(Trade.count).to eq(4)
            expect(Shop.count).to eq(2)
            expect(Worker.count).to eq(1)

            update

            expect(response.status).to eq(200)
            expect(json_response).to eq(expected_record)

            expect(Trade.count).to eq(4)
            expect(Shop.count).to eq(2)
            expect(Worker.count).to eq(1)
          end
        end
      end

      context 'invalid' do
        let(:errors) {
          record = Worker.new params[:worker]
          record.valid?
          record.errors.to_json
        }

        context 'with non-existing trade_id' do
          let(:params) {
            {id:record.id,worker:{'name'=>'name','rating'=>3,'shop_id'=>shop.id,'trade_id'=>99}}
          }

          it do
            expect(Trade.count).to eq(4)
            expect(Shop.count).to eq(2)
            expect(Worker.count).to eq(1)

            update

            expect(response.status).to eq(400)
            expect(response.body).to eq(errors)

            expect(Trade.count).to eq(4)
            expect(Shop.count).to eq(2)
            expect(Worker.count).to eq(1)
          end
        end
      end
    end
  end
end
