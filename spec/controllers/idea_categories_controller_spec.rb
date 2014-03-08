require 'spec_helper'

describe IdeaCategoriesController do
  it_behaves_like 'controllers/index', :idea_category

  it_behaves_like 'controllers/show', :idea_category

  it_behaves_like 'controllers/create', :idea_category, IdeaCategory

  it_behaves_like 'controllers/update', :idea_category, IdeaCategory

  it_behaves_like 'controllers/destroy', :idea_category, IdeaCategory
end
