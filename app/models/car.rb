class Car < ApplicationRecord
  belongs_to :train

  validates :up_space, presence: true
  validates :car_type, presence: true
  validates :low_space, presence: true
end
