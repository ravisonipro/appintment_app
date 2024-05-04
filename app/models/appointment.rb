class Appointment < ApplicationRecord
  include Groupdate
  
  belongs_to :doctor
  belongs_to :patient
  belongs_to :receptionist
end
