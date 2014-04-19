module Namable
  extend ActiveSupport::Concern

  ATTRIBUTES     = [:name]
  INVALID_TRAITS = [:without_name]
  VALID_TRAITS   = [:with_name]

  included do
  	default_scope { order('name') }
  	
    validates :name, presence: true
  end
end