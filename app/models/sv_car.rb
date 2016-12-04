class SvCar < Car  
  validates :low_space, presence: true, numericality: { only_integer: true }
end