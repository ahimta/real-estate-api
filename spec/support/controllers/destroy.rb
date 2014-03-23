require 'spec_helper'

shared_examples 'controllers/destroy' do
  describe '#destroy' do
    context 'does not exist' do
      it { expect(model.count).to be_zero }
      it do
        expect {delete :destroy,id:99,format: :json}.
          to raise_error(ActiveRecord::RecordNotFound)
      end
    end

    context 'exists' do
      let!(:records) { FactoryGirl.create_list resource, count }

      let(:record) { model.last }
      let(:count) { 7 }

      let(:expected_record) { get_record_attrs(record, attributes) }

      it do
        expect(model.count).to eq(count)

        delete :destroy, id: record.id, format: :json

        expect(json_response).to eq(expected_record)
        expect(response.status).to eq(200)

        expect(model.count).to eq(count - 1)
      end
    end
  end
end