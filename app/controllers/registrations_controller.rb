class RegistrationsController < Devise::RegistrationsController
  def new_doctor
    @user = Doctor.new
  end

  def create_doctor
    @user = Doctor.new(sign_up_params)
    if @user.save
      redirect_to doctor_dashboard_path
    else
      render :new_doctor
    end
  end

  def new_receptionist
    @user = Receptionist.new
  end

  def create_receptionist
    @user = Receptionist.new(sign_up_params)
    if @user.save
      redirect_to appointments_path
    else
      redirect_to root_path
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :full_name, :other_field, :name, :role, :phone_number, :specialization, :medical_license_number, :hospital_affiliation)
  end
end

