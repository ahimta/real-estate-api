require 'spec_helper'

shared_examples 'controllers/destroy' do |model, resource, attributes, valid_traits, invalid_traits|
  describe '#destroy' do

    context 'does not exist' do
      it { expect(model.count).to be_zero }
      it do
        expect {delete :destroy,id:99,format: :json}.
          to raise_error(ActiveRecord::RecordNotFound)
      end
    end

    context 'exists' do
      let(:expected_record) { get_record_attrs(record, attributes) }
      let!(:records) { FactoryGirl.create_list resource, count }
      let(:record) { model.last }
      let(:count) { 3 }

      before { expect(model.count).to eq(count) }

      it { delete :destroy, id: record.id, format: :json }

      after { expect(json_response).to eq({resource => expected_record}) }
      after { expect(model.count).to eq(count - 1) }
      after { expect(response.status).to eq(200) }
    end
  end
end
