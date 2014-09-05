class AppointmentsController < ApplicationController

  def index
    render 'index', layout: "appointments"
  end


  def new
    if patient_signed_in?
      render 'new', layout: "appointments"
    else
      redirect_to new_patient_session_path
    end

  end

  def create
    #TODO user appointment object form, and separate :patient object form
    if current_patient.check_birthday(params[:appointment][:birthday]) && current_patient.check_email(params[:appointment][:email])
     @appointment_request = AppointmentRequest.new(patient_id: current_patient.id, date: params[:date], appointment_type: params[:appointment][:appointment_type])
      render :success
    else
      redirect_to new_appointment_path, layout: "appointments", :flash => { :error => "The Date of Birth you provided does not match our records for this patient. Please review your submission for errors and then resubmit or call our office at 1-860-379-4382" }
    end
  end

end
