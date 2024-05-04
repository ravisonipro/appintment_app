class ApplicationController < ActionController::Base
	
	private

  def after_sign_in_path_for(user)
    if user.role == 'doctor'
      doctors_dashboard_path
    elsif user.role == 'receptionist'
    	new_appointment_path(user)
    else
      root_path
    end
  end
  
end
