class Trade < ActiveRecord::Base
  include Nameble

  ATTRIBUTES     = [:id] + Nameble::ATTRIBUTES + [:ideas_count,:shops_count,:workers_count,:materials_count]
  INVALID_TRAITS = Nameble::INVALID_TRAITS
  VALID_TRAITS   = Nameble::VALID_TRAITS

  has_many :ideas, dependent: :destroy
  has_many :shops, dependent: :destroy
  has_many :workers, dependent: :destroy
end
