module BaseModelable
  def base_modelable
    mixins.each { |mixin| include mixin }
  end

  def my_attrs
    [:id] + mixins_attrs + special_attrs + counter_caches
  end

  def my_safe_params
    mixins_attrs + special_attrs
  end

  def my_valid_traits
    my_reduce('VALID_TRAITS') + special_valid_traits
  end

  def my_invalid_traits
    my_reduce('INVALID_TRAITS') + special_invalid_traits
  end

  private

  def my_reduce(attr)
    mixins.reduce([]) { |acc, mixin| acc + eval("mixin::#{attr}") }
  end

  def mixins_attrs
    my_reduce 'ATTRIBUTES'
  end
end
