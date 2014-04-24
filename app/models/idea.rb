class Idea < ActiveRecord::Base

  default_scope { order('id') }

  @props = ModelProps.new(Idea, [Bodyable, Tradable], parents: [:Trade])

  def self.props
  	@props
  end
end
