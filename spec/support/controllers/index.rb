require 'spec_helper'

shared_examples 'controllers/index' do
  describe '#index' do
    context 'does not exist' do
      it { expect(model.count).to be_zero }
    end

    context 'exist' do
      let(:count) { 7 }
      let(:expected_records) {
        records.map { |record| get_record_attrs(record, attributes) }
      }
      let!(:records) { FactoryGirl.create_list resource, count }

      before { get :index, format: :json }

      it do
        expect(model.count).to eq(count)

        get :index, format: :json

        expect(response.status).to eq(200)
        expect(json_response).to eq(expected_records)

        expect(model.count).to eq(count)
      end
    end
  end
end
