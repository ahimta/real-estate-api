require 'spec_helper'

describe TradesController do
  it_behaves_like 'controllers/index', :trade

  it_behaves_like 'controllers/show', :trade

  it_behaves_like 'controllers/create', :trade, Trade

  it_behaves_like 'controllers/update', :trade, Trade

  it_behaves_like 'controllers/destroy', :trade, Trade
end
