class AppointmentsController < ApplicationController
	before_action :authenticate_user!

  def index
    @appointments = Appointment.all
    # Becouse doctor and receptionist both are instances of user table model are diffrent and not made any direct association of user with any model.
    @my_appointments = Receptionist.find(current_user.id).appointments.all
  end

  def show
  end
  
  def new
    @appointment = Appointment.new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    @appointment = Appointment.new(appointment_params)

    if @patient.save
      @appointment.patient_id = @patient.id
      @appointment.receptionist_id = current_user.id 
      if @appointment.save
        redirect_to appointments_path(@appointment), notice: "Appointment created successfully"
      else
        @patient.destroy
        render :new
      end
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to appointment_path(@appointment), notice: "Appointment updated successfully"
    else
      render :edit
    end
  end

  def destroy
    @appointment.destroy
    redirect_to appointments_path, notice: "Appointment deleted successfully"
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(:appointment_date, :appointment_time, :appointment_type, :symptoms, :doctor_id)
  end

  def patient_params
    params.require(:appointment).require(:patient).permit(:name, :dob, :gender, :medical_conditions, :mobile_number, :address)
  end
end
