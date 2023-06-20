module RainbowStride
  class Level < ApplicationRecord
    has_many :exercises, :class_name => 'RainbowStride::Exercise', foreign_key: :rainbow_stride_level_id
  end
end
