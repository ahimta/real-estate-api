require 'spec_helper'

describe ShopsController do
  it_behaves_like 'controllers/restful_resource' do
    let!(:attributes) {
      [:id,:name,:phone,:lower_price,:higher_price,:rating,:material_type,:notes,:workers_count,
        :trade_id]
    }
    let!(:invalid_factories) {
      [:without_name,:without_trade,:with_nonexistent_trade,
        :with_invalid_low_rating,:with_invalid_high_rating]
    }
    let(:resource) { :shop }
    let(:model) { Shop }
  end
end
