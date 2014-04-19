require 'spec_helper'

shared_examples 'controllers/restful_resource' do |model, resource|

  args = [model, resource, model.props.attrs, model.props.valid_traits, model.props.invalid_traits]

  it_behaves_like 'controllers/index', *args

  it_behaves_like 'controllers/show', *args

  it_behaves_like 'controllers/create', *args

  it_behaves_like 'controllers/update', *args

  it_behaves_like 'controllers/destroy', *args
end
