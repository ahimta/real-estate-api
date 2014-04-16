require 'spec_helper'

shared_examples 'controllers/create' do
  describe '#create' do
    before { expect(model.count).to be_zero }

    context 'valid' do
      it do
        valid_traits.each do |trait|
          params = {resource => get_record_attrs(FactoryGirl.build(resource, trait),attributes)}
          count = model.count

          post :create, params, format: :json

          record = model.first
          expected_record = get_record_attrs(record, attributes)

          expect(response.status).to eq(201)
          expect(json_response).to eq({resource.to_s => expected_record})

          expect(model.count).to eq(count + 1)
        end
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
