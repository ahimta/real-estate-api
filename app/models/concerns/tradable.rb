module Tradable
  extend ActiveSupport::Concern

  ATTRIBUTES     = [:trade_id]
  INVALID_TRAITS = [:with_nonexistent_trade,:without_trade]
  VALID_TRAITS   = [:with_trade]
end