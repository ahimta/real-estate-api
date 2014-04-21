class Worker < ActiveRecord::Base

  def self.props
    @props ||= ModelProps.new(Worker, [Namable,Shopable,Tradable, Identifyable],
      parents: [:Trade, :Shop])
  end
end
