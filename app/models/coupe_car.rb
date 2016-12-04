class CoupeCar < SvCar
  validates :up_space, presence: true, numericality: { only_integer: true }
end