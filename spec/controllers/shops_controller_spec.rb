require 'spec_helper'

describe ShopsController do
  it_behaves_like 'controllers/restful_resource' do
    let!(:invalid_factories) { Shop::INVALID_TRAITS }
    let!(:valid_traits) { Shop::VALID_TRAITS }
    let!(:attributes) { Shop::ATTRIBUTES }
    let(:resource) { :shop }
    let(:model) { Shop }
  end
end
