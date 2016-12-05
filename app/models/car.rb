class Car < ApplicationRecord
  belongs_to :train

  validates :car_type, :number, presence: true
  validate :number_exist

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
    self.number = numb == nil ? 1 : numb + 1
  end

  def number_exist
    if Car.where(train_id: train).where(number: number).count > 0
      errors.add(:base, "New Train number - #{number}. Number should not be equals")
    end
  end

end
