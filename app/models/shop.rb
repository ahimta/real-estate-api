class Shop < ActiveRecord::Base

  def self.props
    @props ||= ModelProps.new(Shop, [Tradable,Namable,Identifyable],
      counter_caches: [:workers_count], parents: [:Trade])
  end

  has_many :workers, dependent: :destroy
end
