require 'spec_helper'

shared_examples 'controllers/show' do |resource|
  describe '#show' do
    context 'exists' do
      let!(:record) { FactoryGirl.create resource }

      it do
        get :show, id: record.id

        expect(response.status).to eq(200)
        expect(response.body).to eq(record.to_json)
      end
    end
    context 'does not exist' do
      it { expect(-> { get :show, id: 99 }).to raise_error(ActiveRecord::RecordNotFound) }
    end
  end
end
