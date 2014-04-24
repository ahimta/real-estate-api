class Shop < ActiveRecord::Base

  @props = ModelProps.new(Shop, [Tradable,Namable,Identifyable],
    counter_caches: [:workers_count], parents: [:Trade])

  def self.props
    @props
  end

  has_many :workers, dependent: :destroy
end
