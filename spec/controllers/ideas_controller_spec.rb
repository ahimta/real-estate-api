require 'spec_helper'

describe IdeasController do
  it_behaves_like 'controllers/index', :idea

  it_behaves_like 'controllers/show', :idea

  it_behaves_like 'controllers/create', :idea, Idea

  it_behaves_like 'controllers/update', :idea, Idea

  it_behaves_like 'controllers/destroy', :idea, Idea
end
