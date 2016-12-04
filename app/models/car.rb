class Car < ApplicationRecord
  belongs_to :train

  validates :car_type, :number, presence: true 
  validates :up_space, :low_space, presence: true, numericality: { only_integer: true }

  default_scope { order(:number) }
  scope :plazkart, -> { where(car_type: 'PlazkartCar') }
  scope :coupe, -> { where(car_type: 'CoupeCar') }
end
