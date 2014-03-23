require 'spec_helper'

describe TradesController do
  it_behaves_like 'controllers/restful_resource' do
    let!(:attributes) { Trade::ATTRIBUTES }
    let!(:invalid_factories) { Trade::INVALID_TRAITS }
    let(:resource) { :trade }
    let(:model) { Trade }
  end
end
