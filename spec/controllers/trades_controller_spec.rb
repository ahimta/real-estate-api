require 'spec_helper'

describe TradesController do
  it_behaves_like 'controllers/restful_resource' do
    let!(:attributes) { [:id,:name,:description,:shops_count,:ideas_count,:workers_count] }
    let!(:invalid_factories) { [:without_name] }
    let(:resource) { :trade }
    let(:model) { Trade }
  end
end
