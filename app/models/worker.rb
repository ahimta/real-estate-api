class Worker < ActiveRecord::Base
  include Shopable
  include Tradable
  include Nameble
  include Rateble
end
