require 'spec_helper'

shared_examples 'controllers/show' do |model, resource, attributes, valid_traits, invalid_traits|
  describe '#show' do
    context 'exists' do
      let(:expected_record) { {resource => get_record_attrs(record, attributes)} }
      let!(:records) { FactoryGirl.create_list resource, count }
      let(:record) { model.last }
      let(:count) { 3 }

      before { expect(model.count).to eq(count) }
      before { get :show, id: record.id, format: :json }
      after { expect(model.count).to eq(count) }

      it { expect(response.status).to eq(200) }
      it { expect(json_response).to eq(expected_record) }
    end

    context 'does not exist' do
      it { expect {get :show,id: 99,format: :json}.to raise_error(ActiveRecord::RecordNotFound) }
    end
  end
end
