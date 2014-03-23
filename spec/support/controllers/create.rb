require 'spec_helper'

shared_examples 'controllers/create' do
  describe '#create' do
    before do
      expect(model.count).to be_zero
    end

    context 'valid' do
      let(:params) { {resource => get_record_attrs(FactoryGirl.build(resource),attributes)} }
      let(:expected_record) { get_record_attrs(record, attributes) }
      let(:record) { model.first }

      it do
        post :create, params, format: :json

        expect(response.status).to eq(201)
        expect(json_response).to eq(expected_record)

        expect(model.count).to eq(1)
      end
    end
    context 'invalid' do
      it do
        invalid_factories.each do |factory|
          params = {resource => get_record_attrs(FactoryGirl.build(resource, factory),attributes)}
          errors = get_record_errors(model, params[resource])

          post :create, params, format: :json

          expect(response.status).to eq(400)
          expect(response.body).to eq(errors)

          expect(model.count).to be_zero
        end
      end
    end
  end
end
