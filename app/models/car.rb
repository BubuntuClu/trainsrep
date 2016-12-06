class Car < ApplicationRecord
  belongs_to :train

  validates :car_type, :number, presence: true
  validates :number, uniqueness: { scope: :train_id }

  scope :asc, -> { order(:number) }
  scope :desc, -> { order('number DESC') }
  scope :plazkart, -> { where(car_type: 'PlazkartCar') }
  scope :coupe, -> { where(car_type: 'CoupeCar') }
  scope :SV, -> { where(car_type: 'SVCar') }
  scope :seat, -> { where(car_type: 'SeatCar') }

  before_validation :set_number

  private

  def set_number
    numb = Car.where(train_id: train).maximum(:number)
    self.number = numb ? numb + 1 : 1
  end

end
