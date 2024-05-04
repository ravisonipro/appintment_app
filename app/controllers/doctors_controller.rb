class DoctorsController < ApplicationController
  before_action :authenticate_user!

  def dashboard
    @appointments = Doctor.find(current_user.id).appointments
    # @patients = current_user.patients
    @appointments_count = @appointments.group_by_day_of_week(:created_at, format: "%a").count
  end
end
