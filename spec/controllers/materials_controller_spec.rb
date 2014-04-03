require 'spec_helper'

describe MaterialsController do
  it_behaves_like 'controllers/restful_resource' do
    let!(:invalid_factories) { Material::INVALID_TRAITS }
    let!(:valid_traits) { Material::VALID_TRAITS }
    let!(:attributes) { Material::ATTRIBUTES }
    let!(:resource) { :material }
    let!(:model) { Material }
  end
end
