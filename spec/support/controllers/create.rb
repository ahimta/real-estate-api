require 'spec_helper'

shared_examples 'controllers/create' do |resource, model|
  describe '#create' do
    let(:valid_resource) { "#{:valid}_#{resource}" }
    let(:invalid_resource) { "#{:invalid}_#{resource}" }
    before { post :create, params, format: :json }

    context 'valid' do
      let(:params)  { {resource => FactoryGirl.attributes_for(valid_resource)} }

      it do
        expect(response.status.should).to eq(201)
        expect(response.body).to eq(model.first.to_json)

        as = {}
        model.first.attributes.each { |k,v| as[k.to_sym] = v }
        as.delete :id
        as.delete :created_at
        as.delete :updated_at

        expect(model.count).to eq(1)
        expect(params).to eq({resource => as})
      end
    end
    context 'invalid' do
      let(:record) { FactoryGirl.build invalid_resource }
      let(:params)  { {resource => FactoryGirl.attributes_for(invalid_resource)} }

      it do
        expect(response.status).to eq(400)
        record.valid?
        expect(response.body).to eq(record.errors.to_json)

        model.count.should == 0
      end
    end
  end
end
