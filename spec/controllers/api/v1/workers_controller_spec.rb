require 'spec_helper'

describe Api::V1::WorkersController do
  it_behaves_like 'controllers/restful_resource' do
    let!(:invalid_factories) { Worker::INVALID_TRAITS }
    let!(:valid_traits) { Worker::VALID_TRAITS }
    let!(:attributes) { Worker::ATTRIBUTES }
    let!(:resource) { :worker }
    let!(:model) { Worker }
  end
end
