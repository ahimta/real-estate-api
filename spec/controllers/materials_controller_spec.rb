require 'spec_helper'

describe MaterialsController do
  it_behaves_like 'controllers/restful_resource' do
    let!(:attributes) { Material::ATTRIBUTES }
    let!(:invalid_factories) { Material::INVALID_TRAITS }
    let!(:resource) { :material }
    let!(:model) { Material }
  end
end
