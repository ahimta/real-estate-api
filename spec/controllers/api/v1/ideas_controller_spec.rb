require 'spec_helper'

describe Api::V1::IdeasController do
  it_behaves_like 'controllers/restful_resource', Idea, 'idea'
end
