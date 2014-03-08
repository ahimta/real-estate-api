class Trade < ActiveRecord::Base
  has_many :ideas, dependent: :destroy
  validates :name, :description, presence: true
end
