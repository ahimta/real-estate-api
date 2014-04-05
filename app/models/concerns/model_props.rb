class ModelProps
  attr_reader :safe_params, :valid_traits, :invalid_traits, :attrs

  def initialize(model, mixins, options={})

    parents = options[:parents] || []
    counter_caches = options[:counter_caches] || []
    attrs = options[:attrs] || []
    valid_traits = options[:valid_traits] || []
    invalid_traits = options[:invalid_traits] || []

    @mixins = mixins
    mixins_attrs = my_reduce 'ATTRIBUTES'
    @attrs = [:id] + mixins_attrs + attrs + counter_caches
    @safe_params = mixins_attrs + attrs
    @valid_traits = my_reduce('VALID_TRAITS') + valid_traits
    @invalid_traits = my_reduce('INVALID_TRAITS') + invalid_traits

    handle_model!(model, mixins, parents)
  end

  def handle_model!(model, mixins, parents)
    model.class_eval do
      mixins.each { |mixin| include mixin }
      parents.each do |parent|
        validates "#{parent.to_s.downcase}_id".to_sym, presence: true,
          inclusion: { in: ->(record) {parent.to_s.constantize.ids} }

        belongs_to parent.to_s.downcase.to_sym, touch: true, counter_cache: true
      end
    end
  end

  private

  def my_reduce(attr)
    @mixins.reduce([]) { |acc, mixin| acc + eval("mixin::#{attr}") }
  end
end
