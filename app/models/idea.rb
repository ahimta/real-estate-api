class Idea < ActiveRecord::Base
  belongs_to :trade, dependent: :destroy, touch: false, counter_cache: true
  validates :body, :trade_id, presence: true
end
