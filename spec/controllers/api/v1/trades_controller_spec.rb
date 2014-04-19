require 'spec_helper'

describe Api::V1::TradesController do
  it_behaves_like 'controllers/restful_resource', Trade, 'trade'
end
