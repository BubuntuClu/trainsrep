class Train < ApplicationRecord
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  belongs_to :route
  has_many :tickets
  has_many :cars

  validates :number, presence: true

  private

  # where shoul we use it in our app?
  # in view?
  def count_type_place(type, space_type)
    count = Car.where(car_type: "#{type}").sum(:space_type)
  end
end
