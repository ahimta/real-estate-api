require 'spec_helper'

shared_examples 'controllers/update' do |model, resource, attributes, valid_traits, invalid_traits|
  describe '#update' do
    let(:update) { put :update, params, format: :json }

    context 'exists' do
      let!(:count) { 3 }
      let!(:records) { FactoryGirl.create_list resource, count }
      let(:id) { model.first.id }

      before { expect(model.count).to eq(count) }
      after { expect(model.count).to eq(count) }

      context 'valid' do
        let(:params) { {'id'=>id,resource=>get_record_attributes(FactoryGirl.build(resource))} }
        let(:expected) {
          h = params[resource]
          h['id'] = id
          h
        }

        it { update }

        after { expect(json_response).to eq({resource => expected}) }
        after { expect(response.status).to eq(200) }
      end
      context 'invalid' do
        invalid_traits.each do |trait|
          let(:params) { {'id'=>id,resource=>get_record_attributes(FactoryGirl.build(resource,trait))} }
          let(:expected) { get_record_errors(model, params[resource]) }

          it { update }

          after { expect(response.body).to eq(expected) }
          after { expect(response.status).to eq(400) }
        end
      end
    end
    context 'does not exist' do
      let(:params) { {id:99,resource=>get_record_attributes(FactoryGirl.build(resource))} }

      it { expect { update }.to raise_error(ActiveRecord::RecordNotFound) }
    end
  end
end
