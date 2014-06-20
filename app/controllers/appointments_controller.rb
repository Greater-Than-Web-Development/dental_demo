class AppointmentsController < ApplicationController

  def new
    user = User.find_by_id(params(:id))
    user.appointments.update_attribute(:date, params(:date))

  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      flash[:success] = "Welcome!"
    else
      render 'new'
    end
  end


end
