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
    if check_date_of_birth(params[:date_of_birth])
      render :success
    else
      render js: "alert('The Date of Birth you provided does not match our records for this patient. Please review your subission for errors and then resubmit or call our office at 1-860-379-4382');"
    end
    # @user.appointments.update_attribute(:date, params(:date))
    # @appointment = Appointment.new(appointment_params)
    # if @appointment.save
    #   flash[:success] = "Welcome!"
    # else
    #   render 'new'
    # end
  end


end
