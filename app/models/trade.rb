class Trade < ActiveRecord::Base

  @props = ModelProps.new(Trade, [Namable],
    counter_caches: [:ideas_count,:shops_count,:workers_count])

  def self.props
    @props
  end

  has_many :ideas, dependent: :destroy
  has_many :shops, dependent: :destroy
  has_many :workers, dependent: :destroy
end
