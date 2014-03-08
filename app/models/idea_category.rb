class IdeaCategory < ActiveRecord::Base
  has_many :ideas, dependent: :destroy
  validates :name, :description, presence: true
end
