require 'spec_helper'

shared_examples 'controllers/index' do |resource|
  describe '#index' do
    let!(:records) { FactoryGirl.create_list resource, 7 }

    it do
      get :index
      expect(response.status).to eq(200)
      expect(response.body).to eq(records.to_json)
    end
  end
end
