require 'spec_helper'

shared_examples 'controllers/restful_resource' do
  it_behaves_like 'controllers/index'

  it_behaves_like 'controllers/show'

  it_behaves_like 'controllers/create'

  it_behaves_like 'controllers/update'

  it_behaves_like 'controllers/destroy'
end
