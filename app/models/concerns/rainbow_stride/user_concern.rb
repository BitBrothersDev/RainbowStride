module RainbowStride
  module UserConcern
    extend ActiveSupport::Concern

    included do
      has_many :exercises
    end
  end
end