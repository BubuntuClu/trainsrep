class Car < ApplicationRecord
  belongs_to :train

  validates :car_type, presence: true 
  validates :up_space, presence: true, numericality: { only_integer: true }
  validates :low_space, presence: true, numericality: { only_integer: true }
end
