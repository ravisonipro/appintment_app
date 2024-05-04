class Patient < ApplicationRecord
  has_many :appointments
  has_many :doctors, through: :appointments
  has_many :receptionist, through: :appointments
end
