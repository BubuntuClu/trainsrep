class PlazkartCar < Car
  validates :side_up_space, :side_low_space, presence: true
end