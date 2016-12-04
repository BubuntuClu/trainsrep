class PlazkartCar < CoupeCar
  validates :side_up_space, :side_low_space, presence: true, numericality: { only_integer: true }
end