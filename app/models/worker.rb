class Worker < ActiveRecord::Base

  @props = ModelProps.new(Worker, [Namable,Shopable,Tradable, Identifyable],
    parents: [:Trade, :Shop])
  
  def self.props
    @props
  end
end
