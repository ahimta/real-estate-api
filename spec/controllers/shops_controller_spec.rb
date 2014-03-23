require 'spec_helper'

describe ShopsController do
  it_behaves_like 'controllers/restful_resource' do
    let!(:attributes) { Shop::ATTRIBUTES }
    let!(:invalid_factories) { Shop::INVALID_TRAITS }
    let(:resource) { :shop }
    let(:model) { Shop }
  end
end
