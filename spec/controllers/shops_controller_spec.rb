require 'spec_helper'

describe ShopsController do
  let!(:attributes) {
    [:id,:name,:phone,:lower_price,:higher_price,:rating,:material_type,:notes,:trade_id]
  }

  it_behaves_like 'controllers/index' do
    let(:resource) { :shop }
    let(:model) { Shop }
  end

  it_behaves_like 'controllers/show' do
    let(:resource) { :shop }
    let(:model) { Shop }
  end

  it_behaves_like 'controllers/destroy' do
    let(:resource) { :shop }
    let(:model) { Shop }
  end

  describe '#create' do
    let!(:trade) { FactoryGirl.create :trade }
    let(:create) { post :create, params, format: :json }

    context 'valid' do
      let(:params) {
        {shop:{'name'=>'name','phone'=>'phone','lower_price'=>1,'higher_price'=>2,'rating'=>3,
          'material_type'=>'material_type','notes'=>'notes','trade_id'=>trade.id}}
      }
      let(:record) { Shop.first }
      let(:expected_record) {
        h = params[:shop]
        h['id'] = record.id
        h
      }

      it do
        expect(Trade.count).to eq(1)
        expect(Shop.count).to be_zero

        create

        expect(response.status).to eq(201)
        expect(json_response).to eq(expected_record)
        expect(Trade.count).to eq(1)
        expect(Shop.count).to eq(1)
      end
    end

    context 'invalid' do
      let(:errors) {
        record = Shop.new params[:shop]
        record.valid?
        record.errors.to_json
      }

      context 'without trade_id' do
        let(:params) { {shop: {'name'=>'name','phone'=>'phone','lower_price'=>1,'higher_price'=>2}} }

        it do
          expect(Shop.count).to be_zero

          create

          expect(response.status).to eq(400)
          expect(response.body).to eq(errors)
          expect(Shop.count).to be_zero
        end
      end
      context 'without name' do
        let(:params) { {shop: {'phone'=>'phone','trade_id'=>trade.id}} }

        it do
          expect(Shop.count).to be_zero

          create

          expect(response.status).to eq(400)
          expect(response.body).to eq(errors)
          expect(Shop.count).to be_zero
        end
      end
      context 'with non-existing trade_id' do
        let(:params) { {shop: {'name'=>'name','phone'=>'phone','trade_id'=>99}} }

        it do
          expect(Shop.count).to be_zero

          create

          expect(response.status).to eq(400)
          expect(response.body).to eq(errors)
          expect(Shop.count).to be_zero
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
      let!(:shop) { FactoryGirl.create :shop }
      let(:record) { shop }
      let(:update) { put :update, params, format: :json }

      context 'valid' do
        context 'with name and trade_id' do
          let(:params) {
            {id:record.id,shop:{'name'=>'name','phone'=>'phone','lower_price'=>1,'higher_price'=>2,
              'rating'=>3,'material_type'=>'material_type','notes'=>'notes','trade_id'=>trade.id}}
          }
          let(:expected_record) {
            h = params[:shop]
            h['id'] = record.id
            h
          }

          it do
            expect(Trade.count).to eq(2)
            expect(Shop.count).to eq(1)

            update

            expect(response.status).to eq(200)
            expect(json_response).to eq(expected_record)
            expect(Trade.count).to eq(2)
            expect(Shop.count).to eq(1)
          end
        end
        context 'without trade_id' do
          let(:params) {
            {id:record.id,shop:{'name'=>'name','phone'=>'phone','lower_price'=>1,'higher_price'=>2,'rating'=>3,
              'material_type'=>'material_type','notes'=>'notes'}}
          }
          let(:expected_record) {
            h = params[:shop]
            h['trade_id'] = record.trade_id
            h['id'] = record.id
            h
          }

          it do
            expect(Shop.count).to eq(1)

            update

            expect(response.status).to eq(200)
            expect(json_response).to eq(expected_record)
            expect(Shop.count).to eq(1)
          end
        end
        context 'without name' do
          let(:params) {
            {id:record.id,shop:{'phone'=>'phone','lower_price'=>1,'higher_price'=>2,'rating'=>3,
              'material_type'=>'material_type','notes'=>'notes','trade_id'=>trade.id}}
          }
          let(:expected_record) {
            h = params[:shop]
            h['name'] = record.name
            h['id'] = record.id
            h
          }

          it do
            expect(Shop.count).to eq(1)

            update

            expect(response.status).to eq(200)
            expect(json_response).to eq(expected_record)
            expect(Shop.count).to eq(1)
          end
        end
      end

      context 'invalid' do
        let(:errors) {
          record = Shop.new params[:shop]
          record.valid?
          record.errors.to_json
        }

        context 'with non-existing trade_id' do
          let(:params) {
            {id:record.id,shop:{'name'=>'name','phone'=>'phone','lower_price'=>1,'higher_price'=>2,'rating'=>3,
              'material_type'=>'material_type','notes'=>'notes','trade_id'=>99}}
          }

          it do
            expect(Shop.count).to eq(1)

            update

            expect(response.status).to eq(400)
            expect(response.body).to eq(errors)
            expect(Shop.count).to eq(1)
          end
        end
      end
    end
  end
end
