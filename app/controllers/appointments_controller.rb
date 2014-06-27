class AppointmentsController < ApplicationController

  def new
    if patient_signed_in?
      @patient = Patient.find_by_id(current_patient.id)
      @appointment_request = AppointmentRequest.new
      patient_session[:id] = current_patient.id
      patient_session[:email] = current_patient.email
      patient_session[:first_name] = current_patient.first_name
      render 'new', layout: "appointments"
    else
      redirect_to new_patient_session_path
    end

  end

  def create
    p "These are my params: #{params[:afternoon]}"
    p patient_session
    p patient_session[:email]
    if current_patient.check_date_of_birth(params[:date_of_birth]) && current_patient.check_email(params[:email])
      AppointmentRequest.new(patient_id: current_patient.id, date: params[:date], appointment_type: params[:appointment_type])
      render :success
    else
      redirect_to new_appointment_path, layout: "appointments", :flash => { :error => "The Date of Birth you provided does not match our records for this patient. Please review your submission for errors and then resubmit or call our office at 1-860-379-4382" }
    end
  end


end
