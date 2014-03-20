class Shop < ActiveRecord::Base
  belongs_to :trade, touch: true, counter_cache: true
end
