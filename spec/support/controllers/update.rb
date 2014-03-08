require 'spec_helper'

shared_examples 'controllers/update' do |resource, model|
  let(:valid_resource) { "#{:valid}_#{resource}" }
  let(:invalid_resource) { "#{:invalid}_#{resource}" }

  describe '#update' do
    context 'valid' do
      let(:record) { FactoryGirl.create valid_resource }
      let(:params)  { {id: record.id, resource => get_record_attributes(FactoryGirl.build(valid_resource))} }

      it do
        put :update, params, format: :json

        expect(response.status).to eq(200)
        expect(response.body).to eq(model.first.to_json)

        expect({id: model.first.id, resource => get_record_attributes(model.first)}).to eq(params)
      end
    end
    context 'invalid' do
      context 'exists' do
        let(:record) { FactoryGirl.create resource }
        let(:invalid_record) { FactoryGirl.build_stubbed(invalid_resource) }
        let(:params) { {id: record.id, resource => get_record_attributes(FactoryGirl.build(invalid_resource))} }

        it do
          put :update, params, format: :json

          expect(response.status).to eq(400)
          invalid_record.valid?
          expect(response.body).to eq(invalid_record.errors.to_json)
        end
      end
      context 'does not exist' do
        let(:params) { {id: 99, resource => FactoryGirl.attributes_for(resource)} }

        it do
          -> { put :update, params, format: :json }.should raise_error ActiveRecord::RecordNotFound
        end
      end
    end
  end
end
