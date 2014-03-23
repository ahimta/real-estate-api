module Phonable
  extend ActiveSupport::Concern

  ATTRIBUTES     = [:phone]
  INVALID_TRAITS = []
  VALID_TRAITS   = [:with_phone,:without_phone]
end