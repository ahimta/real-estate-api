class Trade < ActiveRecord::Base
  has_many :ideas, dependent: :destroy
  has_many :shops, dependent: :destroy
  validates :name, presence: true
end
