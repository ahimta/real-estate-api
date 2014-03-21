class Idea < ActiveRecord::Base
  include Tradable

  validates :body, presence: true
end
