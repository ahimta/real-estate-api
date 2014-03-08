require 'spec_helper'

shared_examples 'controllers/destroy' do |resource, model|
  describe '#destroy' do
    context 'exists' do
      let!(:record) { FactoryGirl.create resource }

      it do
        expect(model.count).to eq(1)

        delete :destroy, id: record.id, format: :json

        expect(response.status).to eq(200)
        expect(response.body).to eq(record.to_json)

        expect(model.count).to eq(0)
      end
    end
    context 'does not exist' do
      it do
        expect(-> { delete :destroy, id: 99, format: :json }).
          to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
