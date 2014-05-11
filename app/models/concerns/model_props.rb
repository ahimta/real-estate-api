class ModelProps
  attr_reader :safe_params, :valid_traits, :invalid_traits, :attrs, :counter_caches

  def initialize(model, mixins, options={})

    parents = options[:parents] || []
    @counter_caches = options[:counter_caches] || []
    attrs = options[:attrs] || []
    valid_traits = options[:valid_traits] || []
    invalid_traits = options[:invalid_traits] || []

    @mixins = mixins
    mixins_attrs = my_reduce 'ATTRIBUTES'
    @attrs = [:id] + mixins_attrs + attrs + counter_caches
    @safe_params = mixins_attrs + attrs
    @valid_traits = my_reduce('VALID_TRAITS') + valid_traits
    @invalid_traits = my_reduce('INVALID_TRAITS') + invalid_traits
    @model = model

    ref_intgerify(mixins, parents)
    include_mixins mixins
  end

  private

  def include_mixins(mixins)
    mixins.each { |mixin| @model.include mixin }
  end

  def ref_intgerify(mixins, parents)
    parents.each do |parent|
      parent = parent.to_s
      parent_model = parent.constantize

      @model.validates "#{parent.downcase}_id", presence: true,
        inclusion: { in: ->(record) {parent_model.ids} }

      @model.belongs_to parent.to_s.downcase.to_sym, touch: true, counter_cache: true
    end
  end

  def my_reduce(attr)
    @mixins.reduce([]) { |acc, mixin| acc + mixin.const_get(attr) }
  end
end
