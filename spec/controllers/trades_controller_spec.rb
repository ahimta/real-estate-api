require 'spec_helper'

describe TradesController do
  it_behaves_like 'controllers/index', :trade

  it_behaves_like 'controllers/show', :trade

  it_behaves_like 'controllers/create', :trade, Trade

  it_behaves_like 'controllers/update', :trade, Trade

  it_behaves_like 'controllers/destroy', :trade, Trade

  describe '#destroy' do
    let!(:record) { FactoryGirl.create :trade_with_ideas }

    it do
      expect(Trade.count).to eq(1)
      expect(Idea.count).to be > 1

      delete :destroy, id: record.id


      expect(Trade.count).to eq(0)
      expect(Idea.count).to eq(0)
    end
  end
end
