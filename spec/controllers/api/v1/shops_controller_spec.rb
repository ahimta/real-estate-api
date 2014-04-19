require 'spec_helper'

describe Api::V1::ShopsController do
  it_behaves_like 'controllers/restful_resource', Shop, 'shop'
end
