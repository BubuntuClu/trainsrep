class SeatCar < Car
  validates :seat_space, presence: true, numericality: { only_integer: true }
end