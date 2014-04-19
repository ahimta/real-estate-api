require 'spec_helper'

describe Api::V1::WorkersController do
  it_behaves_like 'controllers/restful_resource', Worker, 'worker'
end
