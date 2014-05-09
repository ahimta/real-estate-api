class Worker < ActiveRecord::Base
  include BaseModelable

  @props = ModelProps.new(Worker, [Namable,Shopable,Tradable, Identifyable],
    parents: [:Trade, :Shop])
end
