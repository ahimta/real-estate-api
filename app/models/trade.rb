class Trade < ActiveRecord::Base
  has_many :ideas, dependent: :destroy
  validates :name, presence: true
end
