class Shop < ActiveRecord::Base
  include Acquaintanceable
  include Tradable

  has_many :workers, dependent: :destroy
end
