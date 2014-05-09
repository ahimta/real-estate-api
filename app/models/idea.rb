class Idea < ActiveRecord::Base
  include BaseModelable

  @props = ModelProps.new(Idea, [Bodyable, Tradable], parents: [:Trade])
end
