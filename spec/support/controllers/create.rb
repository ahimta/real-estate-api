require 'spec_helper'

shared_examples 'controllers/create' do |resource, model|
  describe '#create' do
    let(:valid_resource) { "#{:valid}_#{resource}" }
    let(:invalid_resource) { "#{:invalid}_#{resource}" }
    before { post :create, params, format: :json }

    context 'valid' do
      let(:params)  { {resource => get_record_attributes(FactoryGirl.build(valid_resource))} }

      it do
        expect(response.status).to eq(201)
        expect(response.body).to eq(model.first.to_json)

        expect(model.count).to eq(1)
        expect({resource => get_record_attributes(model.first)}).to eq(params)
      end
    end
    context 'invalid' do
      let(:record) { FactoryGirl.build invalid_resource }
      let(:params)  { {resource => get_record_attributes(record)} }

      it do
        expect(response.status).to eq(400)
        record.valid?
        expect(response.body).to eq(record.errors.to_json)

        expect(model.count).to eq(0)
      end
    end
  end
end
