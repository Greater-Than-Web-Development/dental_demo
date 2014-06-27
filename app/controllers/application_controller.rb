class ApplicationController < ActionController::Base
  protect_from_forgery


  protected

  def after_sign_in_path_for(patient)
    patient_session[:id] = current_patient.id
    patient_session[:email] = current_patient.email
    patient_session[:first_name] = current_patient.first_name
    root_path
  end
end
