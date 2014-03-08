class Trade < ActiveRecord::Base
  has_many :ideas
  validates :name, :description, presence: true
end
