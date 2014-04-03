require 'spec_helper'

describe TradesController do
  it_behaves_like 'controllers/restful_resource' do
    let!(:invalid_factories) { Trade::INVALID_TRAITS }
    let!(:valid_traits) { Trade::VALID_TRAITS }
    let!(:attributes) { Trade::ATTRIBUTES }
    let(:resource) { :trade }
    let(:model) { Trade }
  end
end
