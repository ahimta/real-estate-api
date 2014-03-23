require 'spec_helper'

describe WorkersController do
  it_behaves_like 'controllers/restful_resource' do
    let!(:attributes) {
      [:id,:name,:phone,:lower_price,:higher_price,:rating,:notes,:shop_id,:trade_id]
    }
    let!(:invalid_factories) {
      [:without_name,:without_trade,:without_shop,
        :with_nonexistent_trade,:with_nonexistent_shop, :with_invalid_low_rating,
        :with_invalid_high_rating]
    }
    let!(:resource) { :worker }
    let!(:model) { Worker }
  end
end
