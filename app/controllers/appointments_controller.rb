class AppointmentsController < ApplicationController

  def new
    if patient_signed_in?
      @patient = Patient.find_by_id(current_patient.id)
      p "This is #{current_patient} and this is his/her id #{current_patient.id}"
    else
      redirect_to "/"
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
