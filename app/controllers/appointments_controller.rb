class AppointmentsController < ApplicationController

  def new
    if patient_signed_in?
      @patient = Patient.find_by_id(current_patient.id)
      patient_session[:id] = current_patient.id
      patient_session[:email] = current_patient.email
      patient_session[:first_name] = current_patient.first_name
      render 'new'
    else
      redirect_to new_patient_session_path
    end

  end

  def create
    # @user.appointments.update_attribute(:date, params(:date))
    # @appointment = Appointment.new(appointment_params)
    # if @appointment.save
    #   flash[:success] = "Welcome!"
    # else
    #   render 'new'
    # end
  end


end
