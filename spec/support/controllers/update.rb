require 'spec_helper'

shared_examples 'controllers/update' do
  describe '#update' do
    let(:update) { put :update, params, format: :json }

    context 'exists' do
      let!(:count) { 7 }
      let!(:records) { FactoryGirl.create_list resource, count }
      let(:id) { model.first.id }

      context 'valid' do
        let(:params) { {'id'=>id,resource=>get_record_attributes(FactoryGirl.build(resource))} }
        let(:expected) {
          h = params[resource]
          h['id'] = id
          h
        }
        it do
          expect(model.count).to eq(count)

          update

          expect(response.status).to eq(200)
          expect(json_response).to eq({resource.to_s => expected})

          expect(model.count).to eq(count)
        end
      end
      context 'invalid' do
        it do
          invalid_factories.each do |trait|
            expect(model.count).to eq(count)

            params   = {'id'=>id,resource=>get_record_attributes(FactoryGirl.build(resource,trait))}
            expected = get_record_errors(model, params[resource])

            put :update, params, format: :json

            expect(response.status).to eq(400)
            expect(response.body).to eq(expected)

            expect(model.count).to eq(count)
          end
        end
      end
    end
    context 'does not exist' do
      let(:params) { {id:99,resource=>get_record_attributes(FactoryGirl.build(resource))} }

      it { expect { update }.to raise_error(ActiveRecord::RecordNotFound) }
    end
  end
end
