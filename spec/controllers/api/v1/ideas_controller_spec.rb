require 'spec_helper'

describe Api::V1::IdeasController do
  it_behaves_like 'controllers/restful_resource' do
    let!(:invalid_factories) { Idea::INVALID_TRAITS }
    let!(:valid_traits) { Idea::VALID_TRAITS }
    let!(:attributes) { Idea::ATTRIBUTES }
    let!(:resource) { :idea }
    let!(:model) { Idea }
  end
end
