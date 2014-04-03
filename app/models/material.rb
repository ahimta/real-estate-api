class Material < ActiveRecord::Base
  extend BaseModelable

  def self.mixins
    [Nameble,Notable,Priceble,Rateble,Shopable,Tradable]
  end

  base_modelable

  class << self
    def counter_caches
      []
    end

    def special_attrs
      [:material_type]
    end

    def special_valid_traits
      []
    end

    def special_invalid_traits
      []
    end
  end

  ATTRIBUTES     = self.my_attrs
  SAFE_PARAMS    = self.my_safe_params
  INVALID_TRAITS = self.my_invalid_traits
  VALID_TRAITS   = self.my_valid_traits
end
