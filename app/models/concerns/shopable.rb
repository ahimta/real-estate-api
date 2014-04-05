module Shopable
  extend ActiveSupport::Concern

  ATTRIBUTES     = [:shop_id]
  INVALID_TRAITS = [:without_shop,:with_nonexistent_shop]
  VALID_TRAITS   = [:with_shop]
end