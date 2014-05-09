module BaseModelable
  extend ActiveSupport::Concern

  included do
    default_scope -> { order('id desc') }
  end

  module ClassMethods
    def props
      @props
    end    
  end
end
