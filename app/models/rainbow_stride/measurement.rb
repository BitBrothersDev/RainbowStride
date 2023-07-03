module RainbowStride
  class Measurement < ApplicationRecord
    belongs_to :user, class_name: 'RainbowGate::User', foreign_key: :user_id

    enum measurement_type: { biceps: 'biceps', chest: 'chest', waist: 'waist', thigh: 'thigh', forearms: 'forearms' }
  end
end
