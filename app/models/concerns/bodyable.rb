module Bodyable
  extend ActiveSupport::Concern

  ATTRIBUTES     = [:body]
  INVALID_TRAITS = [:without_body]
  VALID_TRAITS   = [:with_body]

  included do
    validates :body, presence: true
  end
end