require 'spec_helper'

shared_examples 'controllers/update' do |resource, model|
  let(:valid_resource) { "#{:valid}_#{resource}" }
  let(:invalid_resource) { "#{:invalid}_#{resource}" }

  describe '#update' do
    context 'valid' do
      let(:record) { FactoryGirl.create valid_resource }
      let(:params)  { {id: record.id, resource => FactoryGirl.attributes_for(resource)} }

      it do
        put :update, params, format: :json

        expect(response.status).to eq(200)
        expect(response.body).to eq(model.first.to_json)

        as = {}
        model.first.attributes.each do |k, v|
          as[k.to_sym] = v unless k == 'id' or k == 'created_at' or k == 'updated_at'
        end

        expect(params).to eq({id: record.id, resource => as})
      end
    end
    context 'invalid' do
      context 'exists' do
        let(:record) { FactoryGirl.create resource }
        let(:invalid_record) { FactoryGirl.build_stubbed(invalid_resource) }
        let(:params) { {id: record.id, resource => FactoryGirl.attributes_for(invalid_resource)} }

        it do
          put :update, params, format: :json

          expect(response.status).to eq(400)
          invalid_record.valid?
          expect(response.body).to eq(invalid_record.errors.to_json)
        end
      end
      context 'does not exist' do
        let(:stubbed_record) { FactoryGirl.build_stubbed(resource) }
        let(:params) { {id: stubbed_record.id, resource => FactoryGirl.attributes_for(resource)} }

        it do
          -> { put :update, params, format: :json }.should raise_error ActiveRecord::RecordNotFound
        end
      end
    end
  end
end
