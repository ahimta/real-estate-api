class Material < ActiveRecord::Base
  include Tradable
  include Shopable
  include Nameble
  include Rateble
end
