class Shop < ActiveRecord::Base
  include BaseModelable

  @props = ModelProps.new(Shop, [Tradable,Namable,Identifyable],
    counter_caches: [:workers_count], parents: [:Trade])

  has_many :workers, dependent: :destroy
end
