require 'spec_helper'

shared_examples 'controllers/show' do
  describe '#show' do
    context 'exists' do
      let!(:records) { FactoryGirl.create_list resource, count }

      let(:record) { model.last }
      let(:count) { 7 }

      let(:expected_record) { get_record_attrs(record, attributes) }

      it do
        expect(model.count).to eq(count)

        get :show, id: record.id, format: :json

        expect(response.status).to eq(200)
        expect(json_response).to eq(expected_record)

        expect(model.count).to eq(count)
      end
    end

    context 'does not exist' do
      it { expect {get :show,id: 99,format: :json}.to raise_error(ActiveRecord::RecordNotFound) }
    end
  end
end
