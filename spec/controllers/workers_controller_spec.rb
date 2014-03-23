require 'spec_helper'

describe WorkersController do
  it_behaves_like 'controllers/restful_resource' do
    let!(:attributes) { Worker::ATTRIBUTES }
    let!(:invalid_factories) { Worker::INVALID_TRAITS }
    let!(:resource) { :worker }
    let!(:model) { Worker }
  end
end
