module Notable
  extend ActiveSupport::Concern

  ATTRIBUTES     = [:notes]
  INVALID_TRAITS = []
  VALID_TRAITS   = [:with_notes,:without_notes]
end