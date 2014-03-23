class Shop < ActiveRecord::Base
  include Tradable
  include Nameble
  include Rateble

  has_many :workers, dependent: :destroy
end
