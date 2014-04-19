require 'spec_helper'

shared_examples 'controllers/create' do |model, resource, attributes, valid_traits, invalid_traits|
  describe '#create' do
    let(:create) { post :create, params, format: :json }
    
    before { expect(model.count).to be_zero }

    context 'valid' do
      valid_traits.each do |trait|
        let(:params) { {resource => get_record_attrs(FactoryGirl.build(resource, trait),attributes)} }
        let(:expected_record) { get_record_attrs(record, attributes) }
        let(:record) { model.unscoped.first }
        let(:count) { model.count }

        before { expect(model.count).to eq(count) }

        it { create }

        after { expect(json_response).to eq({resource => expected_record}) }
        after { expect(model.count).to eq(count + 1) }
        after { expect(response.status).to eq(201) }
      end
    end
    context 'invalid' do
      invalid_traits.each do |factory|
        let(:params) { {resource => get_record_attrs(FactoryGirl.build(resource, factory),attributes)} }
        let(:errors) { get_record_errors(model, params[resource]) }

        it { create }

        after { expect(response.body).to eq(errors) }
        after { expect(response.status).to eq(400) }
        after { expect(model.count).to be_zero }
      end
    end
  end
end
