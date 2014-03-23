require 'spec_helper'

describe IdeasController do
  it_behaves_like 'controllers/restful_resource' do
    let!(:invalid_factories) { [:without_body, :without_trade, :with_nonexistent_trade] }
    let!(:attributes) { [:id,:body,:trade_id] }
    let!(:resource) { :idea }
    let!(:model) { Idea }
  end
end
