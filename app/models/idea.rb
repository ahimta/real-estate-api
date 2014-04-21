class Idea < ActiveRecord::Base
  default_scope { order('id') }

  def self.props
  	@props ||= ModelProps.new(Idea, [Bodyable, Tradable], parents: [:Trade])
  end
end
